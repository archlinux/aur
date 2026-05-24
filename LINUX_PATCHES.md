# Vortex Linux Patches — vortex-linux-fix

**Maintainer:** k8rit0 \<angelalvarezferrero@gmail.com\>  
**Based on:** [Nexus-Mods/Vortex](https://github.com/Nexus-Mods/Vortex) v2.0.0  
**Package name:** `vortex-linux-fix` (AUR)  
**Current release:** 1:2.0.1-15  
**Linux Compatibility extension:** https://www.nexusmods.com/site/mods/1924

---

## Why this fork exists

The official Vortex release builds for Linux but ships with several hardcoded Windows
assumptions that cause concrete failures:

1. The game executable browser filters for `.exe` only — the picker is empty on Linux.
2. The `requiredFiles` validator rejects games whose files have `.x86_64` extensions.
3. `identifyStore` throws an unhandled error, crashing the browse-game-location flow.
4. `util.epicGamesLauncher` is `undefined` on Linux; plugins that don't null-check it crash.
5. `winapi-bindings` returns `{}` on Linux; calls to its functions throw unhelpful errors.
6. Several bundled game plugins hardcode Windows binary paths even for games with native Linux ports.
7. Third-party extensions (e.g. the Cyberpunk 2077 extension) use Windows path separators
   (`\\`) in `path.join()` calls, which are treated as literal characters on Linux.

All patches are applied at package time inside `package()` of the PKGBUILD.
The patch logic lives in two external source files verified by sha256:

- `patch-asar.py` — patches `app.asar` and `bundledPlugins/`
- `patch-pkg.js` — patches `package.json` during `prepare()` and `build()`

---

## Architecture of the patch system

`patch-asar.py` (called from `package()`) runs a single Python script that:

1. **Patches bundled plugin files** in `app.asar.unpacked/bundledPlugins/` directly
   (readable JS/CJS files — no asar manipulation needed).

2. **Patches the asar** for two files inside `resources/app.asar`:
   
   - `node_modules/winapi-bindings/index.js` — patched first (highest offset in file)
   - `renderer.js` — patched second (lower offset)
   
   The order matters: patching from highest to lowest offset ensures that when
   `update_offsets()` adjusts all entries after the pivot, already-adjusted entries
   are correctly shifted again. The asar is written once at the end.

3. The marker `// vortex-linux-fix-v8` is prepended to `renderer.js`. On re-runs,
   the old marker is stripped before patches are re-applied (idempotent).

---

## Patches applied to `renderer.js` (inside `app.asar`)

### 1 — File browser filter: accept Linux executables

**Problem:** The `showOpenDialog` call for selecting a game executable uses
`filters: [{ name: "Executables", extensions: ["exe"] }]`. On Linux no `.exe` files
exist, so the file picker shows nothing. The actual filter array in the bundle is
`[{ name: "Images", ... }, { name: "Executables", extensions: ["exe"] }]`.

**Fix:** On Linux the extensions become `["x86_64", "x86", "sh", "*"]`.

```js
// before
filters:[{name:"Images",extensions:["png","jpg","ico"]},{name:"Executables",extensions:["exe"]}]

// after
filters:[{name:"Images",extensions:["png","jpg","ico"]},{name:"Executables",extensions:"linux"===process.platform?["x86_64","x86","sh","*"]:["exe"]}]
```

---

### 2 — `verifyToolDir` + `requiredFiles` validator: `.exe` → `.x86_64` fallback

**Problem:** Vortex validates game installations in two places by `stat`-ing each path in `requiredFiles`:

- `verifyToolDir(tool, testPath)` — called by `assertToolDir` every time the active game mode
  changes (i.e. when switching profiles or clicking a game tab). Uses `bluebird.mapSeries`.
- `verifyGamePath(game, gamePath)` — called from `browseGameLocation` when browsing for a game
  manually. Uses `bluebird.map`.

Both functions check for `.exe` files. On Linux, games with native clients ship `.x86_64`
binaries instead, so validation fails with "game directory not valid" → "Failed to set game
mode", preventing the game tab and profile from loading.

**Fix:** On Linux, if `stat()` fails for a `.exe` path, retry with `.x86_64` in both functions.

```js
// verifyToolDir — before
function verifyToolDir(tool, testPath) {
  return bluebird_1.default.mapSeries(tool.requiredFiles,
    fileName => fsExtra.stat(path.join(testPath, fileName))
                       .catch(err => bluebird_1.default.reject(err))
  ).then(() => {})
}

// verifyToolDir — after
function verifyToolDir(tool, testPath) {
  return bluebird_1.default.mapSeries(tool.requiredFiles,
    fileName => "linux" === process.platform
      ? fsExtra.stat(path.join(testPath, fileName))
               .catch(() => fsExtra.stat(path.join(testPath, fileName.replace(/\.exe$/i, ".x86_64"))))
      : fsExtra.stat(path.join(testPath, fileName))
               .catch(err => bluebird_1.default.reject(err))
  ).then(() => {})
}

// verifyGamePath — before
requiredFiles||[],file=>bluebird_1.default.resolve(
  fsExtra.stat(path.join(gamePath,file))
)).then(()=>{}).catch(err=>{if("ENOENT"===err.code)return bluebird_1.default.reject(err)})

// verifyGamePath — after
requiredFiles||[],file=>bluebird_1.default.resolve(
  "linux"===process.platform
    ?fsExtra.stat(path.join(gamePath,file))
        .catch(()=>fsExtra.stat(path.join(gamePath,file.replace(/\.exe$/i,".x86_64"))))
    :fsExtra.stat(path.join(gamePath,file))
)).then(()=>{}).catch(err=>{if("ENOENT"===err.code)return bluebird_1.default.reject(err)})
```

| Scenario                     | Without patch (verifyToolDir)         | With patch |
| ---------------------------- | ------------------------------------- | ---------- |
| Proton/Wine (`.exe` present) | ✓                                     | ✓          |
| Native Linux (`.x86_64`)     | ✗ "Failed to set game mode" on switch | ✓          |

---

### 3 — `StarterInfo.initFromGame`: resolve the actual Linux executable

**Problem:** When Vortex builds the launch command it stores `gameDiscovery.executable`
(always a `.exe` path) verbatim. On Linux this results in trying to exec a non-existent file.

**Fix:** On Linux, walk through a priority list of real executable candidates.

```js
// after (IIFE replacing the direct path.join assignment)
this.exePath = (() => {
  const r = gameDiscovery.executable || game.executable;
  const f = path.join(gameDiscovery.path, r);
  if ("linux" !== process.platform || !r || !/\.exe$/i.test(r) || fs.existsSync(f)) return f;

  const f86 = path.join(gameDiscovery.path, r.replace(/\.exe$/i, ".x86_64"));
  if (fs.existsSync(f86)) return f86;                         // 1. same name with .x86_64

  const fSh = path.join(gameDiscovery.path, "linux", "run-client.sh");
  if (fs.existsSync(fSh)) return fSh;                         // 2. linux/run-client.sh

  const fBin = path.join(gameDiscovery.path, "linux", path.basename(r, path.extname(r)));
  if (fs.existsSync(fBin)) return fBin;                       // 3. linux/<basename>

  return f; // fallback — let the OS error surface naturally
})()
```

| Game                      | Plugin executable           | Resolved on Linux                    |
| ------------------------- | --------------------------- | ------------------------------------ |
| Cyberpunk 2077 (Proton)   | `bin/x64/Cyberpunk2077.exe` | unchanged (`.exe` exists via Proton) |
| Graveyard Keeper (native) | `Graveyard Keeper.exe`      | → `Graveyard Keeper.x86_64`          |
| Generic native `linux/`   | `game.exe`                  | → `linux/game`                       |

---

### 4 — `browseGameLocation`: skip `identifyStore` on Linux

**Problem:** After the user selects a game folder, Vortex calls
`GameStoreHelper.identifyStore()` to detect the owning store. This throws an
unhandled rejection on Linux, crashing the flow before the path is saved.

**Fix:** Bypass `identifyStore` entirely on Linux and resolve with `store: "steam"`
as a safe default (store attribution is cosmetic; Vortex works correctly either way).

```js
// before
.then(corrected => function manualGameStoreSelection(api, correctedGamePath) {
  ...identifyStore(correctedGamePath)...
})

// after
.then(corrected =>
  "linux" === process.platform
    ? bluebird_1.default.resolve({ corrected, store: "steam" })
    : function manualGameStoreSelection(api, correctedGamePath) {
        ...identifyStore(correctedGamePath)...
      }
)
```

---

### 9 & 10 — Generic .NET game version detection on Linux

**Problem:** Vortex detects installed game versions by reading the PE version resource from
the game's `.exe` file (`testExecProvider` / `getExecGameVersion` in `renderer.js`). On Linux,
.NET-based games (Stardew Valley, and any other game built with .NET Core/5+) ship a native
ELF binary or a shell script — neither of which has PE version metadata. As a result:

- `testExecProvider` returns `false` (version reads as "0.0.0", provider not selected).
- The fallback provider returns "0.0.0" unchanged.
- The Nexus Collections dialog "Game version mismatch" shows **"Your game version:"** empty,
  even when the installed version exactly matches the collection's requirement.

.NET Core games store their version in a `<GameName>.deps.json` file alongside the executable:

```json
{
  "libraries": {
    "Stardew Valley/1.6.15.24356": { "type": "project", ... }
  }
}
```

**Fix (v6 — 1:2.0.1-8):** Both `testExecProvider` and `getExecGameVersion` gain a Linux
fallback that normalizes names before matching, fixing false positives when multiple
`.deps.json` files are present (e.g. `BmFont.deps.json` being read before
`Stardew Valley.deps.json` alphabetically and returning the wrong version).

**Fix (v7 — 1:2.0.1-9):** Critical fix for the v6 code: `exeVersion.default()` returns
`undefined` (does not throw) for ELF binaries on Linux. The try-catch only set `_ev`/`_ver`
to `"0.0.0"` on exceptions; when the return value was `undefined`, both variables stayed
`undefined`. As a result `"0.0.0" === undefined` was `false`, the `.deps.json` fallback was
never reached, and `getInstalledVersion()` returned `undefined` — displayed as an empty
"Your game version:" field in the collection mismatch dialog. Fix: `||"0.0.0"` on the return
value of `exeVersion.default()` in both functions. Includes v6→v7 migration patches.

The algorithm:

1. Normalizes the executable filename: lowercase, strip spaces/dots/hyphens/underscores.
   `StardewValley` → `stardewvalley`.
2. Scans all `*.deps.json` files in the game directory.
3. For each library key (`Name/version`), normalizes the name part the same way.
4. Scores each match: **2** = exact, **1** = prefix (either direction), **0** = unrelated.
5. Accepts the best-scoring version if score ≥ 1.

`testExecProvider` returns `true` when any match with score ≥ 1 is found.

```js
// getExecGameVersion — normalized Linux fallback (renderer.js, v6)
if ("linux" === process.platform && "0.0.0" === _ver) {
    const _norm = s => s.toLowerCase().replace(/[\s.\-_]/g, "");
    const _en = _norm(path.basename(exePath).replace(/\.[^.]+$/, ""));
    const _fls = fs.readdirSync(discovery.path).filter(f => f.endsWith(".deps.json"));
    let _best = null, _bsc = -1;
    for (const _f of _fls) {
        const _d = JSON.parse(fs.readFileSync(path.join(discovery.path, _f), "utf8"));
        for (const _lib of Object.keys(_d.libraries || {})) {
            const _si = _lib.indexOf("/");
            const _lv = _lib.substring(_si + 1);
            if (!_lv || "0.0.0" === _lv) continue;
            const _ln = _norm(_lib.substring(0, _si));
            const _sc = _ln === _en ? 2 : (_ln.startsWith(_en) || _en.startsWith(_ln)) ? 1 : 0;
            if (_sc > _bsc) { _bsc = _sc; _best = _lv; }
        }
    }
    if (_best && _bsc >= 1) _ver = _best;
}
```

Also includes migration patches (v5→v6) so users with a locally-patched asar get
updated without reinstalling.

**Scope:** Works for any .NET Core/5+ game without per-game patches. Tested with Stardew
Valley: `StardewValley` → `stardewvalley` == `Stardew Valley` → `stardewvalley` → version
`1.6.15.24356`.

**Source location:** `src/extensions/gameversion_management/GameVersionManager.ts` and
`src/extensions/gameversion_management/util/getGameVersion.ts` (minified into `renderer.js`)

---

### 5 — `epicGamesLauncher`: null-safe stub on Linux

**Problem:** `util.epicGamesLauncher` is `undefined` on Linux (Epic Games Store is
Windows-only). Game plugins such as `game-survivingmars` and `game-untitledgoosegame`
call `.findByAppId()` / `.isGameInstalled()` on it without a null check, throwing:
`TypeError: Cannot read properties of undefined (reading 'findByAppId')`.
This is an unhandled promise rejection that logs as `ERRO` and prevents the plugin
from registering.

**Fix:** On Linux, replace the undefined value with a stub object whose methods
return rejected promises (gracefully handled by each plugin's `.catch()`).

```js
// before
exports.epicGamesLauncher = EpicGamesLauncher_1.default;

// after
exports.epicGamesLauncher = "linux" === process.platform
  ? {
      findByAppId:     () => Promise.reject(new Error("Epic not available on Linux")),
      isGameInstalled: () => Promise.resolve(false),
      queryPath:       () => Promise.reject(new Error("Epic not available on Linux")),
      getAppById:      () => void 0,
    }
  : EpicGamesLauncher_1.default;
```

---

## Patch applied to `winapi-bindings/index.js` (inside `app.asar`)

**Problem:** `winapi-bindings` already returns `{}` on non-Windows platforms. However,
when a game plugin calls any method (e.g. `winapi.RegGetValue(...)`) it gets
`TypeError: winapi.RegGetValue is not a function` — an error that reveals nothing
about what the caller was trying to do. Most such calls are wrapped in try/catch and
fail gracefully, but the error message is confusing when debugging.

**Fix:** Replace the empty object with a `Proxy` that returns silent no-op functions.
Using a throwing Proxy is unsafe because some winapi properties (e.g. `SetProcessPreferredUILanguages`)
are accessed at module-require time by webpack, before any try/catch can intercept the error,
causing an unhandled startup crash. The no-op Proxy returns `undefined` silently, matching
the behavior of the original `{}` (where accessing a missing key returns `undefined`) while
also surviving direct calls on the returned value.

```js
// before
module.exports = {};

// after
module.exports = new Proxy({}, {
  get: function(t, p) {
    return function() { return undefined; };
  },
});
```

All registry/winapi calls still silently fail and their callers' `.catch()` handlers fire normally.

---

## Patches applied to bundled game plugins (`app.asar.unpacked/bundledPlugins/`)

### Native Linux binary paths

Several games have official Linux clients but their Vortex plugins declare Windows
binary paths in both `executable()` and `requiredFiles`. Since `requiredFiles` are
checked with `stat()`, the game is not discovered on Linux if the `.exe` doesn't exist
(Proton does not create fake `.exe` symlinks in the game directory).

| Game            | Plugin file                   | Windows binary                                   | Linux binary      |
| --------------- | ----------------------------- | ------------------------------------------------ | ----------------- |
| Starbound       | `game-starbound/index.js`     | `win64/starbound.exe`                            | `linux/starbound` |
| Team Fortress 2 | `game-teamfortress2/index.js` | `tf_win64.exe`                                   | `hl2_linux`       |
| RimWorld        | `game-rimworld/index.js`      | `RimWorldWin64.exe`                              | `RimWorldLinux`   |
| War Thunder     | `game-warthunder/index.js`    | `win64/aces.exe`                                 | `linux64/aces`    |
| XCOM 2 (base)   | `game-xcom2/index.js`         | `Binaries/Win64/XCom2.exe`                       | `bin/XCOM2`       |
| XCOM 2 (WOTC)   | `game-xcom2/index.js`         | `XCom2-WarOfTheChosen/Binaries/Win64/XCom2.exe`  | `bin/XCOM2`       |

Each plugin gets both its `executable()` return value and the matching entry in
`requiredFiles` updated with a `process.platform === 'linux'` conditional.

Example (Starbound):

```js
// before
const defaultLocation = 'win64/starbound.exe';

// after
const defaultLocation = process.platform === 'linux'
  ? 'linux/starbound'
  : 'win64/starbound.exe';
```

### `gamebryo-ba2-support` and `gamebryo-bsa-support`: native Linux build

**Problem:** Both extensions use native Node.js modules (`ba2tk` for Fallout 4 BA2 archives,
`bsatk` for Skyrim/Fallout 3/NV BSA archives). Their upstream `package.json` build scripts
contain an inverted Windows-only guard:

```js
"dist": "node -e \"if(process.platform==='win32')process.exit(1)\" || (pnpm run _build ...)"
```

On Linux, `process.platform` is `'linux'`, the node command exits 0, and the `||` short-circuits
— the build is silently skipped. The extensions never appear in `bundledPlugins`.

**Fix:** In `prepare()` of the PKGBUILD, a Python heredoc strips that guard from both
`package.json` files so `pnpm run dist:extensions` builds them normally on Linux:

```python
for ext in ['gamebryo-ba2-support', 'gamebryo-bsa-support']:
    p = pathlib.Path(f'extensions/{ext}/package.json')
    pkg = json.loads(p.read_text())
    for s in ['build', 'dist']:
        old = pkg['scripts'][s]
        if '|| ' in old:
            pkg['scripts'][s] = old.split('|| ', 1)[1].strip('()')
    p.write_text(json.dumps(pkg, indent=2) + '\n')
```

Both `ba2tk` and `bsatk` compile on Linux without modifications. `bsatk` officially
declares `"os": ["win32", "linux"]` in its `package.json`. The resulting `.node` binaries
are included in `bundledPlugins/gamebryo-ba2-support/` and `bundledPlugins/gamebryo-bsa-support/`.

---

### `gamebryo-savegame-management`: native Linux build (added in 1:2.0.1-14)

**Problem:** `gamebryo-savegame-management` (save game browser/transfer for Bethesda games)
depends on `gamebryo-savegame`, a native C++ Node.js addon
(`node-gamebryo-savegames` / `GamebryoSave.node`). Three barriers to Linux support:

1. Same inverted guard in `dist` script — build is silently skipped on Linux.
2. The `_native` step copies `liblz4.dll` and `zlib.dll` (Windows only) alongside the
   `.node` file. `copy-native.mjs` exits 1 if any argument file is missing.
3. `gamebryo-savegame` is an `optionalDependency`. When its install script fails (because
   `binding.gyp` has no `-llz4 -lz` for Linux), pnpm silently omits the package from
   `node_modules` — so rolldown can't resolve the import and the build fails.

**C++ compatibility analysis:** `string_cast.h` provides two implementations of `toWC`:
- Windows: uses `MultiByteToWideChar` / `WideCharToMultiByte`
- Linux (`#else`): `toWC(src, ...) { return src; }` — identity function

`_wstat()` in `gamebryosavegame.cpp` is inside `#ifdef _WIN32` with a `stat()` fallback.
The cyrillic-detection heuristic is also `#ifdef _WIN32`. **The C++ is 100% Linux-compatible.**

**Fix (three parts):**

1. **Guard + `_native`** — extend the existing Python heredoc in `prepare()`:
   ```python
   for ext in ['gamebryo-ba2-support', 'gamebryo-bsa-support', 'gamebryo-savegame-management']:
       # strip inverted || guard from build/dist scripts

   # Remove Windows-only DLL arguments from _native
   pkg['scripts']['_native'] = \
       "node ../copy-native.mjs ./node_modules/gamebryo-savegame/build/Release/GamebryoSave.node"
   ```

2. **`binding.gyp` patch** — add Linux library links (lz4 and zlib are external to the
   addon on Linux; lz4 is a system library, zlib is re-exported by Node.js/Electron):
   ```python
   linux_cond = "['OS!=\"win\"', { \"libraries\": [\"-llz4\", \"-lz\"] }],\n"
   content = content.replace("['OS==\"win\"', {", linux_cond + "['OS==\"win\"', {", 1)
   ```

3. **Out-of-band native build** — `node-gamebryo-savegames` is added as a pinned git
   source in PKGBUILD (`#commit=9149445e...`). After `pnpm install`, the PKGBUILD:
   - Runs `npm install --ignore-scripts` in the source dir to get `node-addon-api`,
     `node-gyp`, and `autogypi` locally.
   - Runs `autogypi` to generate `auto.gypi` / `auto-top.gypi`.
   - Runs `node-gyp configure build` (inherits `npm_config_target=39.8.0` /
     `npm_config_disturl` Electron headers from the `prepare()` environment).
   - Populates `extensions/gamebryo-savegame-management/node_modules/gamebryo-savegame/`
     with the compiled `.node` + JS dist files so rolldown can resolve the import.

**Runtime dependency:** `lz4` is added to `depends` (dynamic link against `liblz4.so`).

**Result:** `gamebryo-savegame-management` is bundled as a native Linux plugin. Users with
Skyrim, Fallout, or other Bethesda games running via Proton get a working save game browser
and profile-based save isolation inside Vortex.

---

### `gamebryo-plugin-management` missing extension

`gamebryo-plugin-indexlock` and `gamebryo-archive-check` both call
`context.requireExtension("gamebryo-plugin-management")`. This triggers Vortex to
auto-download the extension from the Nexus extension repository — but the extension
is not available there, producing an error banner on every launch.

**Fix:** Remove the `requireExtension` calls from both plugins.

## Patch applied to `gamebryo-test-settings/index.cjs` (bundled plugin)

### 6 — `mygamesPath()`: resolve INI path to Proton prefix on Linux

**Problem:** `mygamesPath()` calls `vortex_api.util.getVortexPath("documents")` which
resolves to `~/Documents` on Linux. Bethesda games running under Proton store their INI
files, load order, DLC list and downloaded-content manifests inside the game's Steam
compatdata prefix instead:

```
~/.steam/steam/steamapps/compatdata/<APPID>/pfx/drive_c/users/steamuser/Documents/My Games/<gamePath>/
```

This means Vortex cannot read or write INI settings, load order, or DLC lists for any
Bethesda game running via Proton on Linux.

**Fix:** On Linux, read the game's install path from Vortex state
(`vortex_api.getState().persistent.gameMode.discovered[gameMode].path`) and scan
`appmanifest_*.acf` files across all Steam libraries to find the AppID dynamically
(same approach as Patch 7 `iniFiles` and Patch 8 `appDataPath`). Covers **any**
Bethesda game without a hardcoded AppID table. Falls back to `~/Documents` if
the game is not discovered or the Proton prefix doesn't exist (non-Proton installs).

```js
// before
function mygamesPath(gameMode) {
    return path.join(vortex_api.util.getVortexPath("documents"), "My Games",
                     gameSupport.get(gameMode, "mygamesPath"));
}

// after (Linux path, simplified)
function mygamesPath(gameMode) {
    if (process.platform === 'linux') {
        try {
            const disc = vortex_api.getState().persistent.gameMode.discovered;
            const discPath = disc && disc[gameMode] && disc[gameMode].path;
            if (discPath) {
                const normDisc = path.normalize(discPath);
                const steamRoot = path.join(os.homedir(), '.steam', 'steam');
                const libs = [path.join(steamRoot, 'steamapps')];
                // parse libraryfolders.vdf for additional library roots
                try {
                    const vdf = fs.readFileSync(path.join(steamRoot, 'steamapps', 'libraryfolders.vdf'), 'utf8');
                    for (const m of vdf.matchAll(/"path"\s+"([^"]+)"/g))
                        libs.push(path.join(m[1], 'steamapps'));
                } catch (_e) {}
                for (const lib of [...new Set(libs)]) {
                    try {
                        for (const mf of fs.readdirSync(lib).filter(f => f.startsWith('appmanifest_') && f.endsWith('.acf'))) {
                            const mt = fs.readFileSync(path.join(lib, mf), 'utf8');
                            const im = mt.match(/"installdir"\s+"([^"]+)"/);
                            if (im && path.normalize(path.join(lib, 'common', im[1])) === normDisc) {
                                const idm = mf.match(/appmanifest_(\d+)\.acf/);
                                if (idm) {
                                    const dp = path.join(lib, 'compatdata', idm[1],
                                                         'pfx', 'drive_c', 'users', 'steamuser', 'Documents');
                                    if (fs.existsSync(dp))
                                        return path.join(dp, 'My Games', gameSupport.get(gameMode, "mygamesPath"));
                                }
                            }
                        }
                    } catch (_e) {}
                }
            }
        } catch (_e) {}
    }
    return path.join(vortex_api.util.getVortexPath("documents"), "My Games",
                     gameSupport.get(gameMode, "mygamesPath"));
}
```

**Games covered:** Any Bethesda game managed via Proton — no hardcoded AppID list.

---

### 7 — `iniFiles` in `renderer.js`: resolve `mygames` via Proton prefix (complements Patch 6)

**Problem:** The `iniFiles()` function in `renderer.js` (Vortex core engine, not a plugin)
computes the `My Games` folder independently of `mygamesPath()`:

```js
function iniFiles(gameMode, discovery) {
    const mygames = path.join(getVortexPath("documents"), "My Games");
    // ...
    return iniFileList.map(f => template(f, { mygames, game: discovery.path }))
}
```

This function doesn't have a known `gameMode`-to-AppID mapping — it only has
`discovery.path` (the game install directory). It therefore cannot use the static
AppID table approach from Patch 6. Without this fix, Vortex cannot read or write
INI files (Fallout4.ini, SkyrimPrefs.ini, etc.) from its main UI on Linux.

**Fix:** Replace the single `path.join(...)` with an IIFE that discovers the AppID
by scanning `appmanifest_*.acf` files across all Steam libraries and matching
`installdir` against `discovery.path`.

```js
const mygames = (() => {
  if ("linux" !== process.platform)
    return path.join(getVortexPath("documents"), "My Games");
  const _fs = require("fs");
  const discPath = discovery?.path;
  if (!discPath) return path.join(getVortexPath("documents"), "My Games");
  const normDisc = path.normalize(discPath);
  const cands = [];
  // If discovery.path is steamapps/common/<Game>, go up 2 levels
  const mc = path.dirname(normDisc), ms = path.dirname(mc);
  if (path.basename(mc) === "common") cands.push(ms);
  cands.push(path.join(process.env.HOME, ".steam", "steam", "steamapps"));
  // Add extra Steam library roots from libraryfolders.vdf
  try {
    const lf = path.join(process.env.HOME, ".steam", "steam", "steamapps", "libraryfolders.vdf");
    for (const m of _fs.readFileSync(lf, "utf8").matchAll(/"path"\s+"([^"]+)"/g))
      cands.push(path.join(m[1], "steamapps"));
  } catch(e) {}
  for (const sd of [...new Set(cands)]) {
    try {
      for (const mf of _fs.readdirSync(sd).filter(f => f.startsWith("appmanifest_") && f.endsWith(".acf"))) {
        try {
          const mt = _fs.readFileSync(path.join(sd, mf), "utf8");
          const im = mt.match(/"installdir"\s+"([^"]+)"/);
          if (im && path.normalize(path.join(sd, "common", im[1])) === normDisc) {
            const idm = mf.match(/appmanifest_(\d+)\.acf/);
            if (idm) {
              const mg = path.join(sd, "compatdata", idm[1], "pfx",
                                   "drive_c", "users", "steamuser", "Documents", "My Games");
              if (_fs.existsSync(mg)) return mg;
            }
          }
        } catch(e) {}
      }
    } catch(e) {}
  }
  return path.join(getVortexPath("documents"), "My Games"); // fallback
})()
```

**Difference from Patch 6:** Both patches now use appmanifest scan. Patch 6 reads the
install path from Vortex state via `vortex_api.getState()`. Patch 7 reads `discovery.path`
passed directly to `iniFiles()`. Both are needed for full INI support on Linux.

**Source location:** `src/extensions/gamebryo_support/gameSupport.ts` → `iniFiles()`
(minified into `renderer.js`)

---

## Patch 8 — `appDataPath()` in `gamebryo-plugin-management` (runtime patch)

**Problem:** `appDataPath()` in `gamebryo-plugin-management` determines where Vortex looks
for `Plugins.txt` and `loadorder.txt`. On Windows it uses `%LOCALAPPDATA%`. On Linux that
variable is unset, so the function falls back to:

```js
path.resolve(vortex_api.util.getVortexPath("appData"), "..", "Local", dataPath)
// → ~/.config/Vortex/../Local/Fallout4/  (does not exist)
```

The correct Linux path under Proton is:
```
~/.steam/steam/steamapps/compatdata/<APPID>/pfx/drive_c/users/steamuser/AppData/Local/<Game>/
```

Without this fix Vortex cannot read or write the plugin list (`Plugins.txt`) or load order
(`loadorder.txt`) for any game running under Proton.

**Fix:** Runtime patch script `patch-ext-gamebryo.py`, deployed to `/opt/Vortex/` and
executed by `vortex.sh` on every launch. The script:

1. Scans `~/.config/Vortex/plugins/` for the `gamebryo-plugin-management` extension.
2. Identifies it via `info.json` (`"id": "gamebryo-plugin-management"`).
3. Replaces the compiled `appDataPath()` function with a Linux-aware **generic** version that:
   - Calls `discoveryForGame(gameMode)` — a module-level function already available in the
     same compiled scope, initialised by `initGameSupport(api)` — to get `discovery.path`.
   - Scans `appmanifest_*.acf` files across all Steam libraries to find the AppID by matching
     `installdir` against `discovery.path` (same approach as Patch 7 in `renderer.js`).
   - Returns the correct `AppData/Local/<game>` path inside the Proton prefix if found.
   - Falls back to the original logic otherwise (non-Proton installs, unrecognised games).
4. Prepends a marker (`// vortex-linux-fix-appdata`) to prevent double-patching.

No hardcoded AppID table — works for **any game** that `gamebryo-plugin-management` supports.

```js
// before
function appDataPath(gameMode) {
    const dataPath = gameSupport.get(gameMode, "appDataPath");
    return process.env.LOCALAPPDATA !== void 0
        ? path.join(process.env.LOCALAPPDATA, dataPath)
        : path.resolve(vortex_api.util.getVortexPath("appData"), "..", "Local", dataPath);
}

// after (Linux branch, simplified)
function appDataPath(gameMode) {
    if (process.platform === 'linux') {
        try {
            const disc = discoveryForGame && discoveryForGame(gameMode);
            const discPath = disc && disc.path;
            if (discPath) {
                const normDisc = path.normalize(discPath);
                // discover all Steam libraries via libraryfolders.vdf
                for (const lib of steamLibs) {
                    // scan appmanifest_*.acf to match installdir → AppID
                    for (const mf of fs.readdirSync(lib).filter(f => f.startsWith('appmanifest_'))) {
                        const mt = fs.readFileSync(path.join(lib, mf), 'utf8');
                        const im = mt.match(/"installdir"\s+"([^"]+)"/);
                        if (im && path.normalize(path.join(lib, 'common', im[1])) === normDisc) {
                            const idm = mf.match(/appmanifest_(\d+)\.acf/);
                            if (idm) {
                                const dp = path.join(lib, 'compatdata', idm[1],
                                                     'pfx', 'drive_c', 'users', 'steamuser',
                                                     'AppData', 'Local');
                                if (fs.existsSync(dp))
                                    return path.join(dp, gameSupport.get(gameMode, "appDataPath"));
                            }
                        }
                    }
                }
            }
        } catch(_e) {}
    }
    // original fallback
    const dataPath = gameSupport.get(gameMode, "appDataPath");
    return process.env.LOCALAPPDATA !== void 0
        ? path.join(process.env.LOCALAPPDATA, dataPath)
        : path.resolve(vortex_api.util.getVortexPath("appData"), "..", "Local", dataPath);
}
```

**Difference from Patch 6:** Patch 6 (`mygamesPath`) uses a hardcoded AppID table because
`gamebryo-test-settings` is a bundled plugin compiled separately and has no access to
`discoveryForGame`. Patch 8 is in `gamebryo-plugin-management` which has `discoveryForGame`
in scope, enabling the generic appmanifest scan approach used by Patch 7.

**Why runtime and not PKGBUILD:** `gamebryo-plugin-management` has native module dependencies
(`esptk`, `loot`) whose build scripts explicitly skip Linux. The extension is not bundled in
`app.asar` — it is downloaded by users on demand via Vortex's Extensions UI. The same
`patch-ext-*.py` mechanism already used for the Cyberpunk 2077 extension is the correct
approach here.

**Source location:** `extensions/gamebryo-plugin-management/src/util/gameSupport.ts` →
`appDataPath()` (compiled into the extension's `index.cjs` via rolldown).

---

## User extension patch: Cyberpunk 2077 extension (runtime, not in PKGBUILD)

**Problem:** The official Nexus Mods "Cyberpunk 2077" Vortex extension uses
`path.join()` with Windows backslash strings in 95 places:

```js
exports.REDdeployExeRelativePath = path_1.default.join(`tools\\redmod\\bin\\redMod.exe`);
```

On Linux, `path.join('tools\\redmod\\bin\\redMod.exe')` returns the string unchanged
(backslash is not a path separator on Linux), so Vortex tries to `stat` a file literally
named `tools\redmod\bin\redMod.exe` — which doesn't exist — and reports "REDmod DLC missing"
even when REDmod is installed.

**Fix:** Applied at runtime to the user's extension file with a Python regex:

```python
def fix_path_join(m):
    inner = m.group(1)
    fixed = inner.replace('\\\\', '/')
    return f'path_1.default.join(`{fixed}`)'

fixed_content = re.sub(r'path_1\.default\.join\(`([^`]*)`\)', fix_path_join, content)
```

This is a user-side fix (the extension lives in `~/.config/Vortex/plugins/`) and must
be re-applied after the extension auto-updates. It is not included in the PKGBUILD
because user extensions are managed per-user.

**Affected paths (95 total):** `tools/redmod/bin/redMod.exe`, `r6/cache/modded`,
`engine/config/platform/pc/`, `red4ext/plugins/*/`, `r6/scripts/*/`, etc.

---

## Known non-issues (expected ERRO log entries)

Many game plugins call `winapi.RegGetValue()` inside a `try/catch` as a GOG/registry
fallback after Steam lookup fails. On Linux this throws (now with a clearer message
thanks to the Proxy patch) and is caught, causing the plugin to log `ERRO: failed to
use game support plugin` for games like Dragon Age, Skyrim, Enderal, etc.

**This is expected behaviour** — Vortex logs the error but continues normally. The
game plugin simply fails to auto-discover the game (since neither Steam nor the
Windows registry found it), and the user can still add it manually.

Games with explicit `if (process.platform !== 'win32') return Promise.reject(...)` guards
(Dragon Age 2, Neverwinter Nights, The Sims 3/4, The Witcher 1/2, etc.) also appear
in the ERRO log for the same reason and are equally harmless.

---

## Source files upstream

These patches target minified build output. The corresponding source locations in
[Nexus-Mods/Vortex](https://github.com/Nexus-Mods/Vortex) are:

| Patch                    | Source file                                                     |
| ------------------------ | --------------------------------------------------------------- |
| verifyToolDir validator  | `src/extensions/gamemode_management/util/discovery.ts`          |
| requiredFiles validator  | `src/extensions/gamemode_management/util/verifyGamePath.ts`     |
| StarterInfo.initFromGame | `src/util/StarterInfo.ts`                                       |
| browseGameLocation       | `src/extensions/gamemode_management/util/browseGameLocation.ts` |
| epicGamesLauncher export | `src/util/api.ts` (re-export from `EpicGamesLauncher`)          |
| winapi-bindings stub     | `node_modules/winapi-bindings/index.js`                         |

PRs to the upstream repository fixing these on the source level would make this fork
unnecessary.

---

## Installation

```bash
# From AUR
yay -S vortex-linux-fix

# Manual build
git clone https://aur.archlinux.org/vortex-linux-fix.git
cd vortex-linux-fix
makepkg -si
```

---

## Changelog

| Release       | Changes                                                                                                                                                                                                                                                                                                                                                                                                |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 2.0.0-1       | Initial build: dependency fixes, pnpm/dotnet support, core patches 1–4                                                                                                                                                                                                                                                                                                                                 |
| 2.0.0-2       | Cyberpunk 2077 extension: fix 95 Windows backslash paths (REDmod detection); remove gamebryo-plugin-management requireExtension calls                                                                                                                                                                                                                                                                  |
| 2.0.0-3       | epicGamesLauncher null-safe stub (patch 5); winapi-bindings Proxy; native Linux binaries for Starbound, TF2, RimWorld, War Thunder; correct file browser filter context                                                                                                                                                                                                                                |
| 2.0.0-4       | winapi-bindings: switch from throwing Proxy to silent no-op Proxy (fix unhandled startup crash on SetProcessPreferredUILanguages)                                                                                                                                                                                                                                                                      |
| 2.0.0-5–9     | Refactor: extract `patch-asar.py` and `patch-pkg.js` as verified source files; fix `chmod 777→755` on assets dir enforced via `post_upgrade()`; remove `dotnet-sdk-9.0` from makedepends (binary is prebuilt in upstream repo, ~500 MB saved); remove `NO_PARALLEL` (parallel native module builds work correctly); suppress 28 pnpm deprecated subdependency warnings via `allowedDeprecatedVersions` |
| 2.0.0-10      | Fix fragile relative path in `build()` (`../../dist/linux-unpacked` → `$srcdir`-absolute); deduplicate `dotnetprobe` install (removed from `build()`, kept only in `package()` with `install -Dm755`); remove `game-survivingmars` plugin patch (redundant — renderer Patch 5 epicGamesLauncher stub covers it globally)                                                                               |
| 2.0.0-11      | Auto-repatch Cyberpunk 2077 extension on every launch: `patch-ext-cp2077.py` fixes 95 Windows backslash paths in `path_1.default.join()` calls; idempotent via `// vortex-linux-fix` marker; `python` added to runtime depends                                                                                                                                                                         |
| 2.0.0-12      | Generic extension re-patch system: `vortex.sh` loops over `/opt/Vortex/patch-ext-*.py`; new extension patches require only a new source file in PKGBUILD — no changes to `vortex.sh` needed                                                                                                                                                                                                            |
| **2.0.1-1**   | Upstream update to v2.0.1; fix all plugin patch strings for upstream quote style change (single → double quotes, `requiredFiles` collapsed to single-line arrays); all 16 patches confirmed [OK]                                                                                                                                                                                                       |
| **1:2.0.1-2** | New patch: `mygamesPath()` in `gamebryo-test-settings` now resolves to the Proton compatdata prefix on Linux instead of `~/Documents`. Searches all Steam libraries via `libraryfolders.vdf`. Covers Fallout 3/NV/4/4VR, Skyrim/SE/VR, Enderal/SE, Starfield, Oblivion. Epoch=1 introduced to fix version ordering after upstream switched to `epoch:pkgver-pkgrel` scheme.                            |
| **1:2.0.1-3** | XCOM 2 native Linux binary patch: `game-xcom2` plugin now returns `bin/XCOM2` on Linux (Feral port) instead of `Binaries/Win64/XCom2.exe`. Applies to both base game and War of the Chosen. Daggerfall Unity covered by existing generic patches (`.exe`→`.x86_64` fallback). A Hat in Time requires no patch (Proton-only, `.exe` present in game dir). |
| **1:2.0.1-4** | Patch 7 — `iniFiles` in `renderer.js`: complements the Patch 6 plugin fix by resolving `mygames` in the Vortex core engine. Dynamically discovers AppID by scanning `appmanifest_*.acf` against `discovery.path`; covers any Proton-managed Gamebryo game without a hardcoded AppID table. Reported by AUR user Garecrow. |
| **1:2.0.1-5** | Hotfix: missing `;` after `})()` in the `iniFiles` patch new-string caused `SyntaxError` in the Electron renderer (black screen on launch). Fixed by appending `;` to close the IIFE statement correctly. |
| **1:2.0.1-6** | Patch 8 — `appDataPath()` runtime patch for `gamebryo-plugin-management`: resolves `Plugins.txt` and `loadorder.txt` to the correct Proton compatdata path on Linux. Deployed as `patch-ext-gamebryo.py` (same runtime mechanism as the Cyberpunk 2077 patch). Reported by AUR user Garecrow. |
| **1:2.0.1-7** | Patches 9 & 10 — Generic .NET game version detection on Linux: `testExecProvider` and `getExecGameVersion` now fall back to scanning `*.deps.json` (the .NET Core dependency manifest) when the executable has no PE version info. Fixes the empty "Your game version:" field in Nexus Collections for .NET-based games (Stardew Valley, etc.). Generic solution — no per-game patches needed. |
| **1:2.0.1-8** | Patches 9 & 10 v6 — Normalize exe name when matching `.deps.json` library keys (lowercase, strip spaces/dots/hyphens/underscores + scoring: exact=2, prefix=1). Fixes false positives when multiple `.deps.json` files exist in the game dir (e.g. `BmFont.deps.json` returned wrong version before `Stardew Valley.deps.json`). Includes v5→v6 migration patches for locally-installed asars. |
| **1:2.0.1-9** | Patches 9 & 10 v7 — Critical fix: `exeVersion.default()` returns `undefined` (not throws) for ELF binaries on Linux. Added `\|\|"0.0.0"` to both `testExecProvider` and `getExecGameVersion` so `_ev`/`_ver` never stays `undefined`, ensuring the `.deps.json` fallback is always triggered on Linux. Fixes the empty "Your game version:" field in the Nexus Collections mismatch dialog. Includes v6→v7 migration patches for locally-installed asars. |
| **1:2.0.1-10** | Patch 2 extended — `verifyToolDir` now also has the `.exe`→`.x86_64` fallback on Linux. This function validates the game directory every time a profile or game tab is activated (`assertToolDir` → `verifyToolDir`). Without this fix, games with native Linux binaries (e.g. Graveyard Keeper, any `.x86_64` game) get "Failed to set game mode" on every profile/tab switch even though the game is installed correctly. Previously only `verifyGamePath` (browse-for-game flow) had the fallback. |
| **1:2.0.1-11** | Patch 11 — Generic BepInEx Linux fixer (`patch-ext-bepinex.py`): scans all Steam libraries for Unity games with BepInEx deployed as a Windows install on a Linux native binary. Automatically copies bundled `libdoorstop.so` (from BepInEx Linux release, sha256-verified), fixes `doorstop_config.ini` backslash paths, and sets the required `LD_PRELOAD` Steam launch option via `localconfig.vdf` (or writes `BEPINEX-LINUX.txt` reminder if Steam is running). Generic — covers any Unity+BepInEx game without per-game patches. |
| **1:2.0.1-13** | `gamebryo-ba2-support` and `gamebryo-bsa-support` now compiled natively for Linux. Upstream `package.json` build scripts had an inverted Windows-only guard (`if(platform==='win32')exit(1) \|\|`) that silently skipped the build on Linux. Fixed in `prepare()` with an inline Python heredoc. `ba2tk` and `bsatk` compile on Linux without modification; `bsatk` has official `"os": ["win32", "linux"]` support. `gamebryo-savegame-management` remains excluded (Win32 `_wstat` / wide-char API). |
| **1:2.0.1-14** | `gamebryo-savegame-management` native save browser compiled for Linux. C++ addon `GamebryoSave.node` is 100% Linux-compatible (`toWC`/`_wstat` have `#else` branches). Three blockers fixed: inverted build guard removed, `_native` script stripped of Windows-only DLL args, `binding.gyp` patched with `-llz4 -lz`. `node-gamebryo-savegames` added as a pinned git source; compiled with `node-gyp` + Electron headers in `prepare()`. `lz4` added to runtime depends. |
| **1:2.0.1-15** | Patch 6 (`mygamesPath`) generalized: hardcoded `_sids` table (11 Steam AppIDs) replaced with appmanifest scan. Reads game install path from `vortex_api.getState().persistent.gameMode.discovered[gameMode].path`, then scans `appmanifest_*.acf` across all Steam libraries to find the AppID dynamically — the same approach already used by Patch 7 (`iniFiles`) and Patch 8 (`appDataPath`). Covers any Bethesda game managed via Proton without requiring package updates. |

---

---

## Patch 11 — Generic BepInEx Linux fixer (runtime patch)

**Problem:** BepInEx for Unity games ships a Windows-only hook mechanism (`winhttp.dll` +
`doorstop_config.ini`) that does nothing on Linux native binaries. When Vortex (or any
mod manager) deploys a BepInEx pack to a game with a native Linux executable (`.x86_64`),
the game launches but BepInEx never loads — silently. Two concrete failures:

1. **`libdoorstop.so` missing** — the Linux equivalent of the Windows doorstop hook is not
   included in BepInEx Windows distributions. Without it, `LD_PRELOAD` has nothing to load.
2. **`doorstop_config.ini` uses Windows paths** — `target_assembly=BepInEx\core\BepInEx.Preloader.dll`
   uses backslashes, which Linux treats as literal characters, breaking the assembly path.

**Fix:** Runtime patch script `patch-ext-bepinex.py`, deployed to `/opt/Vortex/` and
executed by `vortex.sh` on every Vortex launch. The script:

1. Reads `~/.local/share/Steam/steamapps/libraryfolders.vdf` to discover all Steam
   library roots (covers multi-drive setups).
2. For each library, scans `steamapps/common/` for game directories containing
   `BepInEx/core/BepInEx.Preloader.dll` **and** `winhttp.dll` (confirms Windows BepInEx
   install) **and** a Linux-native executable (`.x86_64` suffix or `UnityPlayer.so`).
3. If not already fixed:
   - Copies `libdoorstop.so` from `/opt/Vortex/resources/libdoorstop.so` (bundled in package)
     to the game directory.
   - Fixes `doorstop_config.ini`: replaces `BepInEx\core\BepInEx.Preloader.dll` →
     `BepInEx/core/BepInEx.Preloader.dll`.
   - If Steam is **not** running: sets the required Steam launch option directly in
     `localconfig.vdf` for all user accounts found under `~/.local/share/Steam/userdata/`.
   - If Steam **is** running: writes `BEPINEX-LINUX.txt` in the game directory with the
     exact launch option string to copy-paste.
4. Idempotent: skips games already fixed (libdoorstop.so present + ini path clean).

The required Steam launch option (shown in `BEPINEX-LINUX.txt` and set automatically
when Steam is not running):

```
DOORSTOP_ENABLED=1 DOORSTOP_TARGET_ASSEMBLY="BepInEx/core/BepInEx.Preloader.dll" LD_PRELOAD="./libdoorstop.so" %command%
```

`libdoorstop.so` is bundled from the official BepInEx Linux release
(`BepInEx_linux_x64_5.4.23.2.zip`, sha256-verified) and installed at
`/opt/Vortex/resources/libdoorstop.so`.

**Scope:** Generic — works for **any** Unity game with BepInEx deployed by any mod manager
or manually. Tested with Graveyard Keeper (AppID 599140). Also covers Valheim, Risk of Rain 2,
Subnautica, and any other Unity+BepInEx title with a Linux native binary.

**Why runtime and not PKGBUILD:** The fix must be applied to user game directories that
are not known at package build time. The same `patch-ext-*.py` mechanism used by other
runtime patches is the correct approach.

---

## Roadmap

- [x] Functional build on Arch Linux
- [x] `requiredFiles` patch: `.exe` → `.x86_64` fallback
- [x] `initFromGame` patch: native Linux binary resolution
- [x] `browseGameLocation` patch: fix manual game location flow
- [x] Published to AUR as `vortex-linux-fix`
- [x] Fix REDmod DLC missing (Cyberpunk 2077 extension backslash paths)
- [x] Fix `gamebryo-plugin-management` error banner
- [x] `epicGamesLauncher` null-safe stub on Linux
- [x] `winapi-bindings` silent no-op Proxy (fix startup crash)
- [x] Native Linux binaries: Starbound, TF2, RimWorld, War Thunder
- [x] Extract patch scripts to external source files (sha256-verified)
- [x] Fix asset dir permissions (777→755), enforced on upgrades via `post_upgrade()`
- [x] Remove `dotnet-sdk-9.0` from makedepends (prebuilt in upstream repo)
- [x] Parallel native module builds (removed `NO_PARALLEL`)
- [x] Auto-repatch Cyberpunk 2077 extension on every launch
- [x] Generic extension re-patch system (`patch-ext-*.py` in `/opt/Vortex/`)
- [x] Bethesda games INI/AppData path via Proton prefix (Fallout 4, Skyrim, etc.)
- [x] XCOM 2 + War of the Chosen: native Linux binary `bin/XCOM2` (Feral port)
- [x] Daggerfall Unity: covered by generic `.exe`→`.x86_64` fallback patches
- [x] A Hat in Time: no native Linux binary; Proton-only, `.exe` present in game dir — no patch needed
- [x] `Plugins.txt` / `loadorder.txt` for Bethesda games via Proton prefix (`gamebryo-plugin-management`)
- [x] Generic .NET game version detection on Linux via `deps.json` fallback (Stardew Valley and similar)
- [x] Generic BepInEx Linux fixer: `libdoorstop.so` copy + `doorstop_config.ini` fix + Steam launch option (all Unity+BepInEx games)
- [x] `gamebryo-ba2-support` and `gamebryo-bsa-support` compiled natively for Linux (ba2tk, bsatk)
- [ ] Upstream PRs to Nexus-Mods/Vortex with the Linux fixes
- [ ] Automatic re-patch of user extensions after update
- [ ] `gamebryo-savegame-management`: C++ port of `_wstat` / wide-char Win32 API

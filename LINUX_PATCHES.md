# Vortex Linux Patches — vortex-linux-fix

**Maintainer:** k8rit0 \<angelalvarezferrero@gmail.com\>  
**Based on:** [Nexus-Mods/Vortex](https://github.com/Nexus-Mods/Vortex) v2.0.0  
**Package name:** `vortex-linux-fix` (AUR)  
**Current release:** 2.0.0-4

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
No external scripts are required — everything runs as an inline Python heredoc.

---

## Architecture of the patch system

The PKGBUILD `package()` function runs a single Python script that:

1. **Patches bundled plugin files** in `app.asar.unpacked/bundledPlugins/` directly
   (readable JS/CJS files — no asar manipulation needed).

2. **Patches the asar** for two files inside `resources/app.asar`:
   - `node_modules/winapi-bindings/index.js` — patched first (highest offset in file)
   - `renderer.js` — patched second (lower offset)

   The order matters: patching from highest to lowest offset ensures that when
   `update_offsets()` adjusts all entries after the pivot, already-adjusted entries
   are correctly shifted again. The asar is written once at the end.

3. The marker `// vortex-linux-fix-v3` is prepended to `renderer.js`. On re-runs,
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

### 2 — `requiredFiles` validator: `.exe` → `.x86_64` fallback

**Problem:** Vortex validates game installations by `stat`-ing each path in `requiredFiles`.
Game extensions declare `.exe` paths (e.g. `Cyberpunk2077.exe`). On Linux, games with
native clients use `.x86_64` binaries, so validation fails even when the game is installed.

**Fix:** On Linux, if `stat()` fails for a `.exe` path, retry with `.x86_64`.

```js
// before
requiredFiles||[],file=>bluebird_1.default.resolve(
  fsExtra.stat(path.join(gamePath,file))
)).then(()=>{}).catch(err=>{if("ENOENT"===err.code)return bluebird_1.default.reject(err)})

// after
requiredFiles||[],file=>bluebird_1.default.resolve(
  "linux"===process.platform
    ?fsExtra.stat(path.join(gamePath,file))
        .catch(()=>fsExtra.stat(path.join(gamePath,file.replace(/\.exe$/i,".x86_64"))))
    :fsExtra.stat(path.join(gamePath,file))
)).then(()=>{}).catch(err=>{if("ENOENT"===err.code)return bluebird_1.default.reject(err)})
```

| Scenario | Without patch | With patch |
|---|---|---|
| Proton/Wine (`.exe` present) | ✓ | ✓ |
| Native Linux (`.x86_64`) | ✗ Game not found | ✓ |

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

| Game | Plugin executable | Resolved on Linux |
|---|---|---|
| Cyberpunk 2077 (Proton) | `bin/x64/Cyberpunk2077.exe` | unchanged (`.exe` exists via Proton) |
| Graveyard Keeper (native) | `Graveyard Keeper.exe` | → `Graveyard Keeper.x86_64` |
| Generic native `linux/` | `game.exe` | → `linux/game` |

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

| Game | Plugin file | Windows binary | Linux binary |
|---|---|---|---|
| Starbound | `game-starbound/index.js` | `win64/starbound.exe` | `linux/starbound` |
| Team Fortress 2 | `game-teamfortress2/index.js` | `tf_win64.exe` | `hl2_linux` |
| RimWorld | `game-rimworld/index.js` | `RimWorldWin64.exe` | `RimWorldLinux` |
| War Thunder | `game-warthunder/index.js` | `win64/aces.exe` | `linux64/aces` |

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

### `gamebryo-plugin-management` missing extension

`gamebryo-plugin-indexlock` and `gamebryo-archive-check` both call
`context.requireExtension("gamebryo-plugin-management")`. This triggers Vortex to
auto-download the extension from the Nexus extension repository — but the extension
is not available there, producing an error banner on every launch.

**Fix:** Remove the `requireExtension` calls from both plugins.

### `game-survivingmars` — belt-and-suspenders epicGamesLauncher guard

In addition to the global `renderer.js` stub (patch 5 above), the Surviving Mars plugin
gets a local null-check added as a safety net:

```js
// before
.catch(() => util.epicGamesLauncher.findByAppId('Ovenbird'))

// after
.catch(() => util.epicGamesLauncher
  ? util.epicGamesLauncher.findByAppId('Ovenbird')
  : Promise.reject(new Error('Epic not available')))
```

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

| Patch | Source file |
|---|---|
| requiredFiles validator | `src/extensions/gamemode_management/util/verifyGamePath.ts` |
| StarterInfo.initFromGame | `src/util/StarterInfo.ts` |
| browseGameLocation | `src/extensions/gamemode_management/util/browseGameLocation.ts` |
| epicGamesLauncher export | `src/util/api.ts` (re-export from `EpicGamesLauncher`) |
| winapi-bindings stub | `node_modules/winapi-bindings/index.js` |

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

| Release | Changes |
|---|---|
| 2.0.0-1 | Initial build: dependency fixes, pnpm/dotnet support, core patches 1–4 |
| 2.0.0-2 | Cyberpunk 2077 extension: fix 95 Windows backslash paths (REDmod detection); remove gamebryo-plugin-management requireExtension calls |
| 2.0.0-3 | epicGamesLauncher null-safe stub (patch 5); winapi-bindings Proxy; native Linux binaries for Starbound, TF2, RimWorld, War Thunder; correct file browser filter context |
| 2.0.0-4 | winapi-bindings: switch from throwing Proxy to silent no-op Proxy (fix unhandled startup crash on SetProcessPreferredUILanguages) |

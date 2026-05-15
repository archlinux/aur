# Vortex Linux Patches — vortex-linux-fix

**Maintainer:** k8rit0 \<angelalvarezferrero@gmail.com\>  
**Based on:** [Nexus-Mods/Vortex](https://github.com/Nexus-Mods/Vortex) v2.0.0  
**Package name:** `vortex-linux-fix` (AUR)

---

## Why this fork exists

The official Vortex release builds for Linux but ships with several hardcoded assumptions
about Windows file system conventions (`.exe` executables, Windows-only game store detection).
These cause three concrete failures on Linux:

1. The game folder browser filters for `.exe` only — you cannot browse to a Linux game executable.
2. The `requiredFiles` validator rejects games whose files have `.x86_64` / `.x86` extensions instead of `.exe`.
3. `identifyStore` throws an unhandled error on Linux, crashing the browse-game-location flow.

All patches are applied at package time to `resources/app.asar` (specifically `renderer.js` inside it),
with no runtime dependencies beyond the installed Vortex itself.

---

## Files modified

### `PKGBUILD`
- **`pkgname`** renamed from `vortex-linux` → `vortex-linux-fix` to avoid conflicts with any
  upstream AUR packages and to signal this is a community-patched build.
- **`conflicts`** extended to include `vortex-linux` so both cannot be installed simultaneously.
- **`source`** no longer includes an external `patch-linux.py` script — all patching logic is now
  self-contained inside the `package()` function as an inline Python heredoc.
- **`package()`** now exports `_VORTEX_ASAR` and runs an inline Python script that:
  1. Parses the chromium-pickle asar binary format.
  2. Extracts `renderer.js` in memory.
  3. Applies all patches (see below) via exact string replacement.
  4. Reconstructs the asar with updated offsets and writes it back in place.

### `vortex.install`
- **`post_install`** / **`post_upgrade`** — added a terminal banner that credits the upstream
  Nexus-Mods team and identifies the package as a community fork with Linux patches.

---

## Patches applied to `renderer.js`

### 1 — File browser filter: accept Linux executables

**Problem:** The Electron `showOpenDialog` call for selecting a game executable uses
`extensions: ["exe"]`, which on Linux produces an empty file picker (no `.exe` files exist).

**Fix:** On Linux the filter becomes `["x86_64", "x86", "sh", "*"]` so native executables
and shell launchers are selectable.

```js
// before
filters:[{name:"Executables",extensions:["exe"]}]

// after
filters:[{name:"Executables",extensions:"linux"===process.platform?["x86_64","x86","sh","*"]:["exe"]}]
```

---

### 2 — `requiredFiles` validator: `.exe` → `.x86_64` fallback

**Problem:** When Vortex validates that a game's required files exist, it checks the exact
paths defined in the game extension (which list `.exe` paths). On Linux those files don't
exist, so every managed game fails validation even when the Linux executable is present.

**Fix:** On Linux, if `stat()` fails for a path ending in `.exe`, retry with `.x86_64`.

```js
// before
requiredFiles||[],file=>bluebird_1.default.resolve(
  fsExtra.stat(path.join(gamePath,file))
)).then(()=>{}).catch(...)

// after — Linux retries with .x86_64 before rejecting
requiredFiles||[],file=>bluebird_1.default.resolve(
  "linux"===process.platform
    ? fsExtra.stat(path.join(gamePath,file))
        .catch(()=>fsExtra.stat(path.join(gamePath,file.replace(/\.exe$/i,".x86_64"))))
    : fsExtra.stat(path.join(gamePath,file))
)).then(()=>{}).catch(...)
```

---

### 3 — `StarterInfo.initFromGame`: resolve the actual Linux executable path

**Problem:** When Vortex builds the launch command for a game it stores
`gameDiscovery.executable` (a `.exe` path) verbatim. On Linux this results in trying to
run a non-existent file, so the game never launches.

**Fix:** On Linux, walk through a priority list of real executable candidates before
falling back to the raw path.

```
Priority:
  1. path as-is (covers cases where the extension is already correct)
  2. same name with .x86_64
  3. linux/run-client.sh (common Proton-adjacent layout)
  4. linux/<basename without extension> (bare binary)
  5. original path (fallback — let the OS error propagate naturally)
```

---

### 4 — `browseGameLocation`: skip `identifyStore` on Linux

**Problem:** After the user selects a game folder, Vortex calls
`GameStoreHelper.identifyStore()` to detect which store owns the game (Steam, GOG, etc.).
This function throws an unhandled rejection on Linux, crashing the browse flow before the
path is ever saved.

**Fix:** On Linux, bypass `identifyStore` entirely and resolve with `store: "steam"` as a
safe default (Vortex continues working; the store attribution is cosmetic for most games).

```js
// before
.then(corrected => function manualGameStoreSelection(...) { ... identifyStore ... })

// after
.then(corrected =>
  "linux" === process.platform
    ? bluebird_1.default.resolve({ corrected, store: "steam" })
    : function manualGameStoreSelection(...) { ... identifyStore ... }
)
```

---

## Installation

### From AUR (once published)
```bash
yay -S vortex-linux-fix
# or
paru -S vortex-linux-fix
```

### Manual (from this repo)
```bash
git clone <this-repo-url>
cd vortex-linux-fix
chmod +x install.sh
./install.sh
```

Or directly with makepkg:
```bash
cd vortex-linux-fix
makepkg -si
```

---

## Contributing upstream

These patches are implemented as post-build string replacements on minified output because
Vortex does not currently publish a Linux-specific build configuration that handles these
cases. Ideally they would be contributed directly to the upstream source so the compiled
output is correct without patching. The relevant source files are:

- `src/extensions/gamemode_management/` — game discovery, requiredFiles, browse location
- `src/util/StarterInfo.ts` — executable path resolution
- `src/util/GameStoreHelper.ts` — store detection

PRs to [Nexus-Mods/Vortex](https://github.com/Nexus-Mods/Vortex) fixing these on the
source level would make this fork unnecessary.

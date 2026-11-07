# AGENTS.md — mindustry-sdl3-bin

AUR package `mindustry-sdl3-bin` (pkgbase `mindustry-sdl3-bin`, unique pkgname):
a "truly binary" wrapper around the SDL3-jar of Mindustry. It does NOT download
the official `Mindustry.jar` — that jar uses the **default SDL-JNI backend**, not
SDL3. Our package **builds** the jar from source with the SDL3 patches, so the
release assets are *our* compiled SDL3 jar.

## Backend note (important)

- Official `Mindustry.jar` from Anuken/Mindustry releases = default backend
  (`backend-sdl` / `arc.backend.sdl.jni`). It is NOT SDL3.
- To get SDL3 we build from source with `0001-mindustry-use-sdl3-backend.patch`
  (switches to LWJGL `backend-sdl3`) and `0002-arc-sdl3-preserve-wheel-delta.patch`.
- LWJGL's `-SNAPSHOT` is only on maven.lwjgl.org (often unreachable); the build
  patches Arc to use the released `3.4.2` from **Maven Central**.

## Release-asset flow (how AUR publishing works)

1. Build action (`.github/workflows/mindustry-sdl3-bin.yml`) compiles the SDL3
   jar for the current `pkgver` and publishes it as a GitHub Release asset on
   tag `v<pkgver>` (`mindustry-sdl3-bin-<ver>.jar`). It also updates the PKGBUILD
   jar `sha256sums` after building.
2. PKGBUILD (release-asset model) sources that jar:
   `source=(...jar::https://github.com/BlackCherryCat/my-aur/releases/download/v${pkgver}/mindustry-sdl3-bin-${pkgver}.jar ...)`
   with `noextract` on the jar. Icons come from the upstream `icon.icns`
   (extracted with `icns2png` in `package()`); `.install` is the SDL3 warning.
3. KSX `github-actions-deploy-aur` (dashboard `asset_dir=./mindustry-sdl3-bin`)
   mirrors the folder, runs `makepkg` (which downloads the jar from the release
   asset), and uploads the `.pkg.tar` to AUR.

## Version bump

- Edit `pkgver` in PKGBUILD, commit `Update to <version>`, push to **both** remotes
  (GitHub mirror `origin` = `BlackCherryCat/my-aur` AND AUR
  `ssh://aur@aur.archlinux.org/mindustry-sdl3-bin.git`).
- Pushing to `main` triggers the build action, which builds the jar for the new
  `pkgver`, publishes the release asset on tag `v<ver>`, and updates `sha256sums`.
- The build action only rebuilds when the release asset for `v<ver>` doesn't exist
  (idempotent); `makepkg --printsrcinfo | diff - .SRCINFO` must be empty.

## KSX deploy-aur `.gitignore` gotcha

- KSX mirrors `asset_dir` with `rsync --filter=':- .gitignore'` (gitignore-exclude
  style). A `.gitignore` using `*` + negation lines makes rsync copy **0 files**
  (`ERROR: PKGBUILD does not exist`), even though the gradle build succeeds.
- Use a **plain exclude list** (no `*`, no `!` negation). This repo's
  `mindustry-sdl3-bin/.gitignore` already does. Keep it this way.
- `aur_push` (KSX deploy) only runs when the workflow sees `out_of_date=true`
  (a `pkgver` bump vs the latest upstream release). Because our PKGBUILD sources
  the SDL3 jar from a **release asset** (not upstream), the KSX deploy's
  `out_of_date` gate is tuned for the pull-model: a deploy is exercised on a new
  upstream release; for the latest version, reconfigure the KSX `asset_dir`
  deployment so it also deploys when the build action publishes a new asset.

## Verified

- Build: `desktop:dist` produces `desktop/build/libs/Mindustry.jar`
  (Main-Class `mindustry.desktop.DesktopLauncher`); JDK 17, LWJGL 3.4.2 (Central).
- `package()` installs jar + `java -jar` launcher + 3 hicolor icons (256/512/1024,
  from `icon.icns`) + desktop entry + SDL3-warning `.install`.
- Checksums in PKGBUILD must be the **actual** file hashes (the upstream
  `icon.icns` hash in the official `mindustry-bin` PKGBUILD is stale — always
  recompute with `sha256sum`).

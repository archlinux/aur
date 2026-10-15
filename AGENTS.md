# Repository guidance

- This packages the upstream x86_64 Debian binary; there is no application source or test suite here. `PKGBUILD` is the source of truth; regenerate `.SRCINFO` rather than editing it by hand.
- Despite the package name `openai-codex-desktop-bin`, upstream archives, installed paths, and the executable use `chatgpt`. Preserve that distinction when changing packaging or dependencies.
- `package()` extracts only `./usr` from the Debian archive's `data.tar.xz`, removes lintian metadata, installs license references, and replaces `/usr/bin/chatgpt` with an embedded shell wrapper. Upstream archive layout changes can break these steps.
- The wrapper executes `/usr/lib/chatgpt/codex-launcher`, automatically selects Wayland when detected, and respects an explicit `--ozone-platform` argument (both `=value` and space-separated forms). Preserve argument forwarding and these overrides.

## Commands

- Run from the repository root with Arch packaging tools available. `Taskfile.yaml` exposes Go Task commands; each equivalent command is shown below.
- After changing the upstream version/source: `task updpkgsums` (`updpkgsums`), then `task srcinfo` (`makepkg --printsrcinfo > .SRCINFO`). Regenerate `.SRCINFO` after other packaging metadata changes too.
- Build verification: `task build` (`makepkg -s`); this can install missing build dependencies. There are no separate lint, typecheck, or test tasks.
- `task install` runs `sudo pacman -U *.pkg.tar.zst`; ensure the glob contains only the packages you intend to install.
- `task clean` removes `src`, `pkg`, all root `*.pkg.tar.zst`, and all root `*.deb`, including downloaded sources.
- `.gitignore` ignores everything except four explicitly allowed packaging files. New files (including `AGENTS.md`) require an allowlist entry or `git add -f` when intentionally staging them.

# AGENTS.md

This repo is **the AUR packaging** for upstream [hashicorp/terraform-mcp-server](https://github.com/hashicorp/terraform-mcp-server). It contains no application code — only `PKGBUILD`, `.SRCINFO`, and a `Makefile` that drives the release flow.

## Layout

- `PKGBUILD` — Arch package recipe. Builds from upstream source tarball.
- `.SRCINFO` — generated from PKGBUILD. Drives the AUR web page. Keep in sync.
- `Makefile` — on-demand release automation (Docker-based).

## Workflow commands

Everything goes through `make`. Do not invoke `makepkg` / `updpkgsums` on the host — they run inside a throwaway `archlinux:base-devel` Docker container (`make _in-container`). The host only needs `docker`, `git`, `curl`, `jq`, `sed`, `awk`.

- `make check` — read-only: query upstream latest release vs local `pkgver`.
- `make bump` — if newer upstream exists: rewrite `pkgver`, reset `pkgrel=1`, refresh `.SRCINFO` + checksums. Idempotent.
- `make build` — full `makepkg -s` + install + `--version` smoke-test inside container. Verifies the package actually works before publish.
- `make publish` — commits PKGBUILD/.SRCINFO if dirty, then `git push aur HEAD:master`.
- `make release` — `bump → build → publish`, stops on first failure.
- `make clean` — wipe `src/`, `pkg/`, `*.pkg.tar.zst`, `*.tar.gz`.

## Critical conventions

- **AUR remote is the only remote.** `git remote -v` shows just `aur` (SSH). There is no `origin` and no GitHub mirror for this repo. Push target is `aur HEAD:master` — AUR rejects any branch other than `master`.
- **`pkgrel` policy**: resets to `1` on every upstream version bump (Makefile does this). Bump `pkgrel` manually only for PKGBUILD-only fixes between upstream releases.
- **PKGBUILD mirrors the official Arch `terraform` package pattern** ([reference](https://gitlab.archlinux.org/archlinux/packaging/packages/terraform/-/raw/main/PKGBUILD)). Do not refactor it into a "cleaner" style — the user explicitly wants conventional AUR behavior. Keep `GOFLAGS`/`GOPROXY` inside `build()`, `CGO_*` exports, `-modcacherw`, `-trimpath`, `-buildmode=pie`.
- **e2e tests are deliberately excluded** in `check()` via `go list ./... | grep -v '/e2e$'`. Upstream's `e2e/*_test.go` files lack a `//go:build e2e` directive, so plain `go test ./...` runs them — and they invoke `make docker-build` which needs Docker, BuildKit, and a git HEAD inside the build sandbox. Do not remove this exclusion without an upstream fix.
- **Version injection**: ldflags inject `version.GitCommit=v$pkgver` and `version.BuildDate=$_builddate` into `github.com/hashicorp/terraform-mcp-server/version`. Upstream's own Makefile uses the wrong (bare) package path, so upstream binaries ship with empty `Commit`. Our build sets it correctly — do not "fix" by aligning with upstream's broken path.
- **Reproducible builds**: `BuildDate` uses `SOURCE_DATE_EPOCH` when set.

## Editing rules

- Never commit without explicit user request.
- After any PKGBUILD edit, regenerate `.SRCINFO` (`make bump` does this; or `makepkg --printsrcinfo > .SRCINFO` inside the container).
- After any `pkgver` change in PKGBUILD, checksums (`sha256sums`) **must** be regenerated — use `make bump` (calls `updpkgsums`).
- The Maintainer comment line at the top of PKGBUILD is preserved by AUR convention. Do not remove.

## AUR operational notes

- AUR push: SSH only (HTTPS is read-only). User's `pentago` SSH key is registered.
- AUR has two layers: git server (immediate) + RPC search index (cron, ~5-15 min lag). After push, `paru -Ss` and the web search lag behind the package page.
- The "alternates" shown on the AUR web page next to deps (e.g. `tfenv`, `tenv-bin` under `optdepends=terraform`) come from AUR's `by=provides` RPC search and are not under our control.

## Things that look broken but aren't

- No tests, no CI, no README in this repo — by design. It's a packaging repo, not a project.
- `pkg/` and `src/` may appear after a failed `make build`; they're gitignored. `make clean` removes them.
- Local `master` may be ahead of `aur/master` between `make bump`/`build` and `make publish` — that's the expected state mid-flow.

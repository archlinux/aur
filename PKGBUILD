# Maintainer: HanHaocheng <1849397656@qq.com>
#
# VCS package: tracks upstream main (https://github.com/ccch1mneyyy/dsh-TUI) and
# rebuilds the TUI from whatever is at HEAD at build time.
#
# This is the source counterpart of dsh-tui-bin (AUR, maintainer calmcrow), which
# npm-installs the published @deepseek-harness-tui/dsh-tui tarball and then lets
# the launcher's own `dsh-tui update` fill the user's dsh profile. Upstream
# develops on main and only tags every few releases: HEAD is currently 7 commits
# past v0.17.0 (1798 commits in total), including the DSH 0.2.1-rc.5 adapter
# changes that no published tarball contains yet. That is the reason this package
# exists.
#
# ─── How the launcher works, and why this package does not ship a "thin shell" ───
#
# bin/dsh-tui.js is a dual-role launcher. The copy that `npm i -g` puts on PATH
# is a *thin shell*: it locates the real copy in $DSH_HOME/profiles/dsh-tui and
# delegates every invocation to it. `dsh-tui update` installs that profile copy
# from the npm registry. Shipping only the thin shell therefore reproduces the
# behaviour of a plain npm install of the latest release -- a package called
# "-git" that silently runs release code. This package installs the built master
# tree to /usr/lib/dsh-tui and links the dsh profile at it (see the .install
# file), so the profile copy *is* the packaged tree and `(profile)` in
# `dsh-tui --version` proves master is running. The launcher detects that the
# profile entry resolves to its own directory (realpath comparison) and skips
# delegation instead of looping; that is what makes the link approach safe.
# The .install hook is switchable (/etc/dsh-tui-git.conf): `auto` (default) links
# the profile, granting dsh's narrow exact-version exemption only when dsh's
# gate refuses on stale published metadata; `link` keeps the strict gate;
# `link-accept-risk` grants up front; `bin` skips the profile entirely and is
# then exactly the thin-shell package for people who want release behaviour.
#
# ─── Build chain (mirrors .github/workflows/publish.yml) ───
#   pnpm install --frozen-lockfile   # root `prepare` already runs the compile
#   pnpm compile                     # build-vendor -> clean -> tsc -> settings
# The pnpm-lock.yaml is authoritative (frozen) and the build is not sandboxed
# from the network: `pnpm install` fetches the full dev tree (the DSH 0.2.1-rc.5
# stack, TypeScript, tsx, tsdown for the vendored dsh-std) from the registry and
# `git submodule update` fetches vendor/dsh-std from GitHub. Total download is
# roughly 0.9-1.1 GiB. Nothing but the runtime closure is installed into the
# package (see build()).
#
# ─── vendor/dsh-std is a submodule, and building without it cannot work ───
# .gitmodules pins vendor/dsh-std -> https://github.com/T-Auto/dsh-std.git
# (currently 614dfa1ac168db79fcf4577cf0ebb34e2e3b944b). Upstream's publish
# workflow comments that a checkout without it produces dangling workspace
# links and TS2307 across the whole tsc run. prepare() checks it out. The
# submodule commit is fixed by the superproject tree, so the checkout stays
# reproducible even though it is fetched at build time.
#
# ─── pnpm version ───
# package.json pins packageManager: pnpm@11.21.0. Arch ships pnpm 12.x and the
# /etc/npmrc-driven global prefix (/usr/local/lib/pnpm-global) is not writable
# during a build, which makes pnpm's package-manager self-management abort the
# install with "create the package-manager env directory ... Permission denied".
# pnpm 12.15.0 installs the (lockfileVersion 9.0) lockfile correctly and does
# not rewrite it, so the build disables only that self-management step
# (pnpm_config_manage_package_manager_versions=false) and uses the distro pnpm.
# Verified: `pnpm install --frozen-lockfile` completes in ~40 s and the lockfile
# is byte-identical afterwards. If a future lockfile needs the pinned pnpm, add
# `corepack` to makedepends and run the same commands through
# `corepack pnpm@11.21.0` -- no other change is required.

pkgname=dsh-tui-git
pkgver=0.17.0.r1798.g83fcf89
pkgrel=1
pkgdesc='Claude Code style fullscreen TUI launcher for DeepSeek Harness (dsh), built from the main branch'
arch=('x86_64')
url='https://github.com/ccch1mneyyy/dsh-TUI'
license=('MIT')
# Same runtime deps as dsh-tui-bin: the harness provides /usr/bin/dsh, node runs
# the launcher, pnpm is what the profile's plugin installs are driven with.
depends=('deepseek-harness' 'nodejs' 'pnpm')
# git: VCS source + submodule; npm: the root `prepare` script shells out to
# `npm run compile`. nodejs/pnpm are not repeated here -- they are already
# runtime dependencies and makepkg installs depends for the build too.
makedepends=('git' 'npm')
install="$pkgname.install"
# The payload is JavaScript plus the sharp/node native addons inside node_modules;
# stripping is pointless there and debug symbols do not exist.
options=('!strip' '!debug')
provides=('dsh-tui')
# dsh-tui-bin installs the same launcher and the same /usr/bin names; dsh-tui is
# the base name both provide, dsh-git is the convention used by the sibling
# harness packages. Only one of them may own the profile link.
conflicts=('dsh-tui' 'dsh-tui-bin' 'dsh-git')

source=("$pkgname::git+https://github.com/ccch1mneyyy/dsh-TUI.git#branch=main")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  # Required before anything compiles: the @dsh-std/* workspace packages the
  # tsc run imports live in this submodule, and an empty vendor/dsh-std gives
  # a dangling-link + TS2307 avalanche (see upstream publish.yml). The commit
  # is pinned by the superproject, so this is reproducible.
  git submodule update --init --recursive
}

pkgver() {
  cd "$pkgname"
  local _ver _rev _sha
  # package.json is the upstream release version; the commit count keeps the
  # AUR version monotonic between releases, and the sha pins what was built.
  _ver=$(sed -n 's/^[[:space:]]*"version":[[:space:]]*"\([^"]*\)".*/\1/p' package.json | head -n1)
  [ -n "$_ver" ] || { error "cannot read version from package.json"; return 1; }
  _rev=$(git rev-list --count HEAD)
  _sha=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "$_ver" "$_rev" "$_sha"
}

build() {
  cd "$pkgname"

  # Keep the package-manager store/cache inside $srcdir so a clean build is
  # self-contained (a clean chroot has no useful cache either). Override the
  # variable to reuse a warm store on the same filesystem.
  export pnpm_config_store_dir="${pnpm_config_store_dir:-$srcdir/pnpm-store}"
  export npm_config_cache="${npm_config_cache:-$srcdir/npm-cache}"
  # See the pnpm note in the header: only the self-management step is disabled,
  # the lockfile is still installed frozen.
  export pnpm_config_manage_package_manager_versions=false

  # CI recipe. The root `prepare` script runs the compile as part of this
  # install; the explicit `pnpm compile` afterwards is what publish.yml does and
  # keeps the packaged lib/ identical to the published one (build-vendor is
  # stamp-cached, so the second pass only re-runs clean + tsc + settings).
  pnpm install --frozen-lockfile
  pnpm compile

  # Same existence checks the release workflow runs before publishing.
  test -f lib/types/index.js
  test -f lib/types/dsh-adapter/invariant.js
  test -f lib/settings.json

  # Runtime dependency closure only. A full `pnpm install` leaves ~770 MiB of
  # devDependencies (the whole @deepseek-ai/dsh-* dev tree, TypeScript, tsdown)
  # in node_modules/.pnpm; installing the production graph from scratch brings
  # that to ~62 MiB and drops the dev-only peers that pnpm auto-installs for the
  # root project. --ignore-scripts keeps `prepare` (and therefore the compile)
  # from running again in this pruned tree.
  rm -rf node_modules
  pnpm install --frozen-lockfile --prod --ignore-scripts
}

package() {
  cd "$pkgname"

  # /usr/lib/dsh-tui is deliberately not an npm global prefix: it is an
  # application payload with its own node_modules, and the dsh profile links
  # this directory. The relative layout of node_modules/ and vendor/ has to be
  # preserved byte-for-byte in structure: pnpm's symlinks inside node_modules
  # resolve as ../../vendor/... and node's resolver walks back up through them.
  install -d "$pkgdir/usr/lib/dsh-tui"

  # What `npm publish` ships (the "files" list in package.json) plus the
  # files npm always includes. src/, docs/, scripts/ and the test fixtures are
  # build-time only.
  cp -a bin cli lib assets locale presets guide tui-profile \
    cordis.yml cordis.patch.yml package.json README.md \
    "$pkgdir/usr/lib/dsh-tui/"

  # Built workspace packages. node_modules/@dsh-std/* and
  # node_modules/@dsh-tui-vendor/* are symlinks into vendor/, so the target
  # directories must ship; vendor/dsh-std/node_modules (the nested build tree,
  # ~119 MiB) is not needed at runtime.
  install -d "$pkgdir/usr/lib/dsh-tui/vendor/dsh-std"
  cp -a vendor/dsh-std/packages "$pkgdir/usr/lib/dsh-tui/vendor/dsh-std/"
  cp -a vendor/mathjax-tex-svg "$pkgdir/usr/lib/dsh-tui/vendor/"

  # The workspace packages carry pnpm's build-time node_modules (links into the
  # dev store that the nested vendor/ build created). Runtime never reads them:
  # the bundled @dsh-std/* packages import their siblings by walking up to
  # /usr/lib/dsh-tui/node_modules, and peers come from the dsh host. Shipping
  # them would only add dangling links, so drop them.
  find "$pkgdir/usr/lib/dsh-tui/vendor" -type d -name node_modules -prune -exec rm -rf {} +

  # Production dependency tree (pnpm isolated linker: .pnpm store + relative
  # symlinks, portable as a whole).
  cp -a node_modules "$pkgdir/usr/lib/dsh-tui/"

  # pnpm bookkeeping that points at $srcdir; meaningless (and misleading) once
  # the tree lives in /usr.
  rm -f "$pkgdir/usr/lib/dsh-tui/node_modules/.modules.yaml" \
    "$pkgdir/usr/lib/dsh-tui/node_modules/.pnpm-workspace-state-v1.json"
  rm -rf "$pkgdir/usr/lib/dsh-tui/node_modules/.pnpm-task-run-state-v1" \
    "$pkgdir/usr/lib/dsh-tui/node_modules/.cache"

  # Any link left dangling after the pruning above (pnpm hoisting bookkeeping
  # for dev-only packages) is dead weight in a package; remove it so
  # `pacman -Qkk` stays clean. The empty directories that pnpm's bookkeeping
  # leaves behind go with it (namcap flags empty dirs).
  find "$pkgdir/usr/lib/dsh-tui" -xtype l -delete
  find "$pkgdir/usr/lib/dsh-tui" -depth -type d -empty -delete

  # cp -a preserves the build-time modes, and pnpm creates a few directories as
  # 0777. The payload is root-owned data read by node; normalise it (executable
  # bits survive: the launcher scripts in bin/ and the .bin shims keep them).
  find "$pkgdir/usr/lib/dsh-tui" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/lib/dsh-tui" -type f ! -perm /u+x -exec chmod 644 {} +
  find "$pkgdir/usr/lib/dsh-tui" -type f -perm /u+x -exec chmod 755 {} +

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY_LICENSES "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES"

  # Both names are the same entry point (package.json "bin"); upstream's
  # launcher, docs and /usr/bin/dsh-tui-bin use them interchangeably.
  install -d "$pkgdir/usr/bin"
  ln -s ../lib/dsh-tui/bin/dsh-tui.js "$pkgdir/usr/bin/dsh-tui"
  ln -s ../lib/dsh-tui/bin/dsh-tui.js "$pkgdir/usr/bin/dst"
}

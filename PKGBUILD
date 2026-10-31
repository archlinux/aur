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
# exists. dsh-tui-bin and this package install the same /usr/bin names, provide
# the same capability and therefore conflict; only one of them may own the
# profile dependency.
#
# ─── Design: ship the release pipeline's tarball, not a /usr tree ────────────
#
# The payload is exactly what upstream publishes: `npm pack` of the compiled
# repository root, i.e. package.json "files" plus the eight bundledDependencies
# (@dsh-std/* and @dsh-tui-vendor/mathjax-tex-svg, built from the vendor/
# submodules). It is installed as
#
#     /usr/share/dsh-tui/dsh-tui-<pkgver>-<pkgrel>.tgz
#
# and the .install hook adds it to the user's dsh profile as a *file:* plugin:
#
#     dsh plugin --profile dsh-tui add file:/usr/share/dsh-tui/dsh-tui-....tgz
#
# The profile's own pnpm then installs that tarball under
# $DSH_HOME/profiles/dsh-tui/node_modules/@deepseek-harness-tui/dsh-tui exactly
# like an npm release, resolving its 30 runtime dependencies from the registry.
# Its 39 @deepseek-ai/* peerDependencies are not installed into the profile at
# all: when the app runs, dsh's own process-local module resolution maps those
# bare names onto the running harness installation (dsh 0.2.1-rc.4 ships 306 of
# them under /usr/lib/node_modules/@deepseek-ai/dsh/node_modules). That is why
# the tree must live *inside* the profile and must not be linked from /usr.
#
# The previous pkgrel shipped the compiled tree at /usr/lib/dsh-tui and linked
# the profile at it (`add link:/usr/lib/dsh-tui`). That cannot work: ESM
# resolution for /usr/lib/dsh-tui/lib/... walks /usr/lib/dsh-tui/node_modules,
# /usr/lib/node_modules, ... and none of them contains the @deepseek-ai/*
# packages, while the `link:` install had also pruned the profile's own copies.
# `dst` died with ERR_MODULE_NOT_FOUND on @deepseek-ai/dsh-session-persistence-jsonl
# (imported by lib/types/dsh-adapter/migrate/index.js). Corollary, and the rule
# this package now follows: the full application tree is never installed outside
# $DSH_HOME.
#
# /usr/lib/dsh-tui therefore only holds the launcher's *global (thin shell)*
# role: bin/dsh-tui.js + package.json. That copy is what /usr/bin/dst and
# /usr/bin/dsh-tui point at; it looks up the profile copy and delegates every
# invocation to it (`dst --version` prints `(profile)`), so the code that runs
# is always the packaged profile tree, never a /usr copy and never a registry
# release. The launcher is written for exactly this split (its bootstrap path is
# what `npm i -g` uses), so no file of it is patched.
#
# ─── Build-time network and disk ────────────────────────────────────────────
#
# The build is not sandboxed from the network, same as the release pipeline:
#   * `git submodule update` fetches vendor/dsh-std from GitHub;
#   * `pnpm install --frozen-lockfile` fetches the whole dev tree (the DSH
#     0.2.1-rc.x stack, TypeScript, tsdown, ...) -- roughly 1 GiB on a cold
#     store. A warm pnpm store (pnpm_config_store_dir, override the variable to
#     reuse one) turns the install into a hard-link pass of ~40 s.
# The resulting package is ~19 MB: the 18.6 MB npm tarball plus the launcher.
#
# ─── Install-time network (pacman hook) ─────────────────────────────────────
#
# The profile install is a pnpm install, so *installing this package* needs the
# network: pnpm resolves the tarball's dependencies from the configured
# registry. This is the same nature as dsh-tui-bin (npm install at install
# time). The hook is best effort by design: a failure (offline, proxy, broken
# unrelated profile dependency) never aborts the pacman transaction, it prints
# the exact command to rerun. A rerun of `pacman -S dsh-tui-git` or of that
# command is enough, the hook is idempotent.
#
# The tarball's file name carries pkgrel on purpose: the profile's dependency
# specifier is the file path, and pnpm only re-resolves a file: dependency when
# its specifier changes. Same pkgver with a new pkgrel (a rebuild) must still
# refresh the profile.
#
# ─── dsh compatibility gate: why the tarball and not the registry ────────────
#
# `dsh plugin add` refuses a plugin whose declared @deepseek-ai/* peer ranges do
# not include the running harness. For a registry spec dsh validates the
# *published* manifest: published 0.17.0 tops out at dsh 0.2.1-rc.3, so on
# 0.2.1-rc.4 it is refused with `incompatible-version` unless the user grants an
# exact-version exemption first. This package needs no exemption: the tarball is
# our compiled master manifest, which already lists 0.2.1-rc.2/rc.3/rc.4/rc.5
# (and 0.2.0-rc.x) -- the profile install passes the gate on its own. If a
# future dsh line is newer than the tree's ranges, the hook reports the refusal
# and offers the explicit `allow-version` (mode = accept-risk) escape hatch.
#
# ─── Build chain (mirrors .github/workflows/publish.yml) ────────────────────
#   pnpm install --frozen-lockfile   # root `prepare` already runs the compile
#   pnpm compile                     # build-vendor -> clean -> tsc -> settings
#   pnpm verify:package              # upstream tarball gate (files/files list)
#   node scripts/with-publish-manifest.mjs npm pack --ignore-scripts
# `pnpm verify:build` (the release job's runtime gate) is deliberately not run:
# it is a full test suite, not a packaging check.
#
# ─── vendor/dsh-std is a submodule, and building without it cannot work ────
# .gitmodules pins vendor/dsh-std -> https://github.com/T-Auto/dsh-std.git
# (currently 614dfa1ac168db79fcf4577cf0ebb34e2e3b944b). Upstream's publish
# workflow comments that a checkout without it produces dangling workspace
# links and TS2307 across the whole tsc run. prepare() checks it out. The
# submodule commit is fixed by the superproject tree, so the checkout stays
# reproducible even though it is fetched at build time.
#
# ─── Why npm packs, and why the manifest wrapper ───────────────────────────
# @dsh-std/* are *workspace* packages used as bundleDependencies; the repo
# depends on them as `workspace:*`, which a published manifest cannot carry and
# which pnpm refuses to pack under its isolated linker. scripts/with-publish-
# manifest.mjs (upstream's own publish wrapper) rewrites those entries to exact
# optionalDependencies for the duration of the npm command and restores the
# manifest afterwards, so npm packs the physical copies out of
# node_modules/@dsh-std/* (symlinks into vendor/dsh-std/packages/*) into the
# tarball. --ignore-scripts matches `npm publish --ignore-scripts` in
# publish.yml: lib/ is already built above.
#
# ─── pnpm version ───────────────────────────────────────────────────────────
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
pkgrel=2
pkgdesc='Claude Code style fullscreen TUI launcher for DeepSeek Harness (dsh), built from the main branch'
# No compiled artifact of our own ships (the payload is a portable npm tarball
# of JavaScript plus assets, and the launcher is JS), so the package is 'any'.
# The arch-specific pieces of the closure (sharp, sixel, ...) are optional
# dependencies that the profile's pnpm fetches for the user's own platform.
arch=('any')
url='https://github.com/ccch1mneyyy/dsh-TUI'
license=('MIT')
# Same runtime deps as dsh-tui-bin: the harness provides /usr/bin/dsh (and the
# @deepseek-ai/* packages the app resolves at runtime), node runs the launcher,
# pnpm is what the profile's plugin installs are driven with.
depends=('deepseek-harness' 'nodejs' 'pnpm')
# git: VCS source + submodule; npm: the root `prepare` script shells out to
# `npm run compile`, and the payload is produced by `npm pack`.
# nodejs/pnpm are not repeated here -- they are already runtime dependencies and
# makepkg installs depends for the build too.
makedepends=('git' 'npm')
install="$pkgname.install"
# The payload is an npm tarball plus the launcher JS; stripping is pointless
# there, and the tarball has to stay byte-identical to be a valid npm artifact.
options=('!strip' '!debug')
provides=('dsh-tui')
# dsh-tui-bin installs the same launcher and the same /usr/bin names; dsh-tui is
# the base name both provide, dsh-git is the convention used by the sibling
# harness packages. Only one of them may own the profile dependency.
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
  # install; the explicit `pnpm compile` afterwards is what publish.yml does.
  pnpm install --frozen-lockfile
  pnpm compile

  # Same existence checks the release workflow runs before publishing.
  test -f lib/types/index.js
  test -f lib/types/dsh-adapter/invariant.js
  test -f lib/settings.json

  # Upstream's tarball gate: every manifest entry point, the packaged preset,
  # the user guide, the first-party feed, and no CLI test fixtures.
  pnpm verify:package

  # The tarball the release pipeline publishes. npm, not pnpm: see the header.
  node scripts/with-publish-manifest.mjs npm pack --ignore-scripts

  local _tgz
  _tgz=$(ls -1 deepseek-harness-tui-dsh-tui-*.tgz)
  [ -n "$_tgz" ] || { error "npm pack produced no tarball"; return 1; }
  # Fail the build instead of shipping a payload that cannot start: the runtime
  # entry points must be in the tarball and all eight bundled workspace
  # packages must have been dereferenced into node_modules/. A missing bundle is
  # exactly the kind of "packed fine, dies at runtime" payload this package must
  # never publish again.
  local _f
  for _f in package/lib/types/index.js package/lib/types/dsh-adapter/invariant.js \
    package/lib/settings.json package/bin/dsh-tui.js package/package.json \
    package/cordis.yml package/cordis.patch.yml package/tui-profile/feed/first-party.json; do
    tar -tzf "$_tgz" "$_f" > /dev/null || { error "tarball is missing $_f"; return 1; }
  done
  local _bundled
  _bundled=$(tar -tzf "$_tgz" |
    grep -cE '^package/node_modules/(@dsh-std/[a-z]+|@dsh-tui-vendor/mathjax-tex-svg)/package\.json$')
  [ "$_bundled" -eq 8 ] || { error "tarball carries $_bundled/8 bundled packages"; return 1; }
}

package() {
  cd "$pkgname"

  local _tgz
  _tgz=$(ls -1 deepseek-harness-tui-dsh-tui-*.tgz)
  [ -n "$_tgz" ] || { error "npm pack produced no tarball"; return 1; }

  # The one artifact the profile installs. pkgrel is part of the name so an
  # upgrade always changes the profile's file: specifier (see the header).
  install -Dm644 "$_tgz" \
    "$pkgdir/usr/share/dsh-tui/dsh-tui-$pkgver-$pkgrel.tgz"

  # Global copy on PATH: the launcher's thin-shell role, and nothing else. It
  # reads its own package.json (name/version) and delegates to
  # $DSH_HOME/profiles/dsh-tui/node_modules/@deepseek-harness-tui/dsh-tui.
  # Shipping the application tree here would put lib/ back on the plain-node
  # ESM path outside the profile, which is what used to crash (see the header).
  install -d "$pkgdir/usr/lib/dsh-tui/bin"
  install -m755 bin/dsh-tui.js "$pkgdir/usr/lib/dsh-tui/bin/dsh-tui.js"
  install -m644 package.json LICENSE README.md "$pkgdir/usr/lib/dsh-tui/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY_LICENSES "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES"

  # Both names are the same entry point (package.json "bin"); upstream's
  # launcher, docs and /usr/bin/dsh-tui-bin use them interchangeably.
  install -d "$pkgdir/usr/bin"
  ln -s ../lib/dsh-tui/bin/dsh-tui.js "$pkgdir/usr/bin/dsh-tui"
  ln -s ../lib/dsh-tui/bin/dsh-tui.js "$pkgdir/usr/bin/dst"
}

# Maintainer: Marat Bakeev <hawara[at]gmail[dot]com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=nodejs-gsd-core
_pkgname=gsd-core
_scope=@opengsd
pkgver=1.13.0
pkgrel=1
pkgdesc="GSD Core — spec-driven AI dev workflow engine: Research→Plan→Execute→Verify→Ship with 65+ slash commands for Claude Code/Cursor"
arch=('any')
url="https://github.com/open-gsd/gsd-core"
license=('MIT')
depends=('nodejs>=22')
# Both runtime deps are dependency-free, so node_modules is fully vendored from
# pinned tarballs — no network access during build, fully reproducible.
_sdkver=0.2.84
_wsver=8.21.0
source=(
  "$_pkgname-$pkgver.tgz::https://registry.npmjs.org/$_scope/$_pkgname/-/$_pkgname-$pkgver.tgz"
  "claude-agent-sdk-$_sdkver.tgz::https://registry.npmjs.org/@anthropic-ai/claude-agent-sdk/-/claude-agent-sdk-$_sdkver.tgz"
  "ws-$_wsver.tgz::https://registry.npmjs.org/ws/-/ws-$_wsver.tgz"
  use-installed-binary.patch
)
noextract=(
  "$_pkgname-$pkgver.tgz"
  "claude-agent-sdk-$_sdkver.tgz"
  "ws-$_wsver.tgz"
)
sha256sums=('f935c47ff59a120071a1f6588c20c17a1f0021346ec6d4a2ef0211bacab33a1a'
            '8f53c2b7c671553fa161fad473c54fd76a6679f85dc5df63e7895c33d013103c'
            'd08b726b3aae3a0fed5218a0d9a4b2ac8d75d4ad453a9271db55fe38e94eb4cf'
            '97155997a69ffabd99ff3d1fa63ef33d52181bb009c0792f660efd5ccd9af56c')

_modroot="usr/lib/node_modules/$_scope/$_pkgname"

prepare() {
  cd "$srcdir"
  # npm tarballs all unpack to ./package. Extract gsd-core, then assemble its
  # node_modules in-place so check() can exercise the same tree we package.
  mkdir -p "$_pkgname"
  tar -xzf "$_pkgname-$pkgver.tgz" -C "$_pkgname" --strip-components=1

  mkdir -p "$_pkgname/node_modules/@anthropic-ai/claude-agent-sdk" "$_pkgname/node_modules/ws"
  tar -xzf "claude-agent-sdk-$_sdkver.tgz" \
    -C "$_pkgname/node_modules/@anthropic-ai/claude-agent-sdk" --strip-components=1
  tar -xzf "ws-$_wsver.tgz" -C "$_pkgname/node_modules/ws" --strip-components=1

  # claude-agent-sdk is a declared dependency but is not referenced by any of the
  # shipped gsd-core CLIs (install.js / gsd-tools / gsd_run). Its bundled native
  # helpers (prebuilt ripgrep, tree-sitter-bash, audio-capture for 6 platforms)
  # are therefore dead weight that would (a) make this `any` package contain
  # arch-specific ELF and (b) pull in alsa-lib via audio-capture. Drop the vendor
  # blobs entirely; the SDK's JS is kept to honour the package.json contract.
  rm -rf "$_pkgname/node_modules/@anthropic-ai/claude-agent-sdk/vendor"

  # Point the seeded Claude Code allow-rule at the installed binary, not `npx`.
  patch -d "$_pkgname" -Np1 -i "$srcdir/use-installed-binary.patch"
}

check() {
  cd "$srcdir/$_pkgname"
  # Catch upstream drift the file-copy package() can't: a new/renamed runtime
  # dependency we didn't vendor (require.resolve throws) or a moved/renamed bin
  # entry point (node --check / bash -n on a missing path fails). Turns a
  # silent runtime breakage into a build-time failure the auto-update gate sees.
  node -e 'for (const d of Object.keys(require("./package.json").dependencies||{})) require.resolve(d);'
  node --check bin/install.js
  node --check gsd-core/bin/gsd-tools.cjs
  bash -n gsd-core/bin/gsd_run
}

package() {
  cd "$srcdir"

  # Whole payload incl. the node_modules assembled (and pruned) in prepare().
  install -d "$pkgdir/$_modroot"
  cp -r "$_pkgname/." "$pkgdir/$_modroot/"

  # Executable launchers on PATH (absolute symlinks into the module tree).
  install -d "$pkgdir/usr/bin"
  ln -s "/$_modroot/bin/install.js"             "$pkgdir/usr/bin/gsd-core"
  ln -s "/$_modroot/gsd-core/bin/gsd-tools.cjs" "$pkgdir/usr/bin/gsd-tools"
  ln -s "/$_modroot/gsd-core/bin/gsd_run"       "$pkgdir/usr/bin/gsd_run"
  chmod 755 "$pkgdir/$_modroot/bin/install.js" \
            "$pkgdir/$_modroot/gsd-core/bin/gsd-tools.cjs" \
            "$pkgdir/$_modroot/gsd-core/bin/gsd_run"

  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=senpi
pkgver=2026.8.13
pkgrel=1
_npmver=${pkgver//_/-}
pkgdesc='Opinionated coding agent CLI based on pi'
arch=('x86_64' 'aarch64')
url='https://github.com/code-yeongyu/senpi'
license=('MIT')
depends=('nodejs>=24' 'glibc' 'gcc-libs')
optdepends=(
  'git: repository-aware workflows and package installation'
  'ripgrep: faster in-repository text search'
  'fd: faster file discovery'
  'python: running bundled Python extension examples'
)
conflicts=('senpi-bin' 'senpi-git')
options=('!strip' '!debug')

_clipboard_ver=0.3.9
source=(
  "$pkgname-$_npmver.tgz::https://registry.npmjs.org/@code-yeongyu/senpi/-/senpi-$_npmver.tgz"
  "$pkgname-$_npmver-LICENSE::https://raw.githubusercontent.com/code-yeongyu/senpi/v$_npmver/LICENSE"
)
source_x86_64=(
  "$pkgname-$_npmver-clipboard-x64::https://registry.npmjs.org/@mariozechner/clipboard-linux-x64-gnu/-/clipboard-linux-x64-gnu-$_clipboard_ver.tgz"
)
source_aarch64=(
  "$pkgname-$_npmver-clipboard-arm64::https://registry.npmjs.org/@mariozechner/clipboard-linux-arm64-gnu/-/clipboard-linux-arm64-gnu-$_clipboard_ver.tgz"
)
noextract=("$pkgname-$_npmver.tgz")
sha256sums=('c36c3a7fd0080d313d9b7b2b88d19248e95378d63e5b782f7acced2115094281'
            'b572487f123bf259487f7dab25923af16fecd08ed7a2c50964f393282dba883c')
sha256sums_x86_64=('106b4f4a9218991056912937dfc6b7a2311d5ddf360c9692a765559656beb05e')
sha256sums_aarch64=('652eb7575ab534099a3698cb08722aa4b985b681c84e6e13dc8bcb57db94d42d')

package() {
  local _target="$pkgdir/usr/lib/node_modules/@code-yeongyu/$pkgname"
  local _clipboard_arch=x64

  if [[ $CARCH == aarch64 ]]; then
    _clipboard_arch=arm64
  fi

  install -d "$(dirname "$_target")"
  bsdtar -xf "$srcdir/$pkgname-$_npmver.tgz" -C "$(dirname "$_target")"
  mv "$(dirname "$_target")/package" "$_target"

  # The npm bundle contains the publisher host's optional clipboard addon.
  # Replace it with the matching Arch asset for this build.
  rm -rf "$_target/node_modules/@mariozechner"/clipboard-linux-*
  rm -f "$_target/node_modules/@mariozechner/clipboard"/clipboard.*.node
  bsdtar -xf "$srcdir/$pkgname-$_npmver-clipboard-$_clipboard_arch" \
    -C "$_target/node_modules/@mariozechner"
  mv "$_target/node_modules/@mariozechner/package" \
    "$_target/node_modules/@mariozechner/clipboard-linux-$_clipboard_arch-gnu"

  # Keep only native helpers matching this Linux architecture.
  local _tui_native="$_target/node_modules/@earendil-works/pi-tui/native"
  local _pty_prebuilds="$_target/node_modules/@earendil-works/pi-pty/native/prebuilds"
  local _native_dir

  for _native_dir in "$_tui_native"/*; do
    [[ -d $_native_dir ]] || continue
    [[ ${_native_dir##*/} == linux ]] || rm -rf "$_native_dir"
  done
  for _native_dir in "$_tui_native/linux/prebuilds"/*; do
    [[ -d $_native_dir ]] || continue
    [[ ${_native_dir##*/} == linux-$_clipboard_arch ]] || rm -rf "$_native_dir"
  done
  for _native_dir in "$_pty_prebuilds"/*; do
    [[ -d $_native_dir ]] || continue
    [[ ${_native_dir##*/} == linux-$_clipboard_arch ]] || rm -rf "$_native_dir"
  done
  rmdir --ignore-fail-on-non-empty "$_tui_native" "$_pty_prebuilds" 2>/dev/null || true
  rm -rf "$_target/node_modules/marked/man"
  chmod -R go-w "$_target"

  install -d "$pkgdir/usr/bin"
  ln -s "../lib/node_modules/@code-yeongyu/$pkgname/dist/cli.js" \
    "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/$pkgname-$_npmver-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

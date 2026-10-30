# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=senpi
pkgver=2026.10.30_2
pkgrel=1
_npmver=${pkgver//_/-}
pkgdesc='Opinionated coding agent CLI based on pi'
arch=('x86_64' 'aarch64')
url='https://github.com/code-yeongyu/senpi'
license=('MIT')
depends=('nodejs>=24' 'glibc' 'gcc-libs' 'libxcb' 'ripgrep')
makedepends=('npm')
optdepends=(
  'git: repository-aware workflows and package installation'
  'fd: faster file discovery'
  'python: Python eval kernel support'
)
conflicts=('senpi-bin' 'senpi-git')
options=('!strip' '!debug')

source=(
  "$pkgname-$_npmver.tgz::https://registry.npmjs.org/@code-yeongyu/senpi/-/senpi-$_npmver.tgz"
  "$pkgname-$_npmver-LICENSE::https://raw.githubusercontent.com/code-yeongyu/senpi/v$_npmver/LICENSE"
)
noextract=("$pkgname-$_npmver.tgz")
sha256sums=('914abe1d75e288f167baa15ab0454d09c41ed04c22cd0f096a9a1a1b08541e4e'
            'b572487f123bf259487f7dab25923af16fecd08ed7a2c50964f393282dba883c')

package() {
  local _target="$pkgdir/usr/lib/node_modules/@code-yeongyu/$pkgname"
  local _native_arch=x64

  if [[ $CARCH == aarch64 ]]; then
    _native_arch=arm64
  fi

  npm install -g \
    --ignore-scripts \
    --prefix "$pkgdir/usr" \
    --cache "$srcdir/npm-cache" \
    --no-audit --no-fund --loglevel=warn \
    "$srcdir/$pkgname-$_npmver.tgz"
  rm -f "$pkgdir/usr/bin/pi"
  rm -rf "$pkgdir/usr/etc"
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
    [[ ${_native_dir##*/} == linux-$_native_arch ]] || rm -rf "$_native_dir"
  done
  for _native_dir in "$_pty_prebuilds"/*; do
    [[ -d $_native_dir ]] || continue
    [[ ${_native_dir##*/} == linux-$_native_arch ]] || rm -rf "$_native_dir"
  done
  rmdir --ignore-fail-on-non-empty "$_tui_native" "$_pty_prebuilds" 2>/dev/null || true
  rm -rf "$_target/node_modules/marked/man"
  chmod -R go-w "$pkgdir/usr"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir"

  install -Dm644 "$srcdir/$pkgname-$_npmver-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

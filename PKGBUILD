# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=senpi
pkgver=2026.9.12_3
pkgrel=1
_npmver=${pkgver//_/-}
pkgdesc='Opinionated coding agent CLI based on pi'
arch=('x86_64' 'aarch64')
url='https://github.com/code-yeongyu/senpi'
license=('MIT')
depends=('nodejs>=24' 'glibc' 'gcc-libs' 'libxcb')
optdepends=(
  'git: repository-aware workflows and package installation'
  'ripgrep: faster in-repository text search'
  'fd: faster file discovery'
  'python: Python eval kernel support'
)
conflicts=('senpi-bin' 'senpi-git')
options=('!strip' '!debug')

_esbuild_ver=0.28.2
source=(
  "$pkgname-$_npmver.tgz::https://registry.npmjs.org/@code-yeongyu/senpi/-/senpi-$_npmver.tgz"
  "$pkgname-$_npmver-LICENSE::https://raw.githubusercontent.com/code-yeongyu/senpi/v$_npmver/LICENSE"
)
source_x86_64=(
  "$pkgname-$_npmver-esbuild-x64::https://registry.npmjs.org/@esbuild/linux-x64/-/linux-x64-$_esbuild_ver.tgz"
)
source_aarch64=(
  "$pkgname-$_npmver-esbuild-arm64::https://registry.npmjs.org/@esbuild/linux-arm64/-/linux-arm64-$_esbuild_ver.tgz"
)
noextract=("$pkgname-$_npmver.tgz")
sha256sums=('2114a156724ced550ac7355accfe853af2a141a4e74665af4aac2757a39cc39b'
            'b572487f123bf259487f7dab25923af16fecd08ed7a2c50964f393282dba883c')
sha256sums_x86_64=('9573bb2233aab0f9ea7647d5cca9726113cc1768de61d66b17267f4db84488f6')
sha256sums_aarch64=('a96dbfa41d3ef5dbd1ef22b1c10d5187be9267e86093a870f06402a7ec931596')

package() {
  local _target="$pkgdir/usr/lib/node_modules/@code-yeongyu/$pkgname"
  local _native_arch=x64

  if [[ $CARCH == aarch64 ]]; then
    _native_arch=arm64
  fi

  install -d "$(dirname "$_target")"
  bsdtar -xf "$srcdir/$pkgname-$_npmver.tgz" -C "$(dirname "$_target")"
  mv "$(dirname "$_target")/package" "$_target"

  # The npm bundle omits esbuild's optional platform package.
  # Install the matching official binary package for this build.
  install -d "$_target/node_modules/@esbuild"
  bsdtar -xf "$srcdir/$pkgname-$_npmver-esbuild-$_native_arch" \
    -C "$_target/node_modules/@esbuild"
  mv "$_target/node_modules/@esbuild/package" \
    "$_target/node_modules/@esbuild/linux-$_native_arch"

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
  chmod -R go-w "$_target"

  install -d "$pkgdir/usr/bin"
  ln -s "../lib/node_modules/@code-yeongyu/$pkgname/dist/cli.js" \
    "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/$pkgname-$_npmver-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

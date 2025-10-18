# Maintainer: Jason Go <jasongo@jasongo.net>
pkgbase=llrt-bin
pkgname=(
  'llrt-bin'
  'llrt-full-sdk-bin'
  'llrt-no-sdk-bin'
  'llrt-all-bin')
pkgver=0.7.0beta
_pkgver="${pkgver//beta/-beta}" # For GitHub urls
pkgrel=5
arch=('x86_64' 'aarch64')
url='https://github.com/awslabs/llrt'
license=('Apache-2.0')
optdepends=(
  'typescript: transpiler for TypeScript code with type checking support'
  'esbuild: fast compiler and bundler for JavaScript and TypeScript'
  'swc-js-bin: drop-in replacement for Babel with compilation and polyfill support'
  'bun-bin: fast runtime, compiler, and bundler for JavaScript and TypeScript')
provides=('llrt')
conflicts=('llrt')
source=("llrt-bin-$_pkgver-source.zip::$url/archive/refs/tags/v$_pkgver.zip")
source_x86_64=(
  "llrt-bin-$_pkgver-x86_64.zip::$url/releases/download/v$_pkgver/llrt-linux-x64.zip"
  "llrt-full-sdk-bin-$_pkgver-x86_64.zip::$url/releases/download/v$_pkgver/llrt-linux-x64-full-sdk.zip"
  "llrt-no-sdk-bin-$_pkgver-x86_64.zip::$url/releases/download/v$_pkgver/llrt-linux-x64-no-sdk.zip")
source_aarch64=(
  "llrt-bin-$_pkgver-aarch64.zip::$url/releases/download/v$_pkgver/llrt-linux-arm64.zip"
  "llrt-full-sdk-bin-$_pkgver-aarch64.zip::$url/releases/download/v$_pkgver/llrt-linux-arm64-full-sdk.zip"
  "llrt-no-sdk-bin-$_pkgver-aarch64.zip::$url/releases/download/v$_pkgver/llrt-linux-arm64-no-sdk.zip")
noextract=("${source_x86_64[@]%%::*}" "${source_aarch64[@]%%::*}")
sha256sums=('e8d38b80657ea515366003b217b16a33a0214228f89d6915b52604e0c4e040c6')
sha256sums_x86_64=(
  '12f065250f2c3f165949184017c021c97a2b7ff99fb2b89690488936e3117b14'
  '36a4e66845bab11a82763b0b90502a65d911cf29a752078a2daf34446257a94e'
  'c55879dcb3150691bdd9853e960cff3047e7f9c550c776f832bf9dad886aa623')
sha256sums_aarch64=(
  '1e1e317f9ff44d03913d9c4f05603b4e0f5d45fbb789c7c1c28a0daf2087d328'
  '7f2e06e9322e1df4220a0aec93dbe9da456470fcdced6313a87459831e96a5e8'
  'efea1bb318d6fddc10d10fa6555a3978156788b16c7518981d214dfcfac4efa0')

_install_llrt() {
  local target_pkgname="$1"
  local target_suffix="$2"
  bsdtar -xf "$target_pkgname-$_pkgver-$CARCH.zip" -C "$srcdir"
  install -Dm755 "$srcdir/llrt" "$pkgdir/usr/bin/llrt$target_suffix"
}

_install_licenses() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/llrt-$_pkgver/"{LICENSE,THIRD_PARTY_LICENSES,NOTICE}
}

package_llrt-bin() {
  pkgdesc='Lightweight JavaScript runtime, compiler, REPL, and test runner (STANDARD @aws-sdk bundled)'
  _install_llrt "$pkgname"
  _install_licenses
}

package_llrt-full-sdk-bin() {
  pkgdesc='Lightweight JavaScript runtime, compiler, REPL, and test runner (FULL @aws-sdk bundled)'
  _install_llrt "$pkgname"
  _install_licenses
}

package_llrt-no-sdk-bin() {
  pkgdesc='Lightweight JavaScript runtime, compiler, REPL, and test runner (NO @aws-sdk bundled)'
  _install_llrt "$pkgname"
  _install_licenses
}

package_llrt-all-bin() {
  pkgdesc='Lightweight JavaScript runtime, compiler, REPL, and test runner (All bundle types included with suffix: llrt, llrt-full-sdk, llrt-no-sdk)'
  _install_llrt 'llrt-bin'
  _install_llrt 'llrt-bin' '-std-sdk' # llrt-std-sdk is an alias to llrt
  _install_llrt 'llrt-full-sdk-bin' '-full-sdk'
  _install_llrt 'llrt-no-sdk-bin' '-no-sdk'
  _install_licenses
}

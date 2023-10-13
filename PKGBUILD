# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
_name=${pkgname%-bin}
pkgver=7.3.8
pkgrel=1
pkgdesc="A cross-platform automation and configuration tool/framework (binary package)"
arch=(x86_64 armv7h aarch64)
url="https://github.com/Powershell/Powershell"
license=(MIT)
depends=(
  gcc-libs
  glibc
  libpam.so
  zlib
)
provides=(powershell)
conflicts=(powershell)
install=powershell.install
options=(staticlibs)

_archive="$pkgname-$pkgver-$pkgrel"
_artifact="$_archive.tar.gz"

source_armv7h=("$_artifact::$url/releases/download/v$pkgver/powershell-$pkgver-linux-arm32.tar.gz")
source_aarch64=("$_artifact::$url/releases/download/v$pkgver/powershell-$pkgver-linux-arm64.tar.gz")
source_x86_64=("$_artifact::$url/releases/download/v$pkgver/powershell-$pkgver-linux-x64.tar.gz")
noextract=("$_artifact")

sha256sums_x86_64=('8842c3a054f2fd6e969b480d266cb0c2fa7cd755b27237df05330346dad67555')
sha256sums_armv7h=('4c043c49b4ccb3807ec23004f31b002485ece1f6335b8c1720f2f85da4a990de')
sha256sums_aarch64=('04d7f5e7bb1d5e0ee957a1df83d96ec375e2d377d37a47ac0500b00c578ef192')

prepare() {
  mkdir -p "$_archive"
  tar -xf $_artifact -C "$_archive"
}

package() {
  cd "$_archive"

  local pkgnum=${pkgver:0:1}

  mkdir -p "$pkgdir/opt/microsoft/$_name/$pkgnum"
  cp -ar "./." "$pkgdir/opt/microsoft/$_name/$pkgnum/"

  mkdir -p "$pkgdir/usr/bin/"
  ln -s "/opt/microsoft/$_name/$pkgnum/pwsh" "$pkgdir/usr/bin/pwsh"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
_name=${pkgname%-bin}
pkgver=7.3.7
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

sha256sums_x86_64=('18ab001fe03cf7f3357f1bf0e02e326fbf884dc7c3e98e0e89c6f52bc02cc302')
sha256sums_armv7h=('f95edb917661f91afbaa968d37ec3c166674f826017d680f954f047ca400b6da')
sha256sums_aarch64=('19a02ede70f4c51aaa1342e6ed9e436ba61440688215ce711ee2580cb2b24867')

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

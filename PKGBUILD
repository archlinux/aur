# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
_name=${pkgname%-bin}
pkgver=7.3.6
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

sha256sums_x86_64=('38bfba9aa4c914adf9f9a64b7f5832f8533305b696b5f03d0c3d56f9a2d8a5dc')
sha256sums_armv7h=('0bd7759895546ac04ed81368c7818036fc8b2d9826e476f0f249dab51a30797b')
sha256sums_aarch64=('02702c1373012ce9bd0f6a291d8d2763186cf6a9244ce4d22650bf4a4bd722c3')

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

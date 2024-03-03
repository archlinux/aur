# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
_pkgname=${pkgname%-bin}
pkgver=7.4.1
pkgrel=2
pkgdesc="A cross-platform automation and configuration tool/framework (binary package)"
arch=(x86_64 armv7h aarch64)
url="https://github.com/Powershell/Powershell"
license=(MIT)
depends=(
  gcc-libs
  glibc
  zlib
)
optdepends=('lttng-ust2.12: CoreCLR tracing')
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
sha256sums_x86_64=('8beabac4431b75e9b67c6d9fafd8b02cc019f21f230ea3d94aec1348c50529d3')
sha256sums_armv7h=('ba66844392026779145c10a72d9b9096fe9f71f196aecffce45678c25d37c007')
sha256sums_aarch64=('719c11544a1f6322f2c58f5591ff7abb7768aef97ef0a382e3711f89fa2ade22')

prepare() {
  mkdir -p "$_archive"
  tar -xf $_artifact -C "$_archive"
}

package() {
  cd "$_archive"

  local pkgnum=${pkgver:0:1}

  install -dm755 "$pkgdir/usr/lib/$_pkgname-$pkgnum"
  cp --archive -t "$pkgdir/usr/lib/$_pkgname-$pkgnum" ./*

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname-$pkgnum/pwsh" "$pkgdir/usr/bin/pwsh"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}

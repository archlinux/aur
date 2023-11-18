# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
_name=${pkgname%-bin}
pkgver=7.4.0
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

sha256sums_x86_64=('aa82c3e9241503b52db1827e3fd7fc099da74f828ba032e9b726e50c72b4bee5')
sha256sums_armv7h=('6a5b31ef2a4976aa20e5e39a47acab0575f189c8d66895c0e341d6e2a6442681')
sha256sums_aarch64=('13d317610ba133c002990c40622a886989368460451809861f378c25730989f4')

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

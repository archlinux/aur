# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
_name=${pkgname%-bin}
pkgver=7.3.9
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

sha256sums_x86_64=('787961e3a795fa0dde0a229a9551a2c70298f66964da55d1c14245e81cb994fd')
sha256sums_armv7h=('b418ddff396b23d7b8e1046c20e6174031815f04e72c3ac455b7de6b99311982')
sha256sums_aarch64=('cf2e956725e3f535794255459c282207a5df20ec92efd90f38586f311a4eacfe')

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

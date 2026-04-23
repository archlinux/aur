# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
_pkgname=${pkgname%-bin}
pkgver=7.6.1
pkgrel=1
pkgdesc="A cross-platform automation and configuration tool/framework (binary package)"
arch=(x86_64 armv7h aarch64)
url="https://github.com/Powershell/Powershell"
license=(MIT)
depends=(
  gcc-libs
  glibc
)
optdepends=('lttng-ust2.12: CoreCLR tracing')
provides=(powershell)
conflicts=(powershell)
install=powershell.install
_archive="$pkgname-$pkgver-$pkgrel"
_artifact="$_archive.tar.gz"
source_armv7h=("$_artifact::$url/releases/download/v$pkgver/powershell-$pkgver-linux-arm32.tar.gz")
source_aarch64=("$_artifact::$url/releases/download/v$pkgver/powershell-$pkgver-linux-arm64.tar.gz")
source_x86_64=("$_artifact::$url/releases/download/v$pkgver/powershell-$pkgver-linux-x64.tar.gz")
noextract=("$_artifact")
sha256sums_x86_64=('dfc94229767921603f7c3e1cb1ac5aa931448af7496ccf657723b6278057c415')
sha256sums_armv7h=('50e3b4a3b36a61720abe92decda8c518c784b76d9371c8c32ae481566d5cf076')
sha256sums_aarch64=('73498813194ea0d849d5942332ee6e51657ea66da08216aa1050788d5c52b741')

prepare() {
  mkdir -p "$_archive"
  tar -xf $_artifact -C "$_archive"
}

package() {
  cd "$_archive"

  local pkgnum=${pkgver:0:1}

  install -dm755 "$pkgdir/usr/lib/$_pkgname-$pkgnum"
  cp -a -t "$pkgdir/usr/lib/$_pkgname-$pkgnum" ./*
  # The pwsh executable is not executable in the archive, for some reason.
  chmod 755 "$pkgdir/usr/lib/$_pkgname-$pkgnum/pwsh"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname-$pkgnum/pwsh" "$pkgdir/usr/bin/pwsh"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}

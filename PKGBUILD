# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
_pkgname=${pkgname%-bin}
pkgver=7.5.4
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
sha256sums_x86_64=('1fd7983fe56ca9e6233f126925edb24bf6b6b33e356b69996d925c4db94e2fef')
sha256sums_armv7h=('3553be9a484ec9627c7ad70debc62a39ecf96814d76513cc9c77acae9e5b3ecd')
sha256sums_aarch64=('4b32d4cb86a43dfb83d5602d0294295bf22fafbf9e0785d1aaef81938cda92f8')

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

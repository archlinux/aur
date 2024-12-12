# Based on powershell-bin (https://aur.archlinux.org/packages/powershell-bin)
# Maintainer: Jonghyo Lee <na1307@outlook.kr>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>
pkgname=powershell-fxdependent-bin
_pkgname=${pkgname%-fxdependent-bin}
pkgver=7.4.6
pkgrel=1
pkgdesc="A cross-platform automation and configuration tool/framework (binary package, framework dependent)"
arch=(x86_64)
url="https://github.com/Powershell/Powershell"
license=(MIT)
depends=(
  gcc-libs
  glibc
  zlib
  dotnet-runtime-8.0
)
provides=(powershell)
conflicts=(powershell powershell-bin)
install=powershell.install
_archive="$pkgname-$pkgver-$pkgrel"
_artifact="$_archive.tar.gz"
source_x86_64=("$_artifact::$url/releases/download/v$pkgver/powershell-$pkgver-linux-x64-fxdependent.tar.gz")
noextract=("$_artifact")
sha256sums_x86_64=('8040e3586205bbf64538f89300857e5a0aaced9a15a4d587e4bbdee213e2762d')

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

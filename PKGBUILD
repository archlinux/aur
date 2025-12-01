# Maintainer:

_pkgname="adbmanager"
pkgname="$_pkgname-qt6"
pkgver=4.0
pkgrel=1
pkgdesc="ADB manager for Android devices (Qt6)"
url="https://github.com/AKotov-dev/adbmanager"
license=('GPL-3.0-only')
arch=('x86_64')

depends=('qt6pas')
makedepends=('lazarus')

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('130e96cf84645b716bdb8544dfb54ed04591bd7f25d9af938dbac0038f203bac')

prepare() {
  cd "$_pkgsrc"

  # remove prebuilt binaries
  rm -rf "adbmanager/adbmanager"
  rm -rf "adbmanager/adbmanager-qt6"
}

build() {
  mkdir -p build

  local _laz_opts=(
    --build-all
    --build-mode=Qt6
    --cpu="$CARCH"
    --lazarusdir="/usr/lib/lazarus"
    --os=linux
    --primary-config-path=build
    --widgetset=qt6
    --opt="-O3 -Sa -CX -XX -k--sort-common -k--as-needed -k-z -krelro -k-z -know"
  )

  lazbuild "${_laz_opts[@]}" "$_pkgsrc/adbmanager/adbmanager.lpi"
}

package() {
  depends+=(
    '7zip'
    'android-tools'
    'graphicsmagick'
    'iproute2'
    'iputils'
    'nmap'
    'sakura'
  )

  install -Dm755 "$_pkgsrc/adbmanager/adbmanager-qt" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$_pkgsrc/adbmanager/ico/adbmanager.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=ADBManager
GenericName=Android Device Manager
Comment=$pkgdesc
Icon=$_pkgname
Exec=$_pkgname
StartupWMClass=$_pkgname
Categories=System;
Terminal=false
END
}

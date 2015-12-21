# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>

pkgname=qtox
_pkgname=qTox
pkgver=1.2.2
pkgrel=2
pkgdesc='Powerful Tox client written in C++/Qt that follows the Tox design guidelines'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/tux3/qTox'
license=('GPL3')
depends=('desktop-file-utils'
         'libfilteraudio-git'
         'libxkbcommon-x11'
         'libxss'
         'openal'
         'opencv'
         'qrencode'
         'qt5-svg'
         'sqlcipher'
         'toxcore')
makedepends=('qt5-tools')
install=$pkgname.install
source=("https://github.com/tux3/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('f667d8c998d1b908069782b2123a3922c8ae554ab58a686eced060a6692cb12fbb4348c91e826a3e651e86df744fb0195dbf0e9fe0979aa40b32e6d29439740b')

build() {
  cd $_pkgname-$pkgver
  install -d build
  cd build
  qmake-qt5 ENABLE_SYSTRAY_UNITY_BACKEND=NO ..
  make
}

package() {
  # executable
  cd $_pkgname-$pkgver
  install -Dm755 build/$pkgname "$pkgdir/usr/bin/$pkgname"

  # xdg desktop file
  install -Dm644 qTox.desktop "$pkgdir/usr/share/applications/qTox.desktop"

  # icons
  cd img/icons
  for _icon in *.png; do
    _size=$(sed 's|^[^-]*-||;s|\.png||' <<< "$_icon")
    install -Dm644 "$_icon" "$pkgdir/usr/share/icons/hicolor/$_size/apps/$pkgname.png"
  done
  install -Dm644 $pkgname.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}

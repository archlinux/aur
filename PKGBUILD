# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>

pkgname=qtox
_pkgname=qTox
pkgver=1.2.1
pkgrel=1
pkgdesc='Powerful Tox client written in C++/Qt that follows the Tox design guidelines'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/tux3/qTox'
license=('GPL3')
depends=('desktop-file-utils'
         'libfilteraudio-git'
         'libxkbcommon-x11'
         'libxss'
         'opencv'
         'openal'
         'qt5-svg'
         'qrencode'
         'toxcore')
makedepends=('qt5-tools')
install=$pkgname.install
source=("https://github.com/tux3/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('679bc14f6b48b81f3d9af40ac987789ec34a5892a4f5e44f84fe058e503569ddf1a113caa7e62bf5544982f404ea58963d607d872a9e71fc145c0c80fbb9815b')

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
    install -Dm644 "$_icon" "$pkgdir/usr/share/icons/hicolor/$_size/apps/$_pkgname.png"
  done
  install -Dm644 $pkgname.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
}

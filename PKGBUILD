# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com
# Contributor: Thermionix <thermionix at gmail dot com>

pkgname=navit
pkgver=0.5.5
pkgrel=2
pkgdesc="Modular turn-by-turn car navigation system"
arch=('x86_64')
url="https://www.navit-project.org/"
license=('GPL')
depends=('dbus-glib' 'gpsd' 'gtk2' 'imlib2' 'sdl_image')
makedepends=('cmake' 'libxslt')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/navit-gps/navit/archive/v$pkgver.tar.gz
        navit-gpsd-3.21.patch::"https://github.com/navit-gps/navit/commit/06c5969f.patch")
sha256sums=('e1630cd0bce875f34475f01d74be4638c26ee9023e80d79082fc2d1811f514b1'
            '697a269cbac7ca426bceb53f45885b5db7216fbfb20b20e72f350035fad0c27c')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/lib64/lib/' CMakeLists.txt 

  patch -p1 -i ../navit-gpsd-3.21.patch # Fix build with gpsd 3.21
}

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DSAMPLE_MAP=FALSE -DDISABLE_QT=TRUE
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

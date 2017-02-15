# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=sugar-toolkit-gtk2
_pkgname=sugar-toolkit
_base_pkgname=sugar-base
pkgver=0.110.0
_base_pkgver=0.98.0
pkgrel=1
pkgdesc="GTK2 based toolkit for Sugar (deprecated)"
arch=('i686' 'x86_64')
url="https://sugarlabs.org/"
license=('LGPL')
depends=('hippo-canvas' 'python2-gconf' 'sugar-toolkit-gtk3')
makedepends=('intltool')
conflicts=($_pkgname $_base_pkgname)
provides=($_pkgname $_base_pkgname)
source=(https://download.sugarlabs.org/sources/sucrose/glucose/$_pkgname/$_pkgname-$pkgver.tar.bz2
        https://download.sugarlabs.org/sources/sucrose/glucose/$_base_pkgname/$_base_pkgname-$_base_pkgver.tar.bz2
        0001-Use-profile.get_nickname-and-get_color-where-possibl.patch
        0001-Don-t-assume-all-connection-managers-support-Sugar.patch
        drop-rsvg-dependency.patch)
sha256sums=('14e76fac034f8801c2d63c9b562e6559817a31aac72b1853370bf0bc66779f25'
            'cab4489eaec13a17ca036082d49e933ecd6462954040b086597cf33772f9e1cc'
            '022d041c0491332c5fb65c9d46232d60bd360b545443bb52b52a66063e239628'
            'bb9405693fd3f6bb3303d97e839ae5ba466bbc0db93780949948dd4bb01568a6'
            '80f28c29f43c1cb2ccb7107e05d5ce60b5f2160298262afeba3f98172e2fdb1a')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../0001-Use-profile.get_nickname-and-get_color-where-possibl.patch
  patch -Np1 -i ../0001-Don-t-assume-all-connection-managers-support-Sugar.patch
  patch -Np1 -i ../drop-rsvg-dependency.patch
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make

  cd ../$_base_pkgname-$_base_pkgver
  ./configure --prefix=/usr
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  cd ../$_base_pkgname-$_base_pkgver
  make DESTDIR="$pkgdir" install
}

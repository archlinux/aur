# Maintainer: kikadf <kikadf.01@gmail.com>

pkgname=libinput-mir
pkgver=1.7.0
pkgrel=2
pkgdesc="Input device management and event handling library"
arch=('x86_64')
url="https://www.freedesktop.org/wiki/Software/libinput/"
license=(custom:X11)
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
makedepends=('doxygen' 'graphviz' 'gtk3')
conflicts=('libinput')
provides=("libinput=${pkgver}")
source=(https://freedesktop.org/software/libinput/libinput-$pkgver.tar.xz
        https://raw.githubusercontent.com/kikadf/patches/master/libinput-mir/0001-libinput-add-orientation-and-size-of-touch-point-and.patch
        https://raw.githubusercontent.com/kikadf/patches/master/libinput-mir/0002-extend-tools-to-print-and-display-touch-event-proper.patch
        https://raw.githubusercontent.com/kikadf/patches/master/libinput-mir/0003-Fix-premature-flushing-of-evdev-event-on-mx4-touchsc.patch)
sha512sums=('9058eab813ea3de230835155ca843f248127cbafaf1aecc9a2e209a0215b090beef0468cc863a24320f8d0db1f2863baba680e2416e9e409e958b2c1d18e43a1'
            'a8ed399f9cc7f07cec3c4c5068c29cb7eacbbb5a9c140ddf000d54ecd1246fd97576a077200612bee3425e5b5caf913eb89278fb4a9f4be26a55ca8437a9c08a'
            'b5241c022a62c380c3fe43d4e43165809d3958e3b089cb5109277b12e0e8c5b8d758b678769a99d9b400205a68c5f72dc989c7da97e4619dc30f5f7263dd8c5d'
            'debbde5a80e03e7bca46bfb6d01ef77526d73752d42c2572e997dd1db303a05bc49551324108e7d481600f51163a56519afaad783d952baeb4abbaadd46db838')


prepare() {
  cd libinput-$pkgver
  patch -p1 -i ../0001-libinput-add-orientation-and-size-of-touch-point-and.patch
  patch -p1 -i ../0002-extend-tools-to-print-and-display-touch-event-proper.patch
  patch -p1 -i ../0003-Fix-premature-flushing-of-evdev-event-on-mx4-touchsc.patch
}

build() {
  cd libinput-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd libinput-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
  # install doc - no Makefile target
  install -v -dm755 ${pkgdir}/usr/share/doc/$pkgname
  cp -rv doc/html/* ${pkgdir}/usr/share/doc/$pkgname
}

# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=lvtk
pkgver=1.2.0
pkgrel=3
pkgdesc="Libraries wrapping the LV2 C API and extensions into C++ classes"
arch=(x86_64)
url="https://github.com/lvtk/lvtk"
license=(GPL3)
depends=(gcc-libs glibc)
makedepends=(boost gtkmm lv2 waf)
optdepends=('atk: for example plugins'
            'atkmm: for example plugins'
            'cairo: for example plugins'
            'cairomm: for example plugins'
            'fontconfig: for example plugins'
            'gdk-pixbuf2: for example plugins'
            'glib2: for example plugins'
            'gtk2: for example plugins'
            'gtkmm: for example plugins'
            'harfbuzz: for example plugins'
            'libfreetype.so: for example plugins'
            'pango: for example plugins'
            'pangomm: for example plugins')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('f193ec28103cb2f6353ff0f96f8790041baf1ae99472c5d04017c23b42d0179b1f5e1de6722e17080410311d0e7e1de4ca0ae9ab76fb3bf8a02d9dc1451d8db7')
b2sums=('d6aa47f5d89e861393b95d60fe53a232f8047c77f8593dc7dcfc700c3933d2bc37e3e499d1d63a84854e0bcfc2232c170cc92b69fd8b01be30f0f581b216a4a9')

prepare() {
  cd "$pkgname-$pkgver"
  # remove (useless) python2 based print
  sed -e '/print/d' -i wscript
}

build() {
  export LINKFLAGS="$LDFLAGS"
  CXXFLAGS+=" -std=c++11 -ffat-lto-objects"

  cd "$pkgname-$pkgver"
  waf configure --prefix=/usr \
                --boost-includes=/usr/include/boost \
                --boost-libs=/usr/lib
  waf build
}

package() {
  cd "$pkgname-$pkgver"
  waf install --destdir="$pkgdir/"
  install -vDm 644 {AUTHORS,ChangeLog,README} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

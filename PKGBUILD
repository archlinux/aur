# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: aimileus, Sergej Pupykin, Tiago Pierezan Camargo, robb_force

pkgname=nestopia
pkgver=1.52.0
pkgrel=3
pkgdesc='An NES emulator featuring cycle exact emulation, a ridiculous number of mappers, and lots of custom sound chips.'
url='http://0ldsk00l.ca/nestopia/'
license=('GPL')
arch=('x86_64')
depends=('sdl2' 'fltk' 'zlib' 'libarchive')
makedepends=('mesa' 'autoconf-archive')
source=($pkgname-$pkgver.tar.gz::"https://github.com/0ldsk00l/nestopia/archive/$pkgver.tar.gz")
sha256sums=('eae1d2f536ae8585edb8d723caf905f4ae65349edee4ffbee45f9f52b5e3b06c')
install=$pkgname.install

prepare() {
  cd $pkgname-$pkgver

  autoreconf -fi

  # remove GLU dependency
  sed -i "s/fltk-config.*--ldflags/&|sed 's#-lGLU ##g'/g" configure
}

build() {
  cd $pkgname-$pkgver

  # build system normally disables this warning
  export CXXFLAGS="$CXXFLAGS -Wno-narrowing"

  ./configure --prefix=/usr
  make
}

package() {
  make -C $pkgname-$pkgver install DESTDIR="$pkgdir"
}

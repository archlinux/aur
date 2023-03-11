# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=hugin-hg
pkgver=r8480.907170838d2e
pkgrel=1
pkgdesc="A frontend to the panorama-tools"
arch=(x86_64)
url="http://hugin.sourceforge.net/"
license=(GPL)
depends=(wxwidgets-gtk3 boost-libs libtiff libpano13 libjpeg libpng openexr vigra
         exiv2 glew sqlite lcms2 lapack fftw glu libxi libxmu python
         lensfun enblend-enfuse)
makedepends=(mercurial cmake boost tclap mesa swig)
optdepends=('perl-image-exiftool: GPano tags support'
            'dcraw: RAW import using dcraw'
            'darktable: RAW import using darktable'
            'rawtherapee: RAW import using rawtherapee')
provides=(hugin)
conflicts=(hugin)
source=("hg+http://hg.code.sf.net/p/hugin/hugin")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/hugin"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "${srcdir}/hugin"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${srcdir}/hugin/build"
  cmake .. -Wno-dev \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_LAPACK=yes \
    -DBUILD_HSI=ON \
    -DUSE_GDKBACKEND_X11=ON \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config
  make
}

package() {
  cd "${srcdir}/hugin/build"
  make DESTDIR="$pkgdir" install
}

# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Maxim Vuets <maxim.vuets@gmail.com>

pkgname=cuneiform
pkgver=1.1.0
_dpkgver=1.1
pkgrel=15
pkgdesc="Linux port of an OCR system developed in Russia. Supports more than 20 languages."
arch=('i686' 'x86_64')
url="https://launchpad.net/cuneiform-linux"
license=('BSD')
depends=('imagemagick')
makedepends=('cmake' 'gcc5')
source=(https://launchpad.net/cuneiform-linux/${_dpkgver}/${_dpkgver}/+download/cuneiform-linux-${pkgver}.tar.bz2)
sha256sums=('577e0d054de72086c33b4e8ae15033657776509b9a7af6eb272888eefcbdbbad')

build() {
  cd "${srcdir}/${pkgname}-linux-${pkgver}"
  sed -i 's#lib64#lib#' install_files.cmake
  mkdir -p builddir
  cd builddir

  LMAGICK=`ls -1 /usr/lib/libMagick++*.so.?`

  cmake \
	-DCMAKE_BUILD_TYPE=release \
	-DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_COMPILER=g++-5 \
        -DCMAKE_C_COMPILER=gcc-5 \
	-DImageMagick_Magick++_LIBRARY=$LMAGICK \
	-DImageMagick_Magick++_INCLUDE_DIR=/usr/include/ImageMagick-6 \
	..
  make
}

check() {
  ldd "${srcdir}/${pkgname}-linux-${pkgver}/builddir/cuneiform" | grep Magick >/dev/null
}

package() {
  cd "${srcdir}/${pkgname}-linux-${pkgver}"/builddir
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/${pkgname}-linux-${pkgver}/cuneiform_src/Kern/license.txt" \
    "${pkgdir}/usr/share/licenses/cuneiform/license.txt"
}

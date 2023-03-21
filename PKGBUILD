# Maintainer: Butui Hu <hot123tea123@gmail.com>

_name=imagecodecs
pkgname=python-imagecodecs
pkgver=2023.3.16
pkgrel=3
pkgdesc='Image transformation, compression, and decompression codecs'
arch=('x86_64')
url='https://github.com/cgohlke/imagecodecs'
license=('BSD')
depends=(
  blosc
  brotli
  brunsli
  cfitsio
  charls
  jxrlib
  lcms2
  lerc
  libaec
  libavif
  libdeflate
  libheif
#  libjpeg
  libjxl
  libmng
  libpng
  libtiff
  libwebp
  lzfse
  openjpeg2
  python-imread
  python-numpy
  snappy
  zfp
  zopfli
)
makedepends=(
  cython
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("${_name}-${pkgver}.tar.gz::https://github.com/cgohlke/imagecodecs/archive/v${pkgver}.tar.gz"
        "0001.fix-deps.patch"
)
sha256sums=('314c51d574be27c3648b9ee05d035956469f6b98f61e55d07e0cfa9ac014e1d3'
            '4bc2af7f9d7894c71fdb9507af30a633db83901b85a24838c4d1a09c6bedb606')

prepare() {
  cd "${_name}-${pkgver}"
  patch -p1 -i "${srcdir}/0001.fix-deps.patch"
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  # python-imagecodecs >= 2023.3.16 depends on libjpeg-turbo >= 2.1.91
  # disable it until libjpeg-turbo 2.1.91 is in official repos
  sed -i '/jpeg8/d' setup.py
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:ts=2:sw=2:et:

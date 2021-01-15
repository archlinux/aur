# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=openimageio-git
pkgver=spi.Arn3.6.72.1.r1065.g6a368f469
pkgrel=1
pkgdesc="A library for reading and writing images, including classes, utilities, and applications"
arch=(x86_64)
url="http://www.openimageio.org/"
license=('custom')
depends=('boost-libs' 'fmt' 'intel-tbb' 'opencolorio-git' 'openjpeg2' 'libraw' 'libwebp' 'pugixml' 'pybind11')
# TODO: Consider adding these deps: 'openvdb' 'ffmpeg' 'ptex' 'libheif' 'hdf5' 'opencv'
makedepends=('cmake' 'qt5-base' 'python' 'boost' 'mesa' 'freetype2' 'fontconfig' 'libxrender' 'robin-map')
optdepends=('qt5-base: iv image viewer'
            'python: bindings support')
provides=('openimageio')
conflicts=('openimageio')
source=("git+https://github.com/OpenImageIO/oiio")
sha512sums=('SKIP')

pkgver() {
  cd oiio
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd oiio

  cmake \
      -Bbuild \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DUSE_PYTHON=ON \
      -DPYTHON_VERSION=3 \
      -DOIIO_BUILD_TOOLS=ON \
      -DBUILD_MISSING_FMT=OFF \
      -DUSE_EXTERNAL_PUGIXML=ON \
      -DSTOP_ON_WARNING=OFF
  cmake --build build/
}

package() {
  cd oiio/build

  make DESTDIR="$pkgdir" install

  # Remove vendored fonts
  rm -r "$pkgdir"/usr/share/fonts

  install -Dm644 ../LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE".md
}

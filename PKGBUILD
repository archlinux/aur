# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=openimageio-git
pkgver=spi.Arn3.6.72.1.r1086.g3e74eae53
pkgrel=1
pkgdesc="A library for reading and writing images, including classes, utilities, and applications"
arch=(x86_64)
url="http://www.openimageio.org/"
depends=('boost-libs' 'fmt' 'intel-tbb' 'libraw' 'libwebp' 'opencolorio-git' 'openjpeg2' 'pugixml' 'pybind11')
# TODO: Consider adding these deps: 'openvdb' 'ffmpeg' 'ptex' 'libheif' 'hdf5' 'opencv'
makedepends=('boost' 'cmake' 'fontconfig' 'freetype2' 'git' 'libxrender' 'mesa' 'ninja' 'python' 'qt5-base' 'robin-map')
optdepends=('qt5-base: iv image viewer'
            'python: bindings support')
license=('custom')
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
      -GNinja \
      -DUSE_PYTHON=ON \
      -DPYTHON_VERSION=3 \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DOIIO_BUILD_TESTS=ON \
      -DOIIO_BUILD_TOOLS=ON \
      -DBUILD_MISSING_FMT=OFF \
      -DUSE_EXTERNAL_PUGIXML=ON \
      -DSTOP_ON_WARNING=OFF
  ninja -C build
}

package() {
  cd oiio

  DESTDIR="$pkgdir" ninja -C build install

  # Remove vendored fonts
  rm -r "$pkgdir"/usr/share/fonts

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE".md
}

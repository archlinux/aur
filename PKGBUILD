# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=openimageio-qfix
pkgver=2.2.11.1
pkgrel=1
pkgdesc="A library for reading and writing images, including classes, utilities, and applications (build agaist opencolorio=2"
arch=(x86_64)
url="http://www.openimageio.org/"
license=('custom')
depends=('openexr' 'boost-libs' 'openjpeg2' 'glew' 'libtiff' 'opencolorio-qfix' 'intel-tbb' 'libpng' 'libraw' 'libwebp'
         'fmt' 'pugixml' 'pybind11')
# TODO: Consider adding these deps: 'openvdb' 'ffmpeg' 'ptex' 'libheif' 'hdf5' 'opencv'
makedepends=('cmake' 'qt5-base' 'python' 'boost' 'mesa' 'freetype2' 'fontconfig' 'libxrender' 'ninja' 'robin-map')
optdepends=('qt5-base: iv image viewer'
            'python: bindings support')
provides=(openimageio)
conflicts=(openimageio)
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenImageIO/oiio/archive/Release-$pkgver.tar.gz")
sha512sums=('73809587dd405e64e593d6223ef37d4b94c4f1e1d9682fd1bf09e8e4ee8bc9928ed500b7dcc03036e138e45e65ea1f43c11c53d1cb6436a34eb8d15b2415ada5')

build() {
  cd oiio-Release-$pkgver

  cmake \
      -Bbuild \
      -GNinja \
      -DUSE_PYTHON=ON \
      -DPYTHON_VERSION=3.9 \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DOIIO_BUILD_TESTS=ON \
      -DOIIO_BUILD_TOOLS=ON \
      -DBUILD_MISSING_FMT=OFF \
      -DUSE_EXTERNAL_PUGIXML=ON \
      -DSTOP_ON_WARNING=OFF \
      -DOpenColorIO_ROOT=/opt/ocio
  ninja -C build
}

package() {
  cd oiio-Release-$pkgver

  DESTDIR="$pkgdir" ninja -C build install

  # Remove vendored fonts
  rm -r "$pkgdir"/usr/share/fonts

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE".md
}

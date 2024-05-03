# Maintainer: Benoit Brummer <trougnouf@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: SpepS <dreamspepser at yahoo dot it>

_name=openimageio
pkgname="python311-${_name}"
pkgver=2.5.10.1
pkgrel=1
pkgdesc="A library for reading and writing images, including classes, utilities, and applications"
arch=('x86_64')
url="http://www.openimageio.org/"
license=('custom')
depends=("${_name}" "python311")
# TODO: Consider adding these deps: 'openvdb' 'ffmpeg' 'ptex' 'opencv'
makedepends=('cmake' 'qt5-base' 'python' 'boost' 'mesa' 'fontconfig' 'libxrender' 'ninja' 'robin-map' 'fmt')
optdepends=('qt5-base: iv image viewer'
            'python: bindings support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenImageIO/oiio/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('82b05040dada8c83d4c1c1d95b01decbbe1f33e006f7b356da1a1c1c4a99b81ba8fdc506ca2a5052d9f06f92dafca24242c49588e59b23b980fa525b53e380a3')

build() {
  cd OpenImageIO-$pkgver

  local python_version=3.11
  cmake \
    -Bbuild \
    -GNinja \
    -DUSE_PYTHON=ON \
    -DPYTHON_VERSION=$python_version \
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
  cd OpenImageIO-$pkgver

  DESTDIR="$pkgdir" ninja -C build install

  cd "$pkgdir/usr/"
  find . -mindepth 1 ! -path './lib' ! -path './lib/python3.11' ! -path './lib/python3.11/*' -delete

}


# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-freeglut
pkgver=3.2.0
pkgrel=1
pkgdesc="Provides functionality for small OpenGL programs (mingw-w64)"
arch=(any)
url="https://freeglut.sourceforge.net/"
license=("MIT")
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=(!strip !buildflags staticlibs)
source=("https://downloads.sourceforge.net/freeglut/freeglut-${pkgver}.tar.gz")
md5sums=('2abbb255b10ee669faf6b26ba27c050b')
sha1sums=('cc88845a3bfce41bbaa345d10038a1bcc6782af2')
noextract=("freeglut-${pkgver}.tar.gz")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  # Clean up old sources so re-patching doesn't fail.
  [[ -d ${srcdir}/freeglut-${pkgver} ]] && rm -rf ${srcdir}/freeglut-${pkgver}
  tar -xzvf ${srcdir}/freeglut-${pkgver}.tar.gz -C ${srcdir}
}

build() {
  cd "${srcdir}/freeglut-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DFREEGLUT_BUILD_DEMOS=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in $_architectures; do
    cd "${srcdir}/freeglut-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}


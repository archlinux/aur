_pkgname=glslang
pkgname="mingw-w64-${_pkgname}"
pkgver=7.11.3214
pkgrel=1
pkgdesc='OpenGL and OpenGL ES shader front end and validator (mingw-w64)'
arch=('any')
url='https://github.com/KhronosGroup/glslang'
license=('BSD')
depends=('mingw-w64-spirv-tools')
makedepends=('mingw-w64-cmake')
options=('staticlibs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/glslang/archive/${pkgver}.tar.gz
        001-install-missing-dll.patch)
sha256sums=('b30b4668734328d256e30c94037e60d3775b1055743c04d8fd709f2960f302a9'
            'f4b129e6c79ca25729d32b2d3098536dcd326dc3c75be4e0db615d8fc80a9f1e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ${srcdir}/001-install-missing-dll.patch
}

build() {
  cd $_pkgname-$pkgver
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "build-${_arch}"-{shared,static}
#    (cd "build-${_arch}-shared"
#      ${_arch}-cmake .. \
#        -DCMAKE_BUILD_TYPE=Release \
#        -DBUILD_SHARED_LIBS=ON
#      make
#    )
    (cd build-${_arch}-static
      ${_arch}-cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=OFF
      make
    )
  done
}

package() {
  cd $_pkgname-$pkgver
  for _arch in ${_architectures}; do
#    make -C "build-${_arch}-shared" DESTDIR="${pkgdir}" install
    make -C "build-${_arch}-static" DESTDIR="${pkgdir}" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim: ts=2 sw=2 et:

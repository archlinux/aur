pkgname=mingw-w64-mesa
pkgver=19.0.2
pkgrel=1
pkgdesc="An open-source implementation of the OpenGL specification (mingw-w64)"
arch=('any')
url="https://www.mesa3d.org/"
license=("custom")
makedepends=('mingw-w64-gcc' 'scons' 'python2-mako' 'mingw-w64-meson')
depends=('mingw-w64-crt')
options=('staticlibs' '!strip' '!buildflags')
validpgpkeys=('71C4B75620BC75708B4BDB254C95FAAB3EB073EC') # Dylan Baker <dylan@pnwbakers.com>
source=(https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz{,.sig})
sha256sums=('1a2edc3ce56906a676c91e6851298db45903df1f5cb9827395a922c1452db802' SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}"/mesa-${pkgver}
  # os_memory_stdc.h:58:7: error: implicit declaration of function ‘posix_memalign’
  sed -i "s|'mkostemp', 'posix_memalign'|'mkostemp'|g" meson.build
}


build() {
  cd "${srcdir}"/mesa-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-meson -Dplatforms=surfaceless -Dglx=disabled -Dllvm=false ..
    ninja
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/mesa-${pkgver}/build-${_arch}"
    DESTDIR="${pkgdir}" ninja install
    rm -r "$pkgdir/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

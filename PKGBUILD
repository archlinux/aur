pkgname=mingw-w64-mesa
pkgver=17.3.5
pkgrel=1
pkgdesc="an open-source implementation of the OpenGL specification (mingw-w64) (WIP) "
arch=('any')
url="https://www.mesa3d.org/"
license=("custom")
makedepends=('mingw-w64-configure' 'mingw-w64-llvm')
depends=('mingw-w64-crt')
options=('staticlibs' '!strip' '!buildflags')
source=("https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz")
sha256sums=('eb9228fc8aaa71e0205c1481c5b157752ebaec9b646b030d27478e25a6d7936a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

# https://wiki.qt.io/Cross_compiling_Mesa_for_Windows
# https://www.mesa3d.org/install.html

build() {
  cd "${srcdir}"/mesa-${pkgver}
  for _arch in ${_architectures}; do
    export LLVM=/usr
    cp -r "${srcdir}"/mesa-${pkgver} "${srcdir}"/build-${_arch} && pushd "${srcdir}"/build-${_arch}
#     mkdir -p build-${_arch} && pushd build-${_arch}
    LDFLAGS="-static -s" CC=/usr/bin/${_arch}-clang scons build=release platform=windows toolchain=crossmingw llvm=yes machine=x86 libgl-gdi 
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

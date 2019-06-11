pkgname=mingw-w64-mesa
pkgver=19.1.0
pkgrel=1
pkgdesc="An open-source implementation of the OpenGL specification (mingw-w64)"
arch=('any')
url="https://www.mesa3d.org/"
license=("custom")
makedepends=('mingw-w64-gcc' 'scons' 'python2-mako')
depends=('mingw-w64-dlfcn' 'mingw-w64-llvm')
options=('staticlibs' '!strip' '!buildflags')
validpgpkeys=(71C4B75620BC75708B4BDB254C95FAAB3EB073EC  # Dylan Baker <dylan@pnwbakers.com>
              A5CC9FEC93F2F837CB044912336909B6B25FADFA) # Juan A. Suarez Romero <jasuarez@igalia.com>
source=(https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz{,.sig} mingw-posix.patch)
sha256sums=('2a6c3af3a803389183168e449c536304cf03e0f82c4c9333077933543b9d02f3' SKIP SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}"/mesa-${pkgver}
  # https://gitlab.freedesktop.org/mesa/mesa/merge_requests/784
  patch -p1 -i "${srcdir}"/mingw-posix.patch

  # libLLVMSupport.a: undefined reference to `compressBound' (only with static llvm)
  sed -i "s|'LLVMSupport',|'LLVMSupport', 'z',|g" scons/llvm.py
}

build() {
  cd "${srcdir}"/mesa-${pkgver}
  for _arch in ${_architectures}; do
    if test "${_arch}" = x86_64-w64-mingw32
    then
      machine="x86_64"
    else
      machine="x86"
    fi
    LLVM=/usr/${_arch} scons platform=windows toolchain=crossmingw machine=${machine} build=release libgl-gdi
  done
}

package() {
  cd "${srcdir}"/mesa-${pkgver}
  for _arch in ${_architectures}; do
    if test "${_arch}" = x86_64-w64-mingw32
    then
      machine="x86_64"
    else
      machine="x86"
    fi
    install -d "$pkgdir"/usr/${_arch}/bin
    install -m755 build/windows-${machine}/gallium/targets/libgl-gdi/opengl32.dll "$pkgdir"/usr/${_arch}/bin
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}

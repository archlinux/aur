pkgname=mingw-w64-mesa
pkgver=19.2.0
pkgrel=2
pkgdesc="An open-source implementation of the OpenGL specification (mingw-w64)"
arch=('any')
url="https://www.mesa3d.org/"
license=("custom")
makedepends=('mingw-w64-gcc' 'scons' 'python-mako')
depends=('mingw-w64-dlfcn' 'mingw-w64-llvm')
options=('staticlibs' '!strip' '!buildflags')
validpgpkeys=(71C4B75620BC75708B4BDB254C95FAAB3EB073EC  # Dylan Baker <dylan@pnwbakers.com>
              A5CC9FEC93F2F837CB044912336909B6B25FADFA) # Juan A. Suarez Romero <jasuarez@igalia.com>
source=(https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz{,.sig})
sha256sums=('b060caa2a00f856431160ff7377d0e8f58f2aa48c16ee5a9e265ebdccb10852a' SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}"/mesa-${pkgver}

  # https://gitlab.freedesktop.org/mesa/mesa/merge_requests/2127
  curl -L https://gitlab.freedesktop.org/mesa/mesa/merge_requests/2127.patch | patch -p1

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

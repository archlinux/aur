pkgname=mingw-w64-cmake-static
pkgver=1
pkgrel=2
arch=('any')
pkgdesc='CMake wrapper for MinGW (mingw-w64, static)'
depends=('mingw-w64-cmake')
license=("GPL")
url='https://github.com/martchus/pkgbuilds'
source=(mingw-cmake-static.sh
        toolchain-mingw-static.cmake)
sha256sums=('SKIP' 'SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    for _variant in '' '-static'; do
      sed "s|@TRIPLE@|${_arch}|g;s|@PROCESSOR@|${_arch::-12}|g" toolchain-mingw-static.cmake > toolchain-${_arch}-static.cmake
      sed "s|@TRIPLE@|${_arch}|g" mingw-cmake-static.sh > ${_arch}-cmake-static
    done
  done
}

package() {
  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/usr/share/mingw
  for _arch in ${_architectures}; do
    install -m 644 toolchain-${_arch}-static.cmake "${pkgdir}"/usr/share/mingw/
    install -m 755 ${_arch}-cmake-static "${pkgdir}"/usr/bin/
  done
}


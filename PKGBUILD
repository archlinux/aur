
pkgname=mingw-w64-cmake
pkgver=1
pkgrel=23
arch=('any')
pkgdesc="CMake wrapper for MinGW (mingw-w64)"
depends=('cmake' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
optdepends=('mingw-w64-wine: runtime support')
license=("GPL")
url="http://fedoraproject.org/wiki/MinGW"
source=("mingw-cmake.sh"
        "mingw-cmake-py.sh"
        "toolchain-mingw.cmake")
sha256sums=('SKIP' 'SKIP' "SKIP")
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_python_versions="27 35 36 37"

build() {
  for _arch in ${_architectures}; do
    sed "s|@TRIPLE@|${_arch}|g;s|@PROCESSOR@|${_arch::-12}|g" toolchain-mingw.cmake > toolchain-${_arch}.cmake
    sed "s|@TRIPLE@|${_arch}|g" mingw-cmake.sh > ${_arch}-cmake
    for _pyver in ${_python_versions}; do
      sed "s|@TRIPLE@|${_arch}|g;s|@PYMAJMIN@|${_pyver}|g" mingw-cmake-py.sh > ${_arch}-cmake-py${_pyver}
    done
  done
}

package() {
  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/usr/share/mingw
  for _arch in ${_architectures}; do
    install -m 644 toolchain-${_arch}.cmake "${pkgdir}"/usr/share/mingw/
    install -m 755 ${_arch}-cmake "${pkgdir}"/usr/bin/
    for _pyver in ${_python_versions}; do
      install -m 755 ${_arch}-cmake-py${_pyver} "${pkgdir}"/usr/bin/
    done
  done
}


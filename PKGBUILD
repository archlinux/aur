pkgname=mingw-w64-cmake-static
pkgver=1
pkgrel=9
arch=('any')
pkgdesc='CMake wrapper for MinGW (mingw-w64, static)'
depends=('mingw-w64-cmake')
license=(GPL-2.0-or-later)
url='https://github.com/martchus/pkgbuilds'
source=(mingw-cmake-static.sh
        toolchain-mingw-static.cmake)
sha256sums=('SKIP' 'SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  local mingw_env='mingw-env'
  local exe_linker_flags='-static -static-libgcc -static-libstdc++'
  if [[ $pkgname =~ .*-clang-.* ]]; then
    mingw_env='mingw-clang-env'
    exe_linker_flags='-static'
  fi
  for _arch in ${_architectures}; do
    sed -e "s|@TRIPLE@|${_arch}|g;s|@PROCESSOR@|${_arch::-12}|g" \
        -e "s|@EXE_LINKER_FLAGS@|${exe_linker_flags}|g" \
      toolchain-mingw-static.cmake > toolchain-${_arch}-static.cmake
    sed -e "s|@TRIPLE@|${_arch}|g" \
        -e "s|@MINGW_ENV@|${mingw_env}|g" \
      mingw-cmake-static.sh > ${_arch}-cmake-static
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


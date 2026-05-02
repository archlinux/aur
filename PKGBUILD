# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="libkovanserial"
_commit="d84ef9b5bc3c50e4baec4aaf79f20f79f0e10861" # r97
pkgver="r97+g${_commit::7}"
pkgrel=2
pkgdesc="The library behind kovan and computer interaction over serial"
arch=(
  'x86_64'
)
url="https://github.com/kipr/${pkgname}"
license=(
  'GPL-3.0-only'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'  
)
makedepends=(
  'cmake>=2.8'
)
_pkgsrc="${url##*/}-${_commit}"
source=(
  "${url}/archive/${_commit}/${_pkgsrc}.tar.gz"
)
b2sums=('e0392e3c8607b85dfbc8a68d0ca1b41bc0441fd228c313e7b6c1126de91bb43ef3054895417b047bc989d4435d98042e6b4c1e97eb27da75f45303b930e00e60')

build() {
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "Readme.markdown" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

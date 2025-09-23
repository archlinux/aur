# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="pcompiler"
pkgname="${_basename}-qt5"
pkgver=1.0.0
pkgrel=1
pkgdesc="Precedence compiler will attempt to automatically compile source code"
arch=('x86_64')
url="https://github.com/kipr/${_basename}"
license=('GPL-3.0-only')
depends=(
  'gcc-libs'
  'glibc'
  'libkar-qt5'
  'qt5-base'
)
makedepends=(
  'cmake>=2.8.12'
)
provides=(
  "lib${pkgname//-/_}.so"
)
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_basename}_qt5.patch")
b2sums=('0c1a00b1e1ae31eb00a4070ed49e5a371af4b8645902e74cc1ec8a019b004b6abb109f46528f64ac9428a9f4bc582b1901c72de92dc6fdb7df67f290ed55bd82'
        '6a4b12be396f5c42619dcec2b40c24942cbe991227c9fc5f811e33a392cfec765ac3def9856cdd31b461ad80237fc1f1e9dfa78269814c53b84a10aa837ae299')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname//-/_}.patch"
}

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "Readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="libkar"
pkgname="${_basename}-qt5"
pkgver=1.0.0
pkgrel=1
pkgdesc="An extremely simple Qt based archiver"
arch=('x86_64')
url="https://github.com/kipr/${_basename}"
license=('GPL-2.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'qt5-base'
)
makedepends=(
  'cmake>=2.8.12'
)
provides=(
  "${pkgname//-/_}.so"
)
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('4318d76885b440625d978c5bd9c195c12febc1ee56c094a50605a20a54bf0356c625dd7cb2f20c4798afde364e7c0ab80bfbe1b64938a879a21ab6a31b170998')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  find . -type f -name 'CMakeLists.txt' -exec \
    sed -e 's/Qt6/Qt5/g' \
        -e 's/qt6/qt5/g' \
        -e 's/kar/kar_qt5/g' \
        -e 's/kissarchive /kissarchive-qt5 /g' \
        -i "{}" + 
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

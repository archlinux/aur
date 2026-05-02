# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="libkar"
pkgver=1.0.0
pkgrel=1
pkgdesc="An extremely simple Qt based archiver"
arch=(
  'x86_64'
)
url="https://github.com/kipr/${pkgname}"
license=(
  'GPL-2.0-or-later'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
  'qt6-base'
)
makedepends=(
  'cmake>=2.8.12'
)
provides=(
  "${pkgname}.so"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('4318d76885b440625d978c5bd9c195c12febc1ee56c094a50605a20a54bf0356c625dd7cb2f20c4798afde364e7c0ab80bfbe1b64938a879a21ab6a31b170998')

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
  install -vDm644 "Readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

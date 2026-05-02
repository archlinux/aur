# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="pcompiler"
pkgver=1.0.0
pkgrel=2
pkgdesc="Precedence compiler will attempt to automatically compile source code"
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
  'libkar'
  'qt6-base'
)
makedepends=(
  'cmake>=2.8.12'
)
provides=(
  "lib${pkgname}.so"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('0c1a00b1e1ae31eb00a4070ed49e5a371af4b8645902e74cc1ec8a019b004b6abb109f46528f64ac9428a9f4bc582b1901c72de92dc6fdb7df67f290ed55bd82')

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

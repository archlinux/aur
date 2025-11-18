# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="librepods"
pkgver=0.2.0alpha
_pkgver="${pkgver//alpha/-alpha}"
pkgrel=1
pkgdesc="AirPods liberated from Apple's ecosystem"
arch=(
  'x86_64'
)
url="https://github.com/kavishdevar/${pkgname}"
license=(
  'GPL-3.0-only'
)
depends=(
  'gcc-libs'
  'glibc'
  'openssl'
  'qt6-base'
  'qt6-connectivity'
  'qt6-declarative'
)
makedepends=(
  'cmake>=2.8.12'
)
_pkgsrc="${url##*/}-${_pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz"
)
b2sums=('5276e060b0e72ad5fb7a10a746d4e219cc7be36c10318692d6b08dae25faa6074defed31275ddbf8f7d2d8b7b89bcd46040a2f85ff440d646771607e874a779a')

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}/linux"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_SKIP_RPATH:BOOL=TRUE
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

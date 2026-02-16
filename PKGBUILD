# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="vtm"
pkgver=2026.02.15
pkgrel=1
pkgdesc="Terminal multiplexer with window manager and session sharing"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/directvt/${pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc' 'lua')
makedepends=('cmake>=3.24' 'freetype2' 'harfbuzz')
# backup=("etc/${pkgname}/settings.xml")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('8ca51caa7323d713ff7a269b31bb9c0e9fe815d1281684c01683724a5ab96e651c8f957b7d36147ec58d7232bdb1a73afc7ae6c9151fc319e04239c323b22d92')

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # cd "src"
  # install -vDm644 "${pkgname}.xml" "${pkgdir}/etc/${pkgname}/settings.xml"
}

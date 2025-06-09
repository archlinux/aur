# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="vtm"
pkgver=2025.06.09
pkgrel=1
pkgdesc="Terminal multiplexer with window manager and session sharing"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/directvt/${pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc' 'lua')
makedepends=('cmake>=3.24')
# backup=("etc/${pkgname}/settings.xml")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}_system_deps.patch")
b2sums=('2897e47f54105dfbbe1eb5c9ee504ebac09883c7a545a7b8b2e4f78873822fdadacaebe7e51246f25e040cc2412b754f78d31847be019056b04228de74a58405'
        '54b668965735b1bf36a3254e1557d7fe265dbd235dc16d921d23a341c9371806e2df00655be754f9b3edec06bb9843cc07b9cfecebf27b8063850d53a33bc6b9')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_system_deps.patch"
}

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

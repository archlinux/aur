# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="vtm"
pkgver=2026.05.30
pkgrel=1
pkgdesc="Terminal multiplexer with window manager and session sharing"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/directvt/${pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc' 'lua' 'freetype2' 'harfbuzz' 'plutovg')
makedepends=('cmake>=3.24' 'lunasvg' 'stb')
# backup=("etc/${pkgname}/settings.xml")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('931995b142f6de8c33b8f2a58f13efccdab7141cb6025369031f1a8609b1dcc8aa9820e49b5b29a6d47da717b0bf28cf47c30995414e80f944959f92ac558ac3')

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D STB_INCLUDE_DIR:PATH=/usr/include/stb
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

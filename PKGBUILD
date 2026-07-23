# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="vtm"
pkgver=2026.07.22
pkgrel=1
pkgdesc="Terminal multiplexer with window manager and session sharing"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/directvt/${pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc' 'lua' 'freetype2' 'harfbuzz' 'plutovg')
makedepends=('cmake>=3.24' 'lunasvg' 'stb')
# backup=("etc/${pkgname}/settings.xml")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "fix-cmake-detection.patch")
b2sums=('5f5afbda96a5246c405fa3562d5b545cdbb8049da12e9c6750f06ec569c301c4cf7b43e91a26cc9683bf40b5227af5cbd3ffbc90a5ae25dee7eec9da6bb36383'
        'c53a7cdc29d27982c7e1f7ff25e49e46f8786defc16336bc17a4cacb7686c59315c924d0178269d86c234c65cad7e523e9c544806febca17f258beb59688b634')

prepare() {
  cd "${_pkgsrc}"
  patch -Np1 -i "${srcdir}/fix-cmake-detection.patch"
}

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

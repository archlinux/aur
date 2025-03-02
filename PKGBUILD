# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="vtm"
pkgver=0.9.99.66
pkgrel=2
pkgdesc="Terminal multiplexer with window manager and session sharing"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/directvt/${pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc' 'lua')
makedepends=('cmake>=3.24')
backup=("etc/${pkgname}/settings.xml")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}_system_deps.patch")
b2sums=('ab92510cb81a6df87e5bd2ff5f2c8fbf42d524a197e01859221c2b226e41541785c575635ef071e1623cd7e840945579a04e30915effa545e912002c0e552d05'
        '54b668965735b1bf36a3254e1557d7fe265dbd235dc16d921d23a341c9371806e2df00655be754f9b3edec06bb9843cc07b9cfecebf27b8063850d53a33bc6b9')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_system_deps.patch"
}

build() {
  local cmake_options=(
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
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

  cd "src"
  install -vDm644 "${pkgname}.xml" "${pkgdir}/etc/${pkgname}/settings.xml"
}

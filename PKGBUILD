# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="plwm"
pkgver=0.5
pkgrel=1
pkgdesc="An X11 window manager written in Prolog"
arch=('x86_64')
url="https://github.com/Seeker04/${pkgname}"
license=('MIT')
depends=('glibc' 'libx11' 'libxft' 'libxrandr' 'swi-prolog')
makedepends=('gendesk')
backup=("etc/${pkgname}/config.pl")
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fee10bb368bdde77d19306788859f6cf8c4d35aa605e96123d4a3a87225f3f0d')

prepare() {
  cd "${srcdir}"
  gendesk -f -n \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    "${_pkgname}"

  cd "${_pkgsrc}"
  sed -i "s|LDFLAGS =|LDFLAGS = ${LDFLAGS}|g" Makefile
  sed -e "s|=\"/|=\"${pkgdir}/|g" \
      -e 's|/usr/local|/usr|g' \
      -i 'tools/install.sh'
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make OFLAGS="${CFLAGS}" LIB_PATH="/usr/lib"
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  make test
}

package() {
  cd "${srcdir}"
  install -vDm644 "${pkgname}.desktop" "${pkgdir}/usr/share/xsessions/${pkgname}.desktop"

  cd "${_pkgsrc}"
  make install

  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -vDm644 "img/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  cd "docs"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

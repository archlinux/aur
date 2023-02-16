# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname='tint'
pkgname="${_pkgname}-git"
pkgver=r10.f3f757f
pkgrel=1
epoch=1
pkgdesc='Tetris clone for the terminal'
arch=('x86_64')
url='https://github.com/DavidGriffith/tint'
license=('BSD')
depends=('hicolor-icon-theme' 'ncurses')
makedepends=('gendesk' 'git' 'imagemagick')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install='scorefile.install'
source=("git+${url}.git"
        "${_pkgname}.png")
sha256sums=('SKIP'
            '86bf162483cf1a18248e07ae979a3fefc9dcfcdc1ba63e5a1335a38210064c34')

prepare() {
  gendesk -f -n \
    --pkgname="${_pkgname}" \
    --pkgdesc="${pkgdesc}" \
    --name="${_pkgname^^}" \
    --comment="${pkgdesc}" \
    --exec="sh -c '/usr/bin/tint -l 1;echo;echo PRESS ENTER;read line'" \
    --icon="${_pkgname}" \
    --terminal='true' \
    --categories='Game'
}

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "${_pkgname}"
}

package() {
  install -Dvm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

  for i in 16 22 24 32 48 64 96 128; do
    convert "${_pkgname}.png" -resize "${i}x${i}" "icon${i}.png"
    install -Dvm644 "icon${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
  done

  cd "${_pkgname}"
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${_pkgname}.6" -t "${pkgdir}/usr/share/man/man6"
  install -Dvm644 {'NOTES','README.md'} -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'debian/copyright' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

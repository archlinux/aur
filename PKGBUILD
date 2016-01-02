# Maintainer: Beini <bane at iki dot fi>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=popcorn-time-ce-git
_pkgname=popcorn-time-ce
pkgver=r47.791d12b
pkgrel=1
pkgdesc="Allow anyone to easily watch their favorite movies, shows, and anime"
arch=('i686' 'x86_64')
url="https://popcorntimece.tk/"
license=('GPL3')
depends=('alsa-lib' 'gconf' 'gtk2' 'nss' 'ttf-font' 'libnotify' 'libxtst'
        'desktop-file-utils')
makedepends=('git' 'gulp' 'npm')
optdepends=('net-tools: vpn.ht client')
provides=('popcorn-time-ce')
conflicts=('popcorn-time-ce')
options=('!strip')
install=popcorn-time-ce.install
source=("git+https://github.com/PTCE-Public/popcorn-desktop.git"
        "popcorn-time-ce.desktop"
        "popcorn-time-ce.install")
md5sums=('SKIP'
         'ddcf8ef6afbf6a72892c3762d1ef071b'
         'e4b5094cc87634778b5017ba9258f3fd')

[ "$CARCH" = "i686" ]   && _platform=linux32
[ "$CARCH" = "x86_64" ] && _platform=linux64
_gitname=popcorn-desktop

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"

  export PYTHON=/usr/bin/python2

  # Get dependencies
  npm install
}

build() {
  cd "${srcdir}/${_gitname}"

  gulp build
}

package() {
  cd "${srcdir}"

  _bpath="${srcdir}/${_gitname}/build/${_pkgname}/${_platform}"

  install -d "${pkgdir}/usr/lib/${_pkgname}"
  install -d "${pkgdir}/usr/lib/${_pkgname}/locales"
  install -d "${pkgdir}/usr/bin"

  # Program
  install -Dm755 "${_bpath}/popcorn-time-ce" "${pkgdir}/usr/lib/${_pkgname}/"
  install -Dm644 "${_bpath}/nw.pak" "${pkgdir}/usr/lib/${_pkgname}/"
  install -Dm644 "${_bpath}/libffmpegsumo.so" "${pkgdir}/usr/lib/${_pkgname}/"
  install -Dm644 "${_bpath}/icudtl.dat" "${pkgdir}/usr/lib/${_pkgname}/"
  install -Dm644 "${_bpath}/locales/"*.pak "${pkgdir}/usr/lib/${_pkgname}/locales/"

  # Link to program
  ln -s "/usr/lib/${_pkgname}/popcorn-time-ce" "${pkgdir}/usr/bin/popcorn-time-ce"

  # Desktop file
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon
  install -Dm644 "${srcdir}/${_gitname}/src/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}

# vim:set ts=2 sw=2 et:

# Contributor: mar77i <mar77i at mar77i dot ch>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Arnold Sommerfeld <aur@mrsommerfeld.xyz>

pkgname=st-ruifm-git
_pkgname=st-ruifm
pkgver=0.8.4.r1152.8decb59
pkgrel=3
pkgdesc='Simple virtual terminal emulator for X'
url='https://github.com/ruifm/st.git'
arch=('any')
license=('MIT')
options=('zipman')
depends=('libxft-bgra-git' 'harfbuzz')
makedepends=('ncurses' 'libxext' 'git')

source=("${_pkgname}::git+$url")
sha256sums=('SKIP')
provides=('st')
conflicts=('st')

pkgver() {
  cd "${_pkgname}"
  _pkgver=$(awk '/VERSION/ {print $3}' config.mk|head -1)
  echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  # skip terminfo which conflicts with nsurses
  sed -i '/tic /d' Makefile
}

build() {
  cd "${_pkgname}"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "${_pkgname}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# Contributor: mar77i <mar77i at mar77i dot ch>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=st-luke-git
_pkgname=st-luke
_pkgver=0.8.1
pkgver=0.8.1.r1053
pkgrel=1
pkgdesc='Simple virtual terminal emulator for X'
url='https://github.com/LukeSmithxyz/st.git'
arch=('i686' 'x86_64')
license=('MIT')
options=('zipman')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')

# include config.h and any patches you want to have applied here
source=("${_pkgname}::git+$url")
sha256sums=('SKIP')
provides=("${_pkgname}" 'st')
conflicts=("${_pkgname}" 'st')

pkgver() {
  cd "${_pkgname}"
  echo "$_pkgver.r$(git rev-list --count HEAD)"
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

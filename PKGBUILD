# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>

pkgname=notepadqq-git
_pkgname=notepadqq
pkgver=1.4.8.r191.g45f90b67
pkgrel=1
pkgdesc="A Linux clone of Notepad++"
arch=('i686' 'x86_64')
url="http://notepadqq.altervista.org/wp/"
license=('GPL3')
depends=('qt5-webkit>5.2' 'qt5-svg>5.2' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('git' 'qt5-tools>5.2')
provides=('notepadqq')
conflicts=('notepadqq-bin' 'notepadqq' 'notepadqq-common' 'notepadqq-src')
install=${_pkgname}.install
sha1sums=('SKIP'
          'SKIP')
options=('!emptydirs')

source=("git://github.com/notepadqq/notepadqq.git"
        "git://github.com/notepadqq/CodeMirror.git")

pkgver() {
	cd "${_pkgname}"
	set -o pipefail
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  git config submodule.src/editor/libs/codemirror.url "${srcdir}/CodeMirror"
  git submodule init
  git submodule update
}

build() {
	cd "${_pkgname}"
	
	qmake-qt5 PREFIX=/usr LRELEASE=/usr/bin/lrelease notepadqq.pro

	make
	
}

package() {
	cd "${_pkgname}"

	make INSTALL_ROOT="${pkgdir}" install
}


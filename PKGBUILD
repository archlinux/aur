# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-terminal-git
pkgver=20161106.bd4257d
pkgrel=1
pkgdesc="Terminal application and modules for Liri OS"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('vibe-git' 'glib2' 'dconf')
makedepends=('git' 'extra-cmake-modules')
conflicts=('hawaii-terminal-git' 'papyros-terminal-git' 'papyros-qmltermwidget-git' 'liri-terminal')
replaces=('hawaii-terminal-git' 'papyros-terminal-git' 'papyros-qmltermwidget-git' 'liri-terminal')
provides=('liri-terminal')
groups=('liri-git')
install=$pkgname.install

_gitroot="git://github.com/lirios/terminal.git"
_gitbranch=develop
_gitname=terminal
source=(${_gitname}::${_gitroot}#branch=${_gitbranch}
        qmltermwidget::git://github.com/lirios/qmltermwidget#branch=master)
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
	mkdir -p build
}

build() {
	cd ${srcdir}/qmltermwidget
	qmake
	make
	cd -

	cd build
	cmake ../${_gitname} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE_INSTALL_LIBDIR=lib \
		-DKDE_INSTALL_LIBEXECDIR=lib
	make
}

package() {
	cd ${srcdir}/qmltermwidget
	make INSTALL_ROOT="${pkgdir}" install
	cd -

	cd build
	make DESTDIR="${pkgdir}" install
}

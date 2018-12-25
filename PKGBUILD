# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-terminal-git
pkgver=v0.2.0.r46.g15759fc
pkgrel=1
pkgdesc="Terminal application and modules for Liri OS"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('qt5-gsettings-git' 'glib2' 'dconf')
makedepends=('git' 'liri-cmake-shared-git')
conflicts=('hawaii-terminal-git' 'papyros-terminal-git' 'papyros-qmltermwidget-git' 'liri-terminal')
replaces=('hawaii-terminal-git' 'papyros-terminal-git' 'papyros-qmltermwidget-git' 'liri-terminal')
options=(debug !strip)
provides=('liri-terminal')
groups=('liri-git')
install=$pkgname.install

_gitroot="git://github.com/lirios/terminal.git"
_gitbranch=develop
_gitname=terminal
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../${_gitname} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_TESTING:BOOL=OFF \
		-DINSTALL_SYSCONFDIR=/etc \
		-DINSTALL_LIBDIR=/usr/lib \
		-DINSTALL_LIBEXECDIR=/usr/lib \
		-DINSTALL_QMLDIR=/usr/lib/qt/qml \
		-DINSTALL_PLUGINSDIR=/usr/lib/qt/plugins
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}

# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-appcenter-git
pkgver=v0.1.0.r250.gd8c36da
pkgrel=1
pkgdesc="App Center for Liri OS"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('qt5-accountsservice-git' 'fluid-git' 'libliri-git' 'appstream-qt' 'flatpak')
makedepends=('git' 'qt5-tools' 'liri-cmake-shared-git')
options=(debug !strip)
conflicts=('liri-appcenter')
replaces=('liri-appcenter')
provides=('liri-appcenter')
groups=('liri-git')

_gitroot="git+https://github.com/lirios/appcenter.git"
_gitbranch=develop
_gitname=appcenter
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

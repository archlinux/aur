# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-files-git
pkgver=v0.1.0.r70.g2b81df0
pkgrel=1
pkgdesc="File manager for Liri OS"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('fluid-git' 'taglib')
makedepends=('git' 'liri-cmake-shared-git' 'qt5-tools')
options=(debug !strip)
conflicts=('liri-files')
replaces=('liri-files')
provides=('liri-files')
groups=('liri-git')

_gitroot="git://github.com/lirios/files.git"
_gitbranch=develop
_gitname=files
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

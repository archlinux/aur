# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

# Rebuild when Qt is updated

pkgname=liri-eglfs-git
pkgver=r18.23941d3
pkgrel=1
pkgdesc="Liri QPA plugin"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('systemd' 'libdrm' 'libinput' 'qt5-declarative' 'qt5-wayland'
         'xkeyboard-config' 'libxkbcommon' 'glib2' 'fontconfig' 'freetype2'
	 'qt5-udev-git' 'libliri-git')
makedepends=('git' 'liri-cmake-shared-git')
options=(debug !strip)
conflicts=('liri-eglfs')
replaces=('liri-eglfs')
provides=('liri-eglfs')
groups=('liri-git')

_gitroot="git://github.com/lirios/eglfs.git"
_gitbranch=develop
_gitname=eglfs
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

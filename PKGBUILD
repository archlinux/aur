# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-shell-git
pkgver=v0.9.0.r310.gd7e54966
pkgrel=1
pkgdesc="QtQuick and Wayland based shell for convergence"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('qt5-tools' 'qt5-wayland' 'qt5-accountsservice-git' 'qt5-gsettings-git'
         'libqtxdg' 'polkit-qt5' 'solid' 'pam' 'pipewire' 'dconf' 'libliri-git' 'fluid-git'
	 'liri-platformtheme-git' 'qml-xwayland-git' 'liri-eglfs-git')
makedepends=('git' 'liri-cmake-shared-git')
options=(debug !strip)
conflicts=('hawaii-shell-git' 'papyros-shell-git' 'liri-workspace-git' 'liri-wayland-git' 'liri-shell')
replaces=('hawaii-shell-git' 'papyros-shell-git' 'liri-workspace-git' 'liri-wayland-git' 'liri-shell')
provides=('liri-shell')
groups=('liri-git')
install=$pkgname.install

_gitroot="git://github.com/lirios/shell.git"
_gitbranch=develop
_gitname=shell
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

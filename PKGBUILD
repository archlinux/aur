# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-wayland-git
pkgver=20170130.cf49d8d
pkgrel=1
pkgdesc="QtWayland additions and QPA plugin"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('systemd' 'wayland-protocols' 'libdrm' 'libinput' 'qt5-declarative' 'qt5-wayland'
         'xkeyboard-config' 'libxkbcommon' 'glib2' 'fontconfig' 'freetype2')
makedepends=('git' 'extra-cmake-modules' 'xcb-util-cursor' 'libxcursor')
conflicts=('greenisland' 'greenisland-git' 'liri-wayland')
replaces=('greenisland' 'greenisland-git' 'liri-wayland')
provides=('liri-wayland')
groups=('liri-git')

_gitroot="git://github.com/lirios/wayland.git"
_gitbranch=develop
_gitname=wayland
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../${_gitname} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE_INSTALL_LIBDIR=lib \
		-DKDE_INSTALL_LIBEXECDIR=lib \
		-DBUILD_HACK=ON
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}

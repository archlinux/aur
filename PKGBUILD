# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-shell-git
pkgver=20150601.89b684f
pkgrel=1
pkgdesc="Hawaii Shell"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/hawaii-desktop/hawaii-shell"
license=('GPL', 'LGPL')
depends=('qt5-tools' 'qt5-quickcontrols' 'qt5-graphicaleffects' 'qt5-svg'
         'greenisland-git' 'pam' 'libpulse' 'libqtxdg' 'glib2' 'networkmanager-qt'
         'hawaii-icon-themes-git' 'hawaii-wallpapers-git' 'solid'
         'ttf-dejavu' 'ttf-droid')
optdepends=('weston: nested mode support'
            'pulseaudio: audio support'
            'networkmanager: networking support')
makedepends=('git' 'gdb' 'extra-cmake-modules')
conflicts=('hawaii-shell')
replaces=('hawaii-shell')
provides=('hawaii-shell')
groups=('hawaii-git')
options=('debug')
install=$pkgname.install

_gitroot="git://github.com/hawaii-desktop/hawaii-shell.git"
_gitbranch=master
_gitname=hawaii-shell
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
		-DLIB_INSTALL_DIR=lib \
		-DLIBEXEC_INSTALL_DIR=lib \
		-DQML_INSTALL_DIR=lib/qt/qml \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
		-DQtWaylandScanner_EXECUTABLE=/usr/lib/qt/bin/qtwaylandscanner \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	make VERBOSE=1
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}

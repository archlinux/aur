# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

# Rebuild when Qt is updated

pkgname=liri-eglfs-git
pkgver=20181012.6.ce8c6e6
pkgrel=1
pkgdesc="Liri QPA plugin"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('systemd' 'libdrm' 'libinput' 'qt5-declarative' 'qt5-wayland'
         'xkeyboard-config' 'libxkbcommon' 'glib2' 'fontconfig' 'freetype2'
	 'qt5-udev-git' 'libliri-git')
makedepends=('git' 'liri-qbs-shared-git')
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
	echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git rev-list --count HEAD).$(git log -1 --format="%h")"
}

prepare() {
	cd ${srcdir}/${_gitname}
	git submodule update --init
}

build() {
	cd ${srcdir}/${_gitname}
	qbs setup-toolchains --type gcc /usr/bin/g++ gcc
	qbs setup-qt /usr/bin/qmake-qt5 qt5
	qbs config profiles.qt5.baseProfile gcc
	qbs build --no-install -d build profile:qt5 \
		modules.lirideployment.prefix:/usr \
		modules.lirideployment.qmlDir:/usr/lib/qt/qml \
		modules.lirideployment.pluginsDir:/usr/lib/qt/plugins
}

package() {
	cd ${srcdir}/${_gitname}
	qbs install -d build --no-build -v --install-root $pkgdir profile:qt5
}

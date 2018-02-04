# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-themes-git
pkgver=20180203.110.01132ae
pkgrel=1
pkgdesc="Themes for uniform look and feel throughout Liri OS"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('liri-shell-git')
makedepends=('git' 'liri-qbs-shared-git')
conflicts=('liri-themes')
replaces=('liri-themes')
provides=('liri-themes')
groups=('liri-git')

_gitroot="git://github.com/lirios/themes.git"
_gitbranch=develop
_gitname=themes
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
		modules.lirideployment.prefix:/usr
}

package() {
	cd ${srcdir}/${_gitname}
	qbs install -d build --no-build -v --install-root $pkgdir profile:qt5
}

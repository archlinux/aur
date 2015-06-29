# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=xfvnc-git
pkgver=0.r100.g31c1e02
pkgrel=4
pkgdesc='A simple graphical VNC client - git checkout'
arch=('i686' 'x86_64')
url='http://spurint.org/projects/xfvnc/'
license=('GPL')
provides=('xfvnc')
conflicts=('xfvnc')
depends=('libxfce4ui' 'gtk-vnc')
makedepends=('pkgconfig' 'xfce4-dev-tools' 'git' 'autoconf')
source=('git://git.xfce.org/apps/xfvnc'
	'0001-autoconf.patch'
	'0002-compile-against-libxfce4ui.patch')
sha256sums=('SKIP'
            'a9266304c782fa4d73527fe5367081e1f4da7850a305fd9adc06f98db4ea0dda'
            '5ded010bf5f684901a55fcbb9620d2a191fc130f857be3606e62add3a4f7779b')

pkgver() {
	cd xfvnc/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

prepare() {
	cd xfvnc/

	patch -Np1 < "${srcdir}/0001-autoconf.patch"
	patch -Np1 < "${srcdir}/0002-compile-against-libxfce4ui.patch"
}

build() {
	cd xfvnc/

	sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac.in
	./autogen.sh --prefix=/usr
	MAKEFLAGS="" make
}

package() {
	cd xfvnc/

	make DESTDIR="${pkgdir}" install
}


# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com> ([community] package)

pkgname=remmina-git
pkgver=1.2.0.rcgit.3.r2.g91fd9fd
pkgrel=1
pkgdesc='A remote desktop client written in GTK+ - git checkout'
arch=(i686 x86_64)
url='http://sourceforge.net/projects/remmina/'
license=('GPL')
depends=('gtk2' 'zlib' 'libjpeg' 'libssh' 'libunique' 'avahi' 'vte3'
	'libgcrypt' 'libxdmcp' 'libgnome-keyring' 'libvncserver')
makedepends=('git' 'intltool' 'pkgconfig' 'cmake'
	'avahi' 'libxkbfile' 'freerdp-git' 'telepathy-glib')
optdepends=('avahi' 'libxkbfile' 'freerdp-git' 'telepathy-glib')
replaces=('remmina-plugins')
provides=('remmina' "grdc" "grdc=$pkgver" 'remmina-plugins')
conflicts=('remmina' "grdc")
install=remmina.install
source=('remmina::git://github.com/FreeRDP/Remmina#branch=next')
sha256sums=('SKIP')

pkgver() {
	cd remmina/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd remmina/

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DWITH_APPINDICATOR=OFF \
		.
	make
}

package() {
	cd remmina/

	make DESTDIR="${pkgdir}/" install
}


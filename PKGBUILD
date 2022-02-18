# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=xfmpc-git
pkgver=0.3.0.r64.gd0b3a77
pkgrel=1
pkgdesc='A graphical GTK+ MPD client focusing on low footprint - git checkout'
arch=('i686' 'x86_64')
url='http://goodies.xfce.org/projects/applications/xfmpc/'
license=('GPL')
provides=('xfmpc')
conflicts=('xfmpc')
depends=('libxfce4ui' 'libmpd')
makedepends=('git' 'intltool' 'vala' 'xfce4-dev-tools')
source=('git+https://gitlab.xfce.org/apps/xfmpc')
sha256sums=('SKIP')

pkgver() {
	cd xfmpc/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

build() {
	cd xfmpc/

	./autogen.sh \
		--prefix=/usr
	make
}

package() {
	cd xfmpc/

	make DESTDIR="${pkgdir}" install
}


# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: cute.tec@gmail.com

pkgname=xfwm4-git
pkgver=4.12.0.r237.g03c4b509
pkgrel=1
pkgdesc='Xfce window manager - git checkout'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://git.xfce.org/xfce/xfwm4'
groups=('xfce4')
depends=('libxfce4ui' 'libwnck' 'libxpresent')
makedepends=('git' 'intltool' 'xfce4-dev-tools' 'exo')
provides=('xfwm4')
conflicts=('xfwm4')
source=('git://git.xfce.org/xfce/xfwm4')
sha256sums=('SKIP')

pkgver() {
	cd xfwm4/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git log -1 --format='%h')"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git log -1 --format='%h')"
	fi
}

prepare() {
	cd xfwm4

	# https://bugzilla.xfce.org/show_bug.cgi?id=12534
	git revert --no-commit 0dfb55407a830572f03297b3c118fac1f3c5b80d
}

build() {
	cd xfwm4/

	./autogen.sh
	./configure \
		--enable-maintainer-mode \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib \
		--localstatedir=/var \
		--disable-static \
		--enable-startup-notification \
		--enable-render \
		--enable-randr \
		--enable-epoxy \
		--enable-xpresent \
		--enable-compositor \
		--enable-xsync \
		--disable-debug
	make
}

package() {
	cd xfwm4/

	make DESTDIR=${pkgdir} install
}


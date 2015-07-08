# Maintainer: Christian Hesse <arch@eworm.de>
# Contributor: Jens Staal <staal1978@gmail.com>

pkgname=ubase-git
pkgver=0.r565.g71da562
pkgrel=1
pkgdesc='An extension of the sbase *nix core utilities - git checkout'
arch=('i686' 'x86_64')
license=('MIT')
url='http://git.suckless.org/ubase/'
depends=('sbase-git')
makedepends=('git')
source=('git://git.suckless.org/ubase')
sha256sums=('SKIP')

pkgver() {
	cd ${srcdir}/ubase/

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

#prepare() {
#	cd $srcdir/ubase/
#	#temporary hacks
#	sed -i 's|MAN = $(SRC:.c=.1)|MAN = chvt.1 |g' Makefile
#}

build() {
	cd ${srcdir}/ubase/

	make
}

package() {
	cd ${srcdir}/ubase/

	make DESTDIR=${pkgdir} PREFIX=/opt/sbase MANPREFIX=/opt/sbase/man install
	install -D -m0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# Maintainer: Christian Hesse <mail@eworm.de
# Contributor: Eric Bélanger <eric@archlinux.org> ([extra] package)

pkgname=putty-git
pkgver=0.63.r847.g5da8ec5
pkgrel=1
pkgdesc="A terminal integrated SSH/Telnet client - git checkout"
arch=('i686' 'x86_64')
url="http://www.chiark.greenend.org.uk/~sgtatham/putty/"
license=('MIT')
depends=('gtk2')
makedepends=('git' 'perl' 'halibut')
conflicts=('putty')
provides=('putty')
source=('git://git.tartarus.org/simon/putty.git')
sha256sums=('SKIP')

pkgver() {
	cd putty/

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

build() {
	cd putty/

	./mkfiles.pl
	autoreconf -fi
	./configure --prefix=/usr

	( cd doc && make )

	make
}

package() {
	cd putty/

	make DESTDIR="${pkgdir}" install
	install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


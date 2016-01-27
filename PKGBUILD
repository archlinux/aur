# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=svkbd-git
pkgver=0.r50.gfc26700
pkgrel=1
pkgdesc='simple virtual keyboard - git checkout'
arch=('i686' 'x86_64')
url='http://tools.suckless.org/x/svkbd'
depends=('libx11' 'libxtst')
conflicts=('svkbd')
provides=('svkbd')
makedepends=('git' 'markdown')
license=('MIT')
source=('git://git.suckless.org/svkbd')
sha256sums=('SKIP')

pkgver() {
	cd svkbd/

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
	cd svkbd/

	make

	markdown README.md > README.html
}

package() {
	cd svkbd/

	make DESTDIR="${pkgdir}" PREFIX='/usr/' install

	install -D -m0644 'LICENSE' "${pkgdir}/usr/share/licenses/vis/LICENSE"
	install -D -m0644 'README.md' "${pkgdir}/usr/share/doc/vis/README.md"
	install -D -m0644 'README.html' "${pkgdir}/usr/share/doc/vis/README.html"
}


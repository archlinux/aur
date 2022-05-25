# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=svkbd-git
pkgver=0.4.1.r0.g38faf1c
pkgrel=1
pkgdesc='simple virtual keyboard - git checkout'
arch=('i686' 'x86_64')
url='http://tools.suckless.org/x/svkbd'
depends=('libx11' 'libxtst' 'libxft' 'libxinerama')
conflicts=('svkbd')
provides=('svkbd')
makedepends=('git' 'discount')
license=('MIT')
source=('git://git.suckless.org/svkbd')
sha256sums=('SKIP')

pkgver() {
	cd svkbd/

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
	cd svkbd/

	make

	markdown README.md > README.html
}

package() {
	cd svkbd/

	make DESTDIR="${pkgdir}" PREFIX='/usr/' install

	install -D -m0644 'LICENSE' "${pkgdir}/usr/share/licenses/svkbd/LICENSE"
	install -D -m0644 'README.md' "${pkgdir}/usr/share/doc/svkbd/README.md"
	install -D -m0644 'README.html' "${pkgdir}/usr/share/doc/svkbd/README.html"
}


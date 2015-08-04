# Maintainer: Christian Hesse <mail@eworm.de
# Contributor: Lukas Fleischer <lfleischer at archlinux dot org>
# Contributor: Loui Chang <louipc dot ist at gmail company>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Nathan Jones <nathanj@insightbb.com>

pkgname=tig-git
pkgver=2.1.1.r48.geecfbda
pkgrel=1
pkgdesc='Text-mode interface for Git - git checkout'
depends=('git' 'ncurses')
makedepends=('asciidoc' 'xmlto')
url='http://jonas.nitro.dk/tig/'
license=('GPL')
arch=('i686' 'x86_64')
conflicts=('tig')
provides=('tig')
backup=('etc/tigrc')
source=('git://github.com/jonas/tig.git')
sha256sums=('SKIP')

pkgver() {
	cd tig/

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
	cd tig/

	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd tig/

	make DESTDIR="${pkgdir}" install install-doc-man

	install -Dm0644 contrib/tig-completion.bash "${pkgdir}/usr/share/bash-completion/completions/tig"
}


# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor: Sascha Biermmanns <saschakb at gmail dot com>

pkgname=sbase-git
pkgver=0.r1472.g47c05f9
pkgrel=1
pkgdesc='A suckless variant of the *nix core utilities - git checkout'
arch=('i686' 'x86_64')
license=('MIT')
url='http://git.suckless.org/sbase'
makedepends=('git')
source=('git://git.suckless.org/sbase')
sha256sums=('SKIP')

pkgver() {
	cd ${srcdir}/sbase/

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
	cd ${srcdir}/sbase/
#	sed -i 's/-D_BSD_SOURCE//' config.mk
	make
}

package() {
	cd $srcdir/sbase/

	make DESTDIR=${pkgdir} PREFIX=/opt/sbase MANPREFIX=/opt/sbase/man install
	install -D -m0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

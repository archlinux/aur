# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor: Sascha Biermmanns <saschakb at gmail dot com>

pkgname=sbase-git
pkgver=0.r1823.gd098ac4
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
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

build() {
	cd ${srcdir}/sbase/

	make
}

package() {
	cd $srcdir/sbase/

	make DESTDIR=${pkgdir} PREFIX=/opt/sbase MANPREFIX=/opt/sbase/man install
	install -D -m0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

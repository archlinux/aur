# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>

pkgname=darkhttpd-git
pkgver=1.14.r6.g11d36de
pkgrel=1
pkgdesc='A small, static webserver - git checkout'
arch=('i686' 'x86_64')
url='https://unix4lyfe.org/darkhttpd/'
license=('BSD')
depends=('glibc')
makedepends=('git')
conflicts=('darkhttpd')
provides=('darkhttpd')
source=('git+https://github.com/emikulic/darkhttpd'
	'darkhttpd.service'
	'darkhttpd.socket')
sha256sums=('SKIP'
            'c0c8885682aca80474986080b5426f73dbf37237d02e3fc9035ac72ba74cdb1b'
            '3a5ad507b72c0c37e3255a70a5dcd8c8c79b728efd07a2dc2f6786f9b9cc3c1b')

pkgver() {
	cd darkhttpd/

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
	cd darkhttpd/

	make
}

package() {
	cd darkhttpd/

	install -D darkhttpd ${pkgdir}/usr/bin/darkhttpd

	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	sed -n '1,/ \*\//p' < darkhttpd.c > ${pkgdir}/usr/share/licenses/${pkgname}/license

	install -D -m0644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README

	install -D -m0644 ${srcdir}/darkhttpd.service ${pkgdir}/usr/lib/systemd/system/darkhttpd.service
	install -D -m0644 ${srcdir}/darkhttpd.socket ${pkgdir}/usr/lib/systemd/system/darkhttpd.socket
}


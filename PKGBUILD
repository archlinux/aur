# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>

pkgname=darkhttpd-git
pkgver=0.r283.g32158f9
pkgrel=1
pkgdesc="A small, static webserver - git checkout"
arch=('i686' 'x86_64')
url="http://dmr.ath.cx/net/darkhttpd/"
license=('BSD')
depends=('glibc')
makedepends=('git')
conflicts=('darkhttpd')
provides=('darkhttpd')
source=('git+http://unix4lyfe.org/git/darkhttpd'
	'darkhttpd.service'
	'darkhttpd.socket'
	'http://www.eworm.de/download/linux/darkhttpd-get-version-string-from-git.patch')

pkgver() {
	cd darkhttpd/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd darkhttpd/

	patch -Np1 < ${srcdir}/darkhttpd-get-version-string-from-git.patch

	make
}

package() {
	cd darkhttpd/

	install -D darkhttpd ${pkgdir}/usr/bin/darkhttpd

	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	sed -n '1,/ \*\//p' < darkhttpd.c > ${pkgdir}/usr/share/licenses/${pkgname}/license

	install -D -m0644 README ${pkgdir}/usr/share/doc/${pkgname}/README

	install -D -m0644 ${srcdir}/darkhttpd.service ${pkgdir}/usr/lib/systemd/system/darkhttpd.service
	install -D -m0644 ${srcdir}/darkhttpd.socket ${pkgdir}/usr/lib/systemd/system/darkhttpd.socket
}

sha256sums=('SKIP'
            'c0c8885682aca80474986080b5426f73dbf37237d02e3fc9035ac72ba74cdb1b'
            '3a5ad507b72c0c37e3255a70a5dcd8c8c79b728efd07a2dc2f6786f9b9cc3c1b'
            'b5be5a3a4bbd27aa2f197167e01e89866f196057ab077c209658f41d036b9815')

# $Id: PKGBUILD 35758 2010-12-22 10:54:29Z lfleischer $
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=spidermonkey-1.7
pkgver=1.7.0
pkgrel=5
pkgdesc="Mozilla's C implementation of JavaScript."
url="http://www.mozilla.org/js/spidermonkey/"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('nspr' 'ppl')
options=('!makeflags')
source=("http://ftp.mozilla.org/pub/mozilla.org/js/js-${pkgver}.tar.gz" \
	'spidermonkey-1.7-threadsafe.patch' 'spidermonkey-Makefile.patch')
md5sums=('5571134c3863686b623ebe4e6b1f6fe6'
	 'b2ef9be017b6aa1857354b5223975a4f'
	 '161d4c0f2c604d15cba29dab60b1f7a7')

build() {
	cd ${srcdir}/js/src
	patch -p0 < ${srcdir}/spidermonkey-Makefile.patch || return 1
	sed -i 's|include|include/spidermonkey-1.7|' rules.mk || return 1
	# fix for the lib location
	[ "$CARCH" = 'x86_64' ] && (sed -i -e 's|lib64|lib|g' config.mk || return 1)
	# patch Makefile for threadsafe support with native nspr
	patch -p2 -i ${srcdir}/spidermonkey-1.7-threadsafe.patch || return 1
	# FS#16673
	export CFLAGS="${CFLAGS} -DJS_C_STRINGS_ARE_UTF8"
	# build - threadsafe
}

package() {
	cd ${srcdir}/js/src
	make -f Makefile.ref BUILD_OPT=1 JS_THREADSAFE=1 DIST=${pkgdir}/usr all export || return 1
        mv ${pkgdir}/usr/bin/js ${pkgdir}/usr/bin/spidermonkey-1.7
}

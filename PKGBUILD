# Contributor: Cyker Way <cykerway at gmail dot com>
# Maintainer: Cyker Way <cykerway at gmail dot com>
# Maintainer: Nikolay Korotkiy <sikmir at gmail dot com>
pkgname=spidermonkey
pkgver=45.0.2
pkgrel=3
pkgdesc="Mozilla's JavaScript engine"
arch=('i686' 'x86_64')
url="http://developer.mozilla.org/en/SpiderMonkey"
license=('MPL2')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://ftp.mozilla.org/pub/$pkgname/releases/$pkgver/mozjs-$pkgver.tar.bz2"
        "patch_js_src_configure.diff"
        "patch_js_src_Makefile.in.diff"
        "patch_js_src_moz.build.diff")
sha256sums=('570530b1e551bf4a459d7cae875f33f99d5ef0c29ccc7742a1b6f588e5eadbee'
            '4a3688e7232a9fef0d5c48edc7b28c918e878415af49572008eefc9aa709cdd7'
            '3b68b66cfe30fce81aa37e2ed21ffad517b88437b5cd1b18243b05fd1ab8d5db'
            '76ba065716684f35d79af6bbd81b746ee6a6f60824b4f45bff87ed67d9fc3bda')

prepare() {
	cd mozjs-$pkgver
	patch -Np1 < ../patch_js_src_configure.diff
	patch -Np1 < ../patch_js_src_Makefile.in.diff
	patch -Np1 < ../patch_js_src_moz.build.diff
}

build() {
	cd mozjs-$pkgver/js/src
	mkdir build_OPT.OBJ
	cd build_OPT.OBJ
	CPPFLAGS="-mno-avx -O2" \
	../configure \
	    --with-system-nspr \
	    --with-system-icu \
	    --with-system-zlib \
	    --enable-release \
	    --disable-tests \
	    --prefix=/usr
	make
}

package() {
	cd mozjs-$pkgver/js/src/build_OPT.OBJ
	make DESTDIR="$pkgdir/" install
	# Resolve symlinks so they don't point to $srcdir
	for l in $(find "$pkgdir/usr/include/" -type l); do
		cp --remove-destination $(readlink $l) $l
	done
	chmod -x $pkgdir/usr/include/mozjs-45/js-config.h
	rename .ajs .a $pkgdir/usr/lib/libjs_static.ajs
}

# Maintainer: MGislv <mgislv at ceppo dot xyz>

pkgname=dropbear-client
pkgver=2022.83
pkgrel=1
pkgdesc='Lightweight SSH client'
arch=('x86_64')
url='https://github.com/mkj/dropbear'
license=('MIT')
conflicts=('dropbear')
depends=('libxcrypt' 'zlib')
makedepends=('git')
validpgpkeys=('F7347EF2EE2E07A267628CA944931494F29C6773')
source=("git+$url#commit=a4689e25ec85904b9111f4e96d3994ff17b1c3e6" # tag: DROPBEAR_2022.83
        'localoptions.h')
b2sums=('SKIP'
        '49628bbce0d26eb33598de276ede705bd592a38b7892c9db0ceebfb0598a1ee6e7e84ed03dbf255ee1adcad0c5214d38dc03e6c04176a405f59a19765cb28388')

prepare() {
	cp -f localoptions.h dropbear/localoptions.h
}

build() {
	cd dropbear
	autoconf
	autoheader
	./configure --disable-syslog --bindir=/usr/bin \
	            --prefix=/usr --sbindir=/usr/bin \
		    CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"
	make PROGRAMS='dbclient dropbearconvert dropbearkey'
}

package() {
	install -d "$pkgdir/etc/dropbear"
	make -C dropbear install DESTDIR="$pkgdir"
	install -Dm644 dropbear/LICENSE \
	        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

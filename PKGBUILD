# Maintainer: Manhong Dai <daimh@umich.edu>

pkgname=lighttpd1.4-git
pkgver=1.4.59.r396.g6ffabc96
pkgrel=1
pkgdesc='A secure, fast, compliant and very flexible web-server'
license=('custom')
arch=('x86_64')
url="https://www.lighttpd.net/"
depends=('pcre' 'util-linux' 'systemd')
makedepends=('mariadb-libs' 'lua' 'libxml2' 'e2fsprogs' 'sqlite' 'gdbm' 'pkgconfig' 'git')
optdepends=('libxml2: mod_webdav'
	'lua: mod_cml/mod_magnet'
	'mariadb-libs: mod_mysql_vhost/mod_authn_mysql'
	'sqlite: mod_webdav')
backup=('etc/lighttpd/lighttpd.conf' 'etc/logrotate.d/lighttpd')
options=('emptydirs')
source=("${pkgname}"::"git+https://git.lighttpd.net/lighttpd/lighttpd1.4.git"
	'lighttpd.logrotate.d' 'lighttpd.conf' 'lighttpd.tmpfiles' 'lighttpd.service')
sha256sums=('SKIP'
	'41f6c0042bb61021553779f861910e335834f6c15e4411756cdc6233b31076fe'
	'fece4581bebf39768571962dedce176b2b5f487c0abb5c1cfb35395de216c01f'
	'd8a185145a7c08b4fd8c8e6c12dae3e176389dd9b1c66e239757b2ba5108c871'
	'0c88403364e732c06090f6807105dedbac25aa82add0499d28007f8aaa780b78')

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/^lighttpd-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
	cd "$srcdir/$pkgname"
	./autogen.sh
	./configure --prefix=/usr \
		--sbindir=/usr/bin \
		--libdir=/usr/lib/lighttpd/ \
		--sysconfdir=/etc/lighttpd \
		--with-mysql \
		--with-ldap \
		--with-attr \
		--with-openssl \
		--with-kerberos5 \
		--without-fam \
		--with-webdav-props \
		--with-webdav-locks \
		--with-gdbm \
		--with-lua
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

check() {
	cd "$srcdir/$pkgname"
	make check
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install

	install -D -m644 "$srcdir/lighttpd.logrotate.d" "$pkgdir/etc/logrotate.d/lighttpd"
	install -D -m644 "$srcdir/lighttpd.conf" "$pkgdir/etc/lighttpd/lighttpd.conf"
	install -d -m700 -o http -g http "$pkgdir"/var/{log,cache}/lighttpd/
	install -D -m644 "${srcdir}/lighttpd.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/lighttpd.conf"
	install -D -m644 "${srcdir}/lighttpd.service" "${pkgdir}/usr/lib/systemd/system/lighttpd.service"

	pushd doc/config >/dev/null
	find . -type f ! -name 'Makefile*' -exec install -D -m644 {} "${pkgdir}"/usr/share/doc/lighttpd/config/{} \;
	popd >/dev/null

	install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

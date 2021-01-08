# Maintainer: ShyanJMC

pkgname=lighttpd_minimal
pkgver=1.4.59
pkgrel=1
arch=('any')
pkgdesc="Lighttpd with less features to be more minimal as never. Compiled with native support."
url="https://www.lighttpd.net/"
license=('BSD3')
source=("git+https://github.com/lighttpd/lighttpd1.4.git")
md5sums=('SKIP')
conflicts=('lighttpd')
provides=('lighttpd')


## There are many mandatory functions, build(){} is needed to build the package.


build() {
	cd lighttpd1.4 
	bash autogen.sh
	## -enable-static and --disable-shared is for not share libs with the system, all to the binary file. Rest are features disabled. The CFLAGS are the flags/arguments passed to gcc when build the binary or parts.
	./configure CC=gcc CFLAGS="-g -march=native -O2 -Wall -W -Wshadow -pedantic"  --enable-static --disable-shared    --without-lua --without-ldap --without-attr --without-valgrind --without-libunwind --without-krb5 --without-nss -without-pcre --without-zlib --without-bzip2 --without-brotli --without-fam --without-webdav-props --without-libxml --without-sqlite --without-webdav-locks --without-uuid --without-xxhash --without-gdbm --without-geoip --without-maxminddb --without-memcached --without-sasl --without-krb5 --without-brotli --without-dbi --without-pgsql --without-mysql --without-nettle --without-nss --without-openssl --without-zlib

	make
}

## Package function will produce the respectives files and folders to allow pacman to create the new it.
## The "make DESTDIR="$pkgdir/" install" call will install files into the fakeroot environment so pacman will alow track them.

package() {
	cd lighttpd1.4
	make DESTDIR="$pkgdir/" install
	libtool --finish $pkgdir/usr/local/lib
}


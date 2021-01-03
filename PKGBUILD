# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=openssl-1.0-hardened
_ver=1.0.2u
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
#pkgver=$_ver
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('perl')
optdepends=('ca-certificates')
provides=(openssl-1.0)
conflicts=(openssl-1.0)
source=("https://artfiles.org/openssl.org/source/old/1.0.2/openssl-1.0.2u.tar.gz"
        'no-rpath.patch'
        'openssl-1.0-versioned-symbols.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
#validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491'
#              '7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C')

prepare() {
	cd $srcdir/openssl-$_ver

	# remove rpath: http://bugs.archlinux.org/task/14367
	patch -p0 -i $srcdir/no-rpath.patch

	# add symbol versioning to prevent conflicts with openssl 1.1 symbols (Debian)
	patch -p1 -i "$srcdir"/openssl-1.0-versioned-symbols.patch
}

build() {
	cd "$srcdir/openssl-$_ver"

	if [ "${CARCH}" == 'x86_64' ]; then
		openssltarget='linux-x86_64'
		optflags='enable-ec_nistp_64_gcc_128'
	elif [ "${CARCH}" == 'i686' ]; then
		openssltarget='linux-elf'
		optflags=''
	fi

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib/openssl-1.0 \
		shared no-ssl3-method ${optflags} enable-ec_nistp_64_gcc_128 linux-x86_64 no-ssl2 no-ssl3 no-weak-ssl-ciphers no-ssl no-deprecated no-tls1 no-tls1-method no-tls1_1 no-tls1_1-method no-tls1_2 no-tls1_2-method enable-tls1_3 no-rc2 no-rc4 no-idea no-seed \
		"${openssltarget}" \
		"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

	make depend
	make
}

#check() {
#	cd "$srcdir/openssl-$_ver"
#	make test
#}

package() {
	cd "$srcdir/openssl-$_ver"

	make INSTALL_PREFIX="$pkgdir" install_sw

	# Move some files around
	install -m755 -d "$pkgdir/usr/include/openssl-1.0"
	mv "$pkgdir/usr/include/openssl" "$pkgdir/usr/include/openssl-1.0/"
	mv "$pkgdir/usr/lib/openssl-1.0/libcrypto.so.1.0.0" "$pkgdir/usr/lib/"
	mv "$pkgdir/usr/lib/openssl-1.0/libssl.so.1.0.0" "$pkgdir/usr/lib/"
	ln -sf ../libssl.so.1.0.0 "$pkgdir/usr/lib/openssl-1.0/libssl.so"
        ln -sf ../libcrypto.so.1.0.0 "$pkgdir/usr/lib/openssl-1.0/libcrypto.so"
	mv "$pkgdir/usr/bin/openssl" "$pkgdir/usr/bin/openssl-1.0"

	# Update includedir in .pc files
	sed -e 's|/include$|/include/openssl-1.0|' -i "$pkgdir"/usr/lib/openssl-1.0/pkgconfig/*.pc

	rm -rf "$pkgdir"/{etc,usr/bin/c_rehash}

	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}

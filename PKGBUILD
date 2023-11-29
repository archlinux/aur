# Maintainer: Pierre Schmitz <pierre@archlinux.de>

_pkgname=openssl
pkgname=openssl-3.2
pkgver=3.2.0
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('x86_64')
url='https://www.openssl.org'
license=('Apache')
depends=('glibc')
makedepends=('perl')
optdepends=('ca-certificates' 'perl')
provides=('libcrypto.so' 'libssl.so')
source=("https://www.openssl.org/source/${_pkgname}-${pkgver}.tar.gz"{,.asc}
        'ca-dir.patch'
        'openssl')
sha256sums=('14c826f07c7e433706fb5c69fa9e25dab95684844b4c962a2cf1bf183eb4690e'
            'SKIP'
            '0a32d9ca68e8d985ce0bfef6a4c20b46675e06178cc2d0bf6d91bd6865d648b7'
            'b27f64a7fbb0e82dde00cee64424f32de0a29a886dc9df253eeb2475a59db838')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491'
              '7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C'
              'A21FAB74B0088AA361152586B8EF1A6BA9DA2D5C'
              'EFC0A467D613CB83C7ED6D30D894E2CE8B3D79F5')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"

	# set ca dir to /etc/ssl by default
	patch -Np1 -i "$srcdir/ca-dir.patch"
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib/openssl-3.2 \
		shared enable-argon2 enable-ktls enable-ec_nistp_64_gcc_128 linux-$CARCH \
		"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

	make depend
	make
}

check() {
	cd "$srcdir/$_pkgname-$pkgver"

	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	patch -Rp1 -i "$srcdir/ca-dir.patch"

	make HARNESS_JOBS=$(nproc) test

	patch -Np1 -i "$srcdir/ca-dir.patch"
	# re-run make to re-generate CA.pl from the patched .in file.
	make apps/CA.pl
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"

	make DESTDIR="$pkgdir" install_sw

  install -m755 -d "$pkgdir/usr/include/$pkgname" "$pkgdir/usr/share/$pkgname"
  mv "$pkgdir/usr/include/openssl" "$pkgdir/usr/include/$pkgname/"
  mv "$pkgdir/usr/bin/openssl" "$pkgdir/usr/share/$pkgname/"
  install -Dm755 "$srcdir/openssl" "$pkgdir/usr/bin/$pkgname"

  # update includedir in .pc files
  sed -e "s|/include$|/include/$pkgname|" -i "$pkgdir"/usr/lib/$pkgname/pkgconfig/*.pc

  rm -rf "$pkgdir"/{etc,usr/bin/c_rehash}

	install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Pierre Schmitz <pierre [at] archlinux [dot] de>

pkgname=lib32-openssl-1.0
_ver=1.0.2k
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
#pkgver=$_ver
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (32-bit)'
arch=('x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('lib32-glibc' 'perl' "${pkgname#lib32-}")
makedepends=('gcc-multilib')
optdepends=('ca-certificates')
options=('!makeflags')
source=("https://www.openssl.org/source/openssl-${_ver}.tar.gz"
        "https://www.openssl.org/source/openssl-${_ver}.tar.gz.asc"
        'no-rpath.patch'
        'ssl3-test-failure.patch'
        'openssl-1.0-versioned-symbols.patch')
md5sums=('f965fc0bf01bf882b31314b61391ae65'
         'SKIP'
         'dc78d3d06baffc16217519242ce92478'
         '62fc492252edd3283871632bb77fadbe'
         'fb9dab4e571c1110375c8375f809b78e')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

prepare() {
	cd "openssl-$_ver"

	# remove rpath: http://bugs.archlinux.org/task/14367
	patch -p0 -i "$srcdir"/no-rpath.patch

	# disable a test that fails when ssl3 is disabled
	patch -p1 -i "$srcdir"/ssl3-test-failure.patch

	# add symbol versioning to prevent conflicts with openssl 1.1 symbols (Debian)
	patch -p1 -i "$srcdir"/openssl-1.0-versioned-symbols.patch
}

build() {
	# Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
	export CC='gcc -m32'
	export CXX='g++ -m32'
	export LDFLAGS="-m32 ${LDFLAGS}"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	cd "openssl-$_ver"

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib32/openssl-1.0 \
		shared no-ssl3-method ${optflags} \
		linux-elf \
		"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

	make MAKEDEPPROG="${CC}" depend
	make
}

check() {
	cd "openssl-$_ver"
	make test
}

package() {
	cd "openssl-$_ver"

	make INSTALL_PREFIX="$pkgdir" install_sw

	# Move some files around
	mv "$pkgdir/usr/lib32/openssl-1.0/libcrypto.so.1.0.0" "$pkgdir/usr/lib32/"
	mv "$pkgdir/usr/lib32/openssl-1.0/libssl.so.1.0.0" "$pkgdir/usr/lib32/"
	ln -sf ../libssl.so.1.0.0 "$pkgdir/usr/lib32/openssl-1.0/libssl.so"
	ln -sf ../libcrypto.so.1.0.0 "$pkgdir/usr/lib32/openssl-1.0/libcrypto.so"

	# Update includedir in .pc files
	sed -e 's|/include$|/include/openssl-1.0|' -i "$pkgdir"/usr/lib32/openssl-1.0/pkgconfig/*.pc

	rm -rf "$pkgdir"/{etc,usr/{bin,include}}

	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}

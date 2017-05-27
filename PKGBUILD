# Maintainer Marius <marius@habarnam.ro>
# Initial work by: Michael Straube <straubem@gmx.de>
#             and: Pierre Schmitz <pierre@archlinux.de>

pkgname=lib32-libopenssl-1.0-compat
_ver=1.0.2l
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=1
pkgdesc='The Open Source library for Secure Sockets Layer and Transport Layer Security (without versioned symbols patch)'
arch=('x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('perl')
conflicts=('lib32-openssl-1.0')
makedepends=('gcc-multilib' 'makedepend')
optdepends=('ca-certificates')
options=('!makeflags')
source=("https://www.openssl.org/source/openssl-${_ver}.tar.gz"
        "https://www.openssl.org/source/openssl-${_ver}.tar.gz.asc"
        "no-rpath.patch"
        "ssl3-test-failure.patch")
sha256sums=('ce07195b659e75f4e1db43552860070061f156a98bb37b672b101ba6e3ddf30c'
            'SKIP'
            '754d6107a306311e15a1db6a1cc031b81691c8b9865e8809ac60ca6f184c957c'
            'c54ae87c602eaa1530a336ab7c6e22e12898e1941012349c153e52553df64a13')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491') # Matt Caswell

prepare() {
	cd openssl-$_ver

	# remove rpath: http://bugs.archlinux.org/task/14367
	patch -p0 -i ../no-rpath.patch

	# disable a test that fails when ssl3 is disabled
	patch -p1 -i ../ssl3-test-failure.patch
}

build() {
    export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	cd openssl-$_ver

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure linux-elf --prefix=/usr --openssldir=/etc/ssl --libdir=lib32/openssl-1.0 \
		shared no-ssl3-method \
		"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

	make depend
	make
}

check() {
	cd openssl-$_ver
	make test
}

package() {
	cd openssl-$_ver
	install -Dm755 libcrypto.so.1.0.0 "$pkgdir/usr/lib32/libcrypto-compat.so.1.0.0"
	install -Dm755 libssl.so.1.0.0 "$pkgdir/usr/lib32/libssl-compat.so.1.0.0"
	install -d "$pkgdir/usr/lib32/openssl-1.0-compat"
	for _i in so so.1.0.0; do
		ln -sf ../libssl-compat.so.1.0.0 "$pkgdir/usr/lib32/openssl-1.0-compat/libssl.${_i}"
		ln -sf ../libcrypto-compat.so.1.0.0 "$pkgdir/usr/lib32/openssl-1.0-compat/libcrypto.${_i}"
	done
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

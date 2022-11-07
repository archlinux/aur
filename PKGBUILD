# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_pkgbasename=openssl
pkgname=lib32-$_pkgbasename-hardened
epoch=1
_ver=1.1.1s
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (32-bit)'
arch=('x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('lib32-glibc' "${_pkgbasename}")
optdepends=('ca-certificates')
provides=(lib32-openssl)
conflicts=(lib32-openssl)
source=("https://artfiles.org/openssl.org/source/openssl-${_ver}.tar.gz"
        'ca-dir.patch')
sha256sums=('c5ac01e760ee6ff0dab61d6b2bbd30146724d063eb322180c6f18a6f74e4b6aa'
            '0938c8d68110768db4f350a7ec641070686904f2fe7ba630ac94399d7dc8cc5e')

prepare() {
	cd "$srcdir"/$_pkgbasename-$_ver

	# set ca dir to /etc/ssl by default
	patch -p0 -i "$srcdir"/ca-dir.patch
}

build() {
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	cd "$srcdir"/$_pkgbasename-$_ver

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib32 \
		shared no-ssl3-method linux-elf no-ssl2 no-ssl3 no-weak-ssl-ciphers no-ssl no-deprecated no-tls1 no-tls1-method no-tls1_1 no-tls1_1-method no-tls1_2 \
                no-tls1_2-method enable-tls1_3 no-rc2 no-rc4 no-idea no-seed -DOPENSSL_USE_IPV6=0 \
	"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

	make MAKEDEPPROG="${CC}" depend
	make
}

#check() {
#	cd "$srcdir"/$_pkgbasename-$_ver
	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
#	patch -p0 -R -i "$srcdir"/ca-dir.patch
#	make test
#	patch -p0 -i "$srcdir"/ca-dir.patch
#}

package() {
	cd "$srcdir"/$_pkgbasename-$_ver
	make DESTDIR="$pkgdir" install_sw

	rm -rf ${pkgdir}/{usr/{include,bin},etc}
	mkdir -p "$pkgdir"/usr/share/licenses
	ln -s $_pkgbasename "$pkgdir"/usr/share/licenses/$pkgname
}

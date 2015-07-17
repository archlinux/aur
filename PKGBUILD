# $Id: PKGBUILD 129583 2015-03-19 15:10:55Z fyan $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

_pkgbasename=openssl
pkgname=lib32-$_pkgbasename-chacha20
_ver=1.0.2d
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
#pkgver=$_ver
pkgrel=0
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security with ChaCha20 support (32-bit)'
arch=('x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('lib32-zlib' "${_pkgbasename}")
conflicts=('lib32-openssl')
provides=("lib32-openssl=${pkgver}")
optdepends=('ca-certificates')
makedepends=('gcc-multilib')
options=('!makeflags')
source=("https://www.openssl.org/source/${_pkgbasename}-${_ver}.tar.gz"
        "https://www.openssl.org/source/${_pkgbasename}-${_ver}.tar.gz.asc"
        'no-rpath.patch'
        'ca-dir.patch'
        'openssl__chacha20_poly1305_cf.patch')
validpgpkeys=(8657ABB260F056B1E5190839D9C4D26D0E604491)
md5sums=('38dd619b2e77cbac69b99f52a053d25a'
         'SKIP'
         'dc78d3d06baffc16217519242ce92478'
         '3bf51be3a1bbd262be46dc619f92aa90'
         '4d0375669574f12e7eeae9f46a17a493')

prepare() {
	cd $srcdir/$_pkgbasename-$_ver

	# remove rpath: http://bugs.archlinux.org/task/14367
	patch -p0 -i $srcdir/no-rpath.patch
	# set ca dir to /etc/ssl by default
	patch -p0 -i $srcdir/ca-dir.patch
        # Cloudflare patch
        # https://github.com/cloudflare/sslconfig/blob/master/patches/openssl__chacha20_poly1305_cf.patch
        patch -p1 -i $srcdir/openssl__chacha20_poly1305_cf.patch
}

build() {
 	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	cd $srcdir/$_pkgbasename-$_ver

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib32 \
		shared zlib \
		linux-elf \
		"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

	make MAKEDEPPROG="${CC}" depend
	make
}

check() {
	cd $srcdir/$_pkgbasename-$_ver
	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	patch -p0 -R -i $srcdir/ca-dir.patch
	make test
	patch -p0 -i $srcdir/ca-dir.patch
}

package() {
	cd $srcdir/$_pkgbasename-$_ver
	make INSTALL_PREFIX=$pkgdir install_sw

	rm -rf ${pkgdir}/{usr/{include,bin},etc}
	mkdir -p $pkgdir/usr/share/licenses
	ln -s $_pkgbasename $pkgdir/usr/share/licenses/$pkgname
}

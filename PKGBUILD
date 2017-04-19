# Maintainer: Yurii Kolesnykov <yurikoles@gmail.com> 
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_pkgbasename=openssl
pkgname=lib32-openssl100
_ver=1.0.2k
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
#pkgver=$_ver
pkgrel=1
epoch=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (32-bit)'
arch=('x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('lib32-glibc' "${_pkgbasename}")
optdepends=('ca-certificates')
makedepends=('gcc-multilib')
options=('!makeflags')
source=("https://www.openssl.org/source/${_pkgbasename}-${_ver}.tar.gz"
        "https://www.openssl.org/source/${_pkgbasename}-${_ver}.tar.gz.asc"
        'no-rpath.patch'
        'ssl3-test-failure.patch'
        'ca-dir.patch')
validpgpkeys=(8657ABB260F056B1E5190839D9C4D26D0E604491)
md5sums=('f965fc0bf01bf882b31314b61391ae65'
         'SKIP'
         'dc78d3d06baffc16217519242ce92478'
         '62fc492252edd3283871632bb77fadbe'
         '3bf51be3a1bbd262be46dc619f92aa90')

prepare() {
	cd $srcdir/$_pkgbasename-$_ver

	# remove rpath: http://bugs.archlinux.org/task/14367
	patch -p0 -i $srcdir/no-rpath.patch

	# disable a test that fails when ssl3 is disabled
	patch -p1 -i $srcdir/ssl3-test-failure.patch

	# set ca dir to /etc/ssl by default
	patch -p0 -i $srcdir/ca-dir.patch
}

build() {
 	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	cd $srcdir/$_pkgbasename-$_ver

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib32 \
		shared no-ssl3-method \
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
	
	install -D -m0755 libssl.so.1.0.0 "${pkgdir}/usr/lib32/libssl.so.1.0.0"
	install -D -m0755 libcrypto.so.1.0.0 "${pkgdir}/usr/lib32/libcrypto.so.1.0.0"

	mkdir -p "${pkgdir}/usr/share/licenses"
	ln -s ${_pkgbasename} "${pkgdir}/usr/share/licenses/${pkgname}"
}

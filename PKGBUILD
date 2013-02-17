# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=openssl
_ver=1.0.1e
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
#pkgver=$_ver
pkgrel=3
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('i686' 'x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('perl')
optdepends=('ca-certificates')
options=('!makeflags')
backup=('etc/ssl/openssl.cnf')
source=("https://www.openssl.org/source/${pkgname}-${_ver}.tar.gz"
        "https://www.openssl.org/source/${pkgname}-${_ver}.tar.gz.asc"
        'no-rpath.patch'
        'ca-dir.patch')
md5sums=('66bf6f10f060d561929de96f9dfe5b8c'
         'e18847df48d39416f4ca5064887a2e28'
         'dc78d3d06baffc16217519242ce92478'
         '3bf51be3a1bbd262be46dc619f92aa90')

build() {
	cd $srcdir/$pkgname-$_ver

	if [ "${CARCH}" == 'x86_64' ]; then
		openssltarget='linux-x86_64'
		optflags='enable-ec_nistp_64_gcc_128'
	elif [ "${CARCH}" == 'i686' ]; then
		openssltarget='linux-elf'
		optflags=''
	fi

	# remove rpath: http://bugs.archlinux.org/task/14367
	patch -p0 -i $srcdir/no-rpath.patch
	# set ca dir to /etc/ssl by default
	patch -p0 -i $srcdir/ca-dir.patch

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
		shared zlib ${optflags} \
		"${openssltarget}" \
		-Wa,--noexecstack "${CFLAGS}" "${LDFLAGS}"

	make depend
	make
}

check() {
	cd $srcdir/$pkgname-$_ver
	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	patch -p0 -R -i $srcdir/ca-dir.patch
	make test
	patch -p0 -i $srcdir/ca-dir.patch
}

package() {
	cd $srcdir/$pkgname-$_ver
	make INSTALL_PREFIX=$pkgdir MANDIR=/usr/share/man MANSUFFIX=ssl install
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

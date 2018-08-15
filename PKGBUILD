# $Id$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

_pkgname=openssl
pkgname=${_pkgname}-chacha20
_ver=1.1.0i
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
#pkgver=$_ver
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security with Chacha20 cipher'
arch=('i686' 'x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('perl')
optdepends=('ca-certificates')
options=('!makeflags')
backup=('etc/ssl/openssl.cnf')
conflicts=('openssl')
provides=("openssl=${pkgver}")
source=("https://www.openssl.org/source/${_pkgname}-${_ver}.tar.gz"
	"https://www.openssl.org/source/${_pkgname}-${_ver}.tar.gz.asc"
	'ca-dir.patch'
	'openssl__1.1.0_chacha20_poly1305.patch')
sha256sums=('ebbfc844a8c8cc0ea5dc10b86c9ce97f401837f3fa08c17b2cdadc118253cf99'
            'SKIP'
            '90c7411fed0157116f2df8f4be755aaf5a26e8484351b4e6a79492805d5f2790'
            '3c1b39f8d17dc384486ebe61aa783cc4a649ed9d7b633c02f36693b8af265160')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

prepare() {
	cd $srcdir/$_pkgname-$_ver

	# set ca dir to /etc/ssl by default
	patch -p0 -i $srcdir/ca-dir.patch

	# Cloudflare patch
	# https://raw.githubusercontent.com/cloudflare/sslconfig/master/patches/openssl__1.1.0_chacha20_poly1305.patch
	patch -p1 -i $srcdir/openssl__1.1.0_chacha20_poly1305.patch
}

build() {
	cd $srcdir/$_pkgname-$_ver

	if [ "${CARCH}" == 'x86_64' ]; then
		openssltarget='linux-x86_64'
		optflags='enable-ec_nistp_64_gcc_128'
	elif [ "${CARCH}" == 'i686' ]; then
		openssltarget='linux-elf'
		optflags=''
	fi

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
		shared no-ssl3-method ${optflags} \
		"${openssltarget}" \
		"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

	make depend
	make
}

check() {
	cd $srcdir/$_pkgname-$_ver
	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	patch -p0 -R -i $srcdir/ca-dir.patch
	make test
	patch -p0 -i $srcdir/ca-dir.patch
}

package() {
	cd $srcdir/$_pkgname-$_ver
	make DESTDIR=$pkgdir MANDIR=/usr/share/man MANSUFFIX=ssl install_sw install_ssldirs install_man_docs
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}

# Maintainer: Geert Hendrickx <geert@hendrickx.be>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_pkgname=openssl
_branch=master
pkgname=${_pkgname}-tls1.3-git
pkgver=1.1.1.pre1.r130.g60595292ae # updated by pkgver() below
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security with TLS 1.3 support'
arch=('i686' 'x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('perl')
optdepends=('ca-certificates')
options=('!makeflags')
backup=('etc/ssl/openssl.cnf')
conflicts=('openssl')
provides=("openssl=${pkgver}")
source=("${pkgname}::git+https://github.com/openssl/openssl.git#branch=${_branch}"
	'ca-dir.patch')
sha256sums=('SKIP'
	'90c7411fed0157116f2df8f4be755aaf5a26e8484351b4e6a79492805d5f2790')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

prepare() {
	cd $srcdir/$pkgname

	# set ca dir to /etc/ssl by default
	patch -p0 -i $srcdir/ca-dir.patch
}

pkgver() {
	cd $srcdir/$pkgname
	git describe --long | sed -e 's/^OpenSSL[0-9_]\+./1.1.1./' -e 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/$pkgname

	if [ "${CARCH}" == 'x86_64' ]; then
		openssltarget='linux-x86_64'
		optflags='enable-ec_nistp_64_gcc_128'
	elif [ "${CARCH}" == 'i686' ]; then
		openssltarget='linux-elf'
		optflags=''
	fi

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
		shared no-ssl3-method enable-tls1_3 ${optflags} \
		"${openssltarget}" \
		"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

	make depend
	make
}

check() {
	cd $srcdir/$pkgname
	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	patch -p0 -R -i $srcdir/ca-dir.patch
	make test || true
	patch -p0 -i $srcdir/ca-dir.patch
}

package() {
	cd $srcdir/$pkgname
	make DESTDIR=$pkgdir MANDIR=/usr/share/man MANSUFFIX=ssl install_sw install_ssldirs install_man_docs
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}

# $Id$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

_pkgname=openssl
pkgname=${_pkgname}-chacha20
_ver=1.0.2g
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
#pkgver=$_ver
pkgrel=3
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
	'no-rpath.patch'
	'ssl3-test-failure.patch'
	'ca-dir.patch'
	'openssl__chacha20_poly1305_draft_and_rfc_ossl102g.patch')
sha256sums=('b784b1b3907ce39abf4098702dade6365522a253ad1552e267a9a0e89594aa33'
	'SKIP'
	'754d6107a306311e15a1db6a1cc031b81691c8b9865e8809ac60ca6f184c957c'
	'c54ae87c602eaa1530a336ab7c6e22e12898e1941012349c153e52553df64a13'
	'9e8126f3a748f4c1d6fe34d4436de72b16a40e97a6d18234d2e88caa179d50c4'
	'09a2e88f95d8cd12bd9c23cd87554ab700fb1625a848c0502951849fb1d564fc')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

prepare() {
	cd $srcdir/$_pkgname-$_ver

	# remove rpath: http://bugs.archlinux.org/task/14367
	patch -p0 -i $srcdir/no-rpath.patch

	# disable a test that fails when ssl3 is disabled
	patch -p1 -i $srcdir/ssl3-test-failure.patch

	# set ca dir to /etc/ssl by default
	patch -p0 -i $srcdir/ca-dir.patch

	# Cloudflare patch
	# https://github.com/cloudflare/sslconfig/blob/master/patches/openssl__chacha20_poly1305_draft_and_rfc_ossl102g.patch
	patch -p1 -i $srcdir/openssl__chacha20_poly1305_draft_and_rfc_ossl102g.patch
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
	make INSTALL_PREFIX=$pkgdir MANDIR=/usr/share/man MANSUFFIX=ssl install
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}

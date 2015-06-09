# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Based on ArchLinux's official PKGBUILD for Openssl
#
# $Id: PKGBUILD 228861 2015-01-09 17:56:17Z pierre $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=openssl-via-padlock
_ver=1.0.1l
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
#pkgver=$_ver
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (with VIA PadLock hardware encryption engine support)'
arch=('i686' 'x86_64')
#url='https://www.openssl.org'
url=https://romanrm.net/openssl-padlock
license=('custom:BSD')
depends=('zlib' 'perl')
optdepends=('ca-certificates')
options=('!makeflags')
backup=('etc/ssl/openssl.cnf')
conflicts=('openssl')
provides=('openssl=1.0.1l')
source=("https://www.openssl.org/source/${pkgname%-via-padlock}-${_ver}.tar.gz"
        'no-rpath.patch'
        'ca-dir.patch'
        'http://git.alpinelinux.org/cgit/aports/plain/main/openssl/0001-crypto-hmac-support-EVP_MD_CTX_FLAG_ONESHOT-and-set-.patch'
        'http://git.alpinelinux.org/cgit/aports/plain/main/openssl/0002-engines-e_padlock-backport-cvs-head-changes.patch'
        'http://openssl.6102.n7.nabble.com/attachment/44055/0/0003-engines-e_padlock-implement-sha1-sha224-sha256-accel.patch'
        'http://git.alpinelinux.org/cgit/aports/plain/main/openssl/0004-crypto-engine-autoload-padlock-dynamic-engine.patch'
        'http://git.alpinelinux.org/cgit/aports/plain/main/openssl/0005-s_client-ircv3-starttls.patch')
md5sums=('cdb22925fc9bc97ccbf1e007661f2aa6'
         'dc78d3d06baffc16217519242ce92478'
         '3bf51be3a1bbd262be46dc619f92aa90'
         'ddb5fc155145d5b852425adaec32234d'
         'a7717dd564ef876d4923a80751714d63'
         '5f5436580b4950f75f5c4d96b40714d7'
         'c32f42451a07267ee5dfb3781fa40c00'
         'c5b1042a3acaf3591f3f5620b7086e12')

#validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

prepare() {
	cd $srcdir/${pkgname%-via-padlock}-$_ver

	# remove rpath: http://bugs.archlinux.org/task/14367
	patch -p0 -i $srcdir/no-rpath.patch
	# set ca dir to /etc/ssl by default
	patch -p0 -i $srcdir/ca-dir.patch
  # patch for via hardware rng
  patch --verbose -p1 -i $srcdir/0001*.patch
  patch --verbose -p1 -i $srcdir/0002*.patch
	patch --verbose -p1 -i $srcdir/0003*.patch
	patch --verbose -p1 -i $srcdir/0004*.patch
	patch --verbose -p1 -i $srcdir/0005*.patch
}

build() {
	cd $srcdir/${pkgname%-via-padlock}-$_ver

	if [ "${CARCH}" == 'x86_64' ]; then
		openssltarget='linux-x86_64'
		optflags='enable-ec_nistp_64_gcc_128'
	elif [ "${CARCH}" == 'i686' ]; then
		openssltarget='linux-elf'
		optflags=''
	fi

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
		shared zlib ${optflags} \
		"${openssltarget}" \
		"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

	make depend
	make
}

check() {
	cd $srcdir/${pkgname%-via-padlock}-$_ver
	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	patch -p0 -R -i $srcdir/ca-dir.patch
	make test
	patch -p0 -i $srcdir/ca-dir.patch
}

package() {
	cd $srcdir/${pkgname%-via-padlock}-$_ver
	make INSTALL_PREFIX=$pkgdir MANDIR=/usr/share/man MANSUFFIX=ssl install
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-via-padlock}/LICENSE
}

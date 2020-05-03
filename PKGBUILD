# Based on openssl 1.1.0f PKGBUILD
# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: oneup <oneup40 at gmail dot com>

_basename=openssl
pkgname=openssl-zlib
_ver=1.1.1g
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security with zlib support'
arch=('i686' 'x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('perl' 'zlib')
optdepends=('ca-certificates')
backup=('etc/ssl/openssl.cnf')
source=("https://www.openssl.org/source/${_basename}-${_ver}.tar.gz"{,.asc}
        'ca-dir.patch')
sha256sums=('ddb04774f1e32f0c49751e21b67216ac87852ceb056b75209af2443400636d46'
            'SKIP'
            '90c7411fed0157116f2df8f4be755aaf5a26e8484351b4e6a79492805d5f2790')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491'
              '7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C')
provides=('openssl')
conflicts=('openssl')

prepare() {
	cd "$srcdir/$_basename-$_ver"

	# set ca dir to /etc/ssl by default
	patch -p0 -i "$srcdir/ca-dir.patch"
}

build() {
	cd "$srcdir/$_basename-$_ver"

	if [ "${CARCH}" == 'x86_64' ]; then
		openssltarget='linux-x86_64'
		optflags='enable-ec_nistp_64_gcc_128'
	elif [ "${CARCH}" == 'i686' ]; then
		openssltarget='linux-elf'
		optflags=''
	fi

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
		shared no-ssl3-method zlib ${optflags} \
		"${openssltarget}" \
		"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

	make depend
	make
}

check() {
	cd "$srcdir/$_basename-$_ver"
	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	patch -p0 -R -i "$srcdir/ca-dir.patch"
	patch -p0 -i "$srcdir/ca-dir.patch"
}

package() {
	cd "$srcdir/$_basename-$_ver"
	make DESTDIR=$pkgdir MANDIR=/usr/share/man MANSUFFIX=ssl install_sw install_ssldirs install_man_docs
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

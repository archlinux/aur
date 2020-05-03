# Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=openssl-static
_pkgname=openssl
_ver=1.1.1g
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=2
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (static library)'
arch=('i686' 'x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('perl')
optdepends=('openssl: headers and pkg-config files')
options=('staticlibs')
source=("https://www.openssl.org/source/${_pkgname}-${_ver}.tar.gz"{,.asc}
        'ca-dir.patch')
sha512sums=('01e3d0b1bceeed8fb066f542ef5480862001556e0f612e017442330bbd7e5faee228b2de3513d7fc347446b7f217e27de1003dc9d7214d5833b97593f3ec25ab'
            'SKIP'
            '6eb0e388107a751d2ab1222efe5dec736111d4edad72c9b7c3f4dc55270e19811e89e9df596210e3f79751e60b77c7bc891e181e67cff79aa1b64a02a20bc2e7')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491'
              '7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C')

prepare() {
	cd $srcdir/$_pkgname-$_ver

	# set ca dir to /etc/ssl by default
	patch -p0 -i $srcdir/ca-dir.patch
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
		no-shared no-ssl3-method ${optflags} \
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
	make INSTALL_PREFIX=$pkgdir MANDIR=/usr/share/man MANSUFFIX=ssl install_sw install_ssldirs install_man_docs
	rm -rf "$pkgdir/usr/"{bin,include,share,lib/engines,lib/pkgconfig} $pkgdir/usr/lib/*.so* $pkgdir/etc
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

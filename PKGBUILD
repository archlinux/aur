# Maintainer: Pierre Schmitz <pierre@archlinux.de>

_pkgname=openssl
pkgname=$_pkgname-static
_ver=1.1.1d
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (static library)'
arch=('i686' 'x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('perl')
optdepends=('openssl: headers and pkg-config files')
options=('staticlibs')
source=("https://www.openssl.org/source/${_pkgname}-${_ver}.tar.gz"{,.asc}
        'ca-dir.patch')
sha512sums=('2bc9f528c27fe644308eb7603c992bac8740e9f0c3601a130af30c9ffebbf7e0f5c28b76a00bbb478bad40fbe89b4223a58d604001e1713da71ff4b7fe6a08a7'
            'SKIP'
            '209ad95ba6757cc17a3550dbe1e231e4dc9a77516f69478c5970722d32157ee53b68cd614650eae6cd8c1c3961eb0de3a2e6ee00f973bf16b537c608fce1936d')
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

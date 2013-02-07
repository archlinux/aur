# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=openssl
_ver=1.0.1d
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
#pkgver=$_ver
pkgrel=1
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
        'fix-manpages.patch'
        'no-rpath.patch'
        'ca-dir.patch'
        'Fix-IV-check-and-padding-removal.patch')
md5sums=('b92fc634f0f1f31a67ed4175adc5ba33'
         'f06c54781073ef57c01b593adf377759'
         '5bbc0655bda2af95bc8eb568963ce8ba'
         'dc78d3d06baffc16217519242ce92478'
         '3bf51be3a1bbd262be46dc619f92aa90'
         'b92ec62a1f3e7fdc65481afff709cd8b')

build() {
	cd $srcdir/$pkgname-$_ver

	if [ "${CARCH}" == 'x86_64' ]; then
		openssltarget='linux-x86_64'
		optflags='enable-ec_nistp_64_gcc_128'
	elif [ "${CARCH}" == 'i686' ]; then
		openssltarget='linux-elf'
		optflags=''
	fi

	# avoid conflicts with other man pages
	# see http://www.linuxfromscratch.org/patches/downloads/openssl/
	patch -p1 -i $srcdir/fix-manpages.patch
	# remove rpath: http://bugs.archlinux.org/task/14367
	patch -p0 -i $srcdir/no-rpath.patch
	# set ca dir to /etc/ssl by default
	patch -p0 -i $srcdir/ca-dir.patch
	# https://rt.openssl.org/Ticket/Display.html?id=2975
	patch -p1 -i $srcdir/Fix-IV-check-and-padding-removal.patch
	
	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	# workaround for PR#2771: OPENSSL_NO_TLS1_2_CLIENT
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
		shared zlib enable-md2 ${optflags} \
		"${openssltarget}" \
		-Wa,--noexecstack "${CFLAGS}" "${LDFLAGS}" \
		-DOPENSSL_NO_TLS1_2_CLIENT

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
	make INSTALL_PREFIX=$pkgdir MANDIR=/usr/share/man install
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# $Id$
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Maintainer: Eden Rose <eenov1988@gmail.com>

_pkgname=openssl
pkgname=openssl-git
_ver=1.1.0f
# use a pacman compatible version scheme
pkgver=1.1.1.dev.20170712.084f9a7046
#pkgver=$_ver
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security. TLS(1.3), RC5, MD2 enabled. - Git Version'
arch=('i686' 'x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('perl')
conflicts=('openssl')
replaces=('openssl')
provides=('openssl' 'openssl-git')
optdepends=('ca-certificates')
backup=('etc/ssl/openssl.cnf')
source=(git+https://github.com/openssl/openssl.git
     "ca-dir.patch")
md5sums=('SKIP'
         '02b53865fb70faef763e262b4971aa4b')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')


pkgver() {
cd "$srcdir/$_pkgname"
  
  DATE="$(date +%Y%m%d)"
  VER1=$(cat README | grep "OpenSSL" | head -1 | sed -e 's/ /\n/g' | tail -1 | sed -e 's/-/./g')
  PV=$(git name-rev --name-only --tags --no-undefined HEAD 2>/dev/null || echo `git rev-parse --short HEAD`) ### get GIT version
  echo "$VER1"."$DATE"."$PV"
}



prepare() {
	cd "$srcdir/$_pkgname"

	# set ca dir to /etc/ssl by default
	patch -p0 -i $srcdir/ca-dir.patch
}

build() {
	cd "$srcdir/$_pkgname"

	if [ "${CARCH}" == 'x86_64' ]; then
		openssltarget='linux-x86_64'
		optflags='enable-ec_nistp_64_gcc_128'
	elif [ "${CARCH}" == 'i686' ]; then
		openssltarget='linux-elf'
		optflags=''
	fi
    
    
	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
		shared zlib-dynamic threads enable-md2 enable-rc5 enable-tls enable-tls1_3 enable-tls1_2 enable-tls1_1 ${optflags} \
		"${openssltarget}" "-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

	make depend
	make
}

check() {
	cd "$srcdir/$_pkgname"
	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	patch -p0 -R -i $srcdir/ca-dir.patch
	make test
	patch -p0 -i $srcdir/ca-dir.patch
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR=$pkgdir MANDIR=/usr/share/man MANSUFFIX=ssl install_sw install_ssldirs install_man_docs
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=openssl
pkgver=0.9.8m
pkgrel=2
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('i686' 'x86_64')
url='http://www.openssl.org'
license=('custom:BSD')
depends=('perl')
optdepends=('ca-certificates')
options=('!makeflags')
backup=('etc/ssl/openssl.cnf')
source=("http://www.openssl.org/source/${pkgname}-${pkgver}.tar.gz"
        'openssl-0.9.8l-fix_manpages-1.patch'
        'openssl-0.9.8a-no-rpath.patch'
        'openssl-0.9.8m-ca-dir.patch'
        'openssl-0.9.8m-cfb.patch')
md5sums=('898bf125370926d5f692a2201124f8ec'
         '04a6a88c2ee4badd4f8649792b73eaf3'
         '4738d1eaff4e9975e9a26e4f76e48318'
         '1216688f46de6948ed2175e58e75c043'
         'd7ead9cc459e5d0233d5b1e1d24380a7')

build() {
	cd $srcdir/$pkgname-$pkgver

	# avoid conflicts with other man pages: http://www.linuxfromscratch.org/patches/blfs/svn/
	patch -p1 -i $srcdir/openssl-0.9.8l-fix_manpages-1.patch
	# remove rpath: http://bugs.archlinux.org/task/14367
	patch -p1 -i $srcdir/openssl-0.9.8a-no-rpath.patch
	# set ca dir to /etc/ssl by default
	patch -p1 -i $srcdir/openssl-0.9.8m-ca-dir.patch
	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./config --prefix=/usr --openssldir=/etc/ssl shared zlib -Wa,--noexecstack

	# see http://bugs.archlinux.org/task/18564
	# and http://cvs.openssl.org/chngview?cn=19336
	# will be in 0.9.8n
	patch -p0 -i $srcdir/openssl-0.9.8m-cfb.patch || return 1

	make || return 1

	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	# patch -p1 -R -i $srcdir/openssl-0.9.8m-ca-dir.patch
	# make test || return 1
	# patch -p1 -i $srcdir/openssl-0.9.8m-ca-dir.patch
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make INSTALL_PREFIX=$pkgdir MANDIR=/usr/share/man install
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

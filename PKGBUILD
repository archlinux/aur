# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=openssl
pkgver=0.9.8k
pkgrel=4
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('i686' 'x86_64')
url='http://www.openssl.org'
license=('custom:BSD')
depends=('zlib' 'perl')
optdepends=('ca-certificates')
options=('!makeflags')
backup=('etc/ssl/openssl.cnf')
# fix_manpages.patch from http://www.linuxfromscratch.org/patches/blfs/svn/
# other patches from http://cvs.fedoraproject.org/viewvc/rpms/openssl/devel/
source=("http://www.openssl.org/source/${pkgname}-${pkgver}.tar.gz"
        'openssl-0.9.8k-fix_manpages-1.patch'
        'openssl-0.9.8a-no-rpath.patch'
        'openssl-0.9.8b-aliasing-bug.patch'
        'openssl-0.9.8g-no-extssl.patch'
        'openssl-0.9.8j-ca-dir.patch')
md5sums=('e555c6d58d276aec7fdc53363e338ab3'
         '04a6a88c2ee4badd4f8649792b73eaf3'
         '4738d1eaff4e9975e9a26e4f76e48318'
         'b18e77cbe01bcff8f1c66ac46d139af4'
         '6559f2bf42adb3e922ef57f463109389'
         'ef8e4f41e687c5e2791488da60ea0be7')

build() {
	cd $srcdir/$pkgname-$pkgver

	# avoid conflicts with other man pages
	patch -p1 -i $srcdir/openssl-0.9.8k-fix_manpages-1.patch
	# remove rpath: http://bugs.archlinux.org/task/14367
	patch -p1 -i $srcdir/openssl-0.9.8a-no-rpath.patch
	# fix alias bug: http://bugs.archlinux.org/task/15454
	patch -p1 -i $srcdir/openssl-0.9.8b-aliasing-bug.patch
	# fix connection with servers using old openssl version
	# see http://bugs.archlinux.org/task/13882
	patch -p1 -i $srcdir/openssl-0.9.8g-no-extssl.patch
	# set ca dir to /etc/ssl by default
	patch -p1 -i $srcdir/openssl-0.9.8j-ca-dir.patch
	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./config --prefix=/usr --openssldir=/etc/ssl shared zlib -Wa,--noexecstack

	make
	make INSTALL_PREFIX=$pkgdir MANDIR=/usr/share/man install

	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	# patch -p1 -R -i $srcdir/openssl-0.9.8j-ca-dir.patch
	# make test

	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

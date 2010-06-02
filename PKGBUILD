# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=openssl
_ver=1.0.0a
# use a pacman compatible version scheme
pkgver=$(echo $_ver|sed -E 's/([a-z])$/.\1/')
pkgrel=2
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('i686' 'x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('perl')
optdepends=('ca-certificates')
options=('!makeflags')
backup=('etc/ssl/openssl.cnf')
source=("https://www.openssl.org/source/${pkgname}-${_ver}.tar.gz"
        'fix-manpages.patch'
        'no-rpath.patch'
        'ca-dir.patch')
md5sums=('e3873edfffc783624cfbdb65e2249cbd'
         'f540cd9e0e3047d589d0581fe7a2d0f2'
         'dc78d3d06baffc16217519242ce92478'
         '3bf51be3a1bbd262be46dc619f92aa90')

# keep an upgrade path for older installations
PKGEXT='.pkg.tar.gz'

build() {
	cd $srcdir/$pkgname-$_ver

	# avoid conflicts with other man pages
	# see http://www.linuxfromscratch.org/patches/downloads/openssl/
	patch -p0 -i $srcdir/fix-manpages.patch || return 1
	# remove rpath: http://bugs.archlinux.org/task/14367
	patch -p0 -i $srcdir/no-rpath.patch || return 1
	# set ca dir to /etc/ssl by default
	patch -p0 -i $srcdir/ca-dir.patch || return 1
	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./config --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
		shared zlib enable-md2 -Wa,--noexecstack || return 1

	make || return 1

	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	#patch -p0 -R -i $srcdir/ca-dir.patch
	#make test || return 1
	#patch -p0 -i $srcdir/ca-dir.patch
}

package() {
	cd $srcdir/$pkgname-$_ver
	make INSTALL_PREFIX=$pkgdir MANDIR=/usr/share/man install
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

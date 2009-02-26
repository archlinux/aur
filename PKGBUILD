# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=openssl
pkgver=0.9.8j
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('i686' 'x86_64')
url='http://www.openssl.org'
license=('custom:BSD')
depends=('zlib' 'perl')
optdepends=('ca-certificates')
options=('!makeflags')
source=("http://www.openssl.org/source/${pkgname}-${pkgver}.tar.gz" \
        'http://www.linuxfromscratch.org/patches/blfs/svn/openssl-0.9.8j-fix_manpages-1.patch')
md5sums=('a5cb5f6c3d11affb387ecf7a997cac0c'
         '04a6a88c2ee4badd4f8649792b73eaf3')

build() {
	cd $srcdir/$pkgname-$pkgver

	patch -p1 -i $srcdir/openssl-0.9.8j-fix_manpages-1.patch  || return 1
	./config --prefix=/usr --openssldir=/etc/ssl shared zlib -Wa,--noexecstack

	make || return 1
	make test  || return 1
	make INSTALL_PREFIX=$pkgdir MANDIR=/usr/share/man install

	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

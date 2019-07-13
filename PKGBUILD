# Maintainer: Sorin-Mihai Vârgolici <sorin-mihai@vargolici.com>
# Contributor: Thomas S Hatch <thatch45@gmail.copm>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us> 
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=aide-selinux
_srcname=aide
pkgver=0.16.2
pkgrel=1
pkgdesc='A file integrity checker and intrusion detection program.'
arch=('i686' 'x86_64')
url="http://aide.github.io/"
license=('GPL')
groups=('selinux')
depends=('acl' 'audit' 'libelf' 'libselinux' 'mhash')
conflicts=('aide')
provides=('aide')
backup=('etc/aide.conf')
source=(https://github.com/$_srcname/$_srcname/releases/download/v$pkgver/$_srcname-$pkgver.tar.gz{,.asc} \
        aide.conf)
md5sums=('1bb877023500451cbad76c8ab1f3ec55'
         'SKIP'
         'd029f9796de01dc8a791f89ac931d7fb')
validpgpkeys=('2BBBD30FAAB29B3253BCFBA6F6947DAB68E7B931') # Hannes von Haugwitz <hannes@vonhaugwitz.com>

build() {
	cd $srcdir/$_srcname-$pkgver
	./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --with-mhash \
        --with-posix-acl \
        --with-prelink \
        --with-xattr \
        --with-zlib \
        --with-e2fsattrs \
	--with-selinux \
	--with-audit \
        --disable-static
	make
}

package() {
	cd $srcdir/$_srcname-$pkgver
	make DESTDIR=$pkgdir install

	install -D -m644 $srcdir/aide.conf $pkgdir/etc/aide.conf
	mkdir -p $pkgdir/var/{log,lib}/aide/
}

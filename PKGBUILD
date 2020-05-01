# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Thomas S Hatch <thatch45@gmail.copm>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=aide
pkgver=0.16.2
pkgrel=2
pkgdesc='A file integrity checker and intrusion detection program.'
arch=('x86_64')
url="https://aide.github.io/"
license=('GPL')
depends=('acl' 'e2fsprogs' 'libelf' 'mhash' 'pcre')
backup=('etc/aide.conf')
source=("https://github.com/aide/aide/releases/download/v${pkgver}/aide-${pkgver}.tar.gz"{,.asc} \
        "aide.conf")
sha256sums=('17f998ae6ae5afb9c83578e4953115ab8a2705efc50dee5c6461cef3f521b797'
            'SKIP'
            'c56b3d360d659614df2552c8dbf5ea500e44974d38c34c07f6cdd3ce4c4ad615')
validpgpkeys=('2BBBD30FAAB29B3253BCFBA6F6947DAB68E7B931') # Hannes von Haugwitz <hannes@vonhaugwitz.com>

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --with-mhash \
        --with-posix-acl \
        --with-prelink \
        --with-xattr \
        --with-zlib \
        --with-e2fsattrs \
        --disable-static
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install

	install -D -m644 $srcdir/aide.conf $pkgdir/etc/aide.conf
    mkdir -p $pkgdir/var/{log,lib}/aide/
}

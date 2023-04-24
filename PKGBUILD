# Maintainer: John Doe <kitterhuff@gmail.com>
# Previous Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=aide
pkgver=0.18.2
pkgrel=3
pkgdesc='A file integrity checker and intrusion detection program.'
arch=('x86_64')
url="https://aide.github.io/"
license=('GPL')
depends=('acl' 'e2fsprogs' 'libelf' 'mhash' 'pcre')
backup=('etc/aide.conf')
source=("https://github.com/aide/aide/releases/download/v${pkgver}/aide-${pkgver}.tar.gz"{,.asc} \
        "aide.conf")
sha256sums=('758ff586c703930129e0a1e8c292ff5127e116fc10d0ffdbea8bf2c1087ca7e4' # aide-${pkgver}.tar.gz sha256sum
             'SKIP'
             'dd8f40a6e0a298dd0f457e6d814bc29c3fd5e5061cc9007386e2c2c3c7887f1a' # aide.conf chksum
             )

validpgpkeys=('2BBBD30FAAB29B3253BCFBA6F6947DAB68E7B931') # Hannes von Haugwitz <hannes@vonhaugwitz.com>

build() {
        echo $srcdir
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
    cd ..
	cp aidecheck.service $srcdir/aidecheck.service
	cp aidecheck.timer $srcdir/aidecheck.timer
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
	echo $pkgdir
	install -D -m644 $srcdir/aide.conf $pkgdir/etc/aide.conf
	install -D -m644 $srcdir/aidecheck.service $pkgdir/usr/lib/systemd/system/aidecheck.service
	install -D -m644 $srcdir/aidecheck.timer $pkgdir/usr/lib/systemd/system/aidecheck.timer
	    mkdir -p $pkgdir/var/{log,lib}/aide/
}


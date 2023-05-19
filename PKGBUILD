# Maintainer: Matthew Spangler <mattspangler@protonmail.com>
# Previous Maintainer: John Doe <kitterhuff@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=aide-mhash
_srcname=aide
pkgver=0.18.3
pkgrel=4
pkgdesc='A file integrity checker and intrusion detection program, compiled with mhash support.'
arch=('x86_64')
url="https://aide.github.io/"
license=('GPL')
depends=('acl' 'e2fsprogs' 'libelf' 'mhash-pkg-config' 'pcre')
backup=('etc/aide.conf')
install='.INSTALL'
source=("https://github.com/aide/aide/releases/download/v${pkgver}/aide-${pkgver}.tar.gz"{,.asc} \
        "aide.conf"
        "aidecheck.service"
        "aidecheck.timer")
sha256sums=('d47da12c4bf085bfdf1828e087a1db5195a4d217ff4c89f40dbd94e2a887a6a2'
            'SKIP'
            '47a8fced6e1f2afae07d521b3701dbd280b3039254d84c8342f981b9a6d943d4'
            'fc7bd68dccc0e8694bb5a001fb6a80514f1380e41b95742e19d19b3172b22878'
            '1eeb977faa98e4e5f6f6b111f4e933c162b6e72d4c65adef85430cf2f34ad9c5')

validpgpkeys=('2BBBD30FAAB29B3253BCFBA6F6947DAB68E7B931') # Hannes von Haugwitz <hannes@vonhaugwitz.com>

build() {
	cd $srcdir/$_srcname-$pkgver
	./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
	--with-posix-acl \
        --with-prelink \
        --with-xattr \
        --with-zlib \
        --with-e2fsattrs \
        --disable-static \
        --with-mhash
	make
}

package() {
	cd $srcdir/$_srcname-$pkgver
	make DESTDIR=$pkgdir install
	install -D -m644 $srcdir/aide.conf $pkgdir/etc/aide.conf
	install -D -m644 $srcdir/aidecheck.service $pkgdir/usr/lib/systemd/system/aidecheck.service
	install -D -m644 $srcdir/aidecheck.timer $pkgdir/usr/lib/systemd/system/aidecheck.timer
}
# (Sole)Maintainer: John Doe <kitterhuff@gmail.com>
# Ex-maintainer: Sorin-Mihai Vârgolici <sorin-mihai@vargolici.com>
# Ex-contributor: Thomas S Hatch <thatch45@gmail.copm>
# Ex-contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Ex-contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Ex-contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

 ################################################################################
##################################################################################
### IF YOUR BUILD FAILS BECAUSE OF "libselinux" NOT BEING ABLE TO BE RESOLVED, ###
###             INSTALL THE "libselinux" PACKAGE FROM THE AUR.                 ###
##################################################################################
 ################################################################################





pkgname=aide-selinux
_srcname=aide
pkgver=0.17.4
pkgrel=2
pkgdesc='A file integrity checker and intrusion detection program.'
arch=('i686' 'x86_64')
url="http://aide.github.io/"
license=('GPL')
groups=('selinux')
depends=('acl' 'audit' 'libelf' 'libselinux' 'mhash' 'e2fsprogs' 'pcre') # libselinux is provided by AUR package "libselinux"
conflicts=('aide')
provides=('aide')
backup=('etc/aide.conf')
source=("https://github.com/aide/aide/releases/download/v${pkgver}/aide-${pkgver}.tar.gz"{,.asc} \
        "aide.conf")
sha256sums=('c81505246f3ffc2e76036d43a77212ae82895b5881d9b9e25c1361b1a9b7a846' # aide-${pkgver}.tar.gz sha256sum
            'SKIP'
            'dd8f40a6e0a298dd0f457e6d814bc29c3fd5e5061cc9007386e2c2c3c7887f1a') # aide.conf sha256sum
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

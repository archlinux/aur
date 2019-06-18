# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=gnutls-guile
_pkgname=gnutls
pkgver=3.6.8
pkgrel=2
pkgdesc="A library which provides a secure layer over a reliable transport layer"
arch=('x86_64')
license=('GPL3' 'LGPL2.1')
url="https://www.gnutls.org/"
options=('!zipman')
depends=('gcc-libs' 'libtasn1' 'readline' 'zlib' 'nettle' 'p11-kit' 'libidn2'
         'libidn2.so' 'libunistring' guile)
checkdepends=('net-tools')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
source=(https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/${_pkgname}-${pkgver}.tar.xz{,.sig})
sha256sums=('aa81944e5635de981171772857e72be231a7e0f559ae0292d2737de475383e83'
            'SKIP')
validpgpkeys=('0424D4EE81A0E3D119C6F835EDA21E94B565716F'
              '1F42418905D8206AA754CCDC29EE58B996865171')
               # "Simon Josefsson <simon@josefsson.org>"
               # "Nikos Mavrogiannopoulos <nmav@gnutls.org>

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr \
	--with-zlib \
	--disable-static \
	--with-idn \
	--enable-guile \
	--with-default-trust-store-pkcs11="pkcs11:model=p11-kit-trust;manufacturer=PKCS%2311%20Kit"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd ${_pkgname}-${pkgver}
  make check
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # lots of .png files are put into infodir and are gzipped by makepkg! this needs to be fixed by using !zipman
  # gzip -9 all files in infodir and manpages manually
  find "$pkgdir/usr/share/info" -name '*.info*' -exec gzip -9 {} \;
  find "$pkgdir/usr/share/man" -exec gzip -9 {} \;
}

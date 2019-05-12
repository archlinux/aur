# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=gnutls
pkgver=3.6.7
pkgrel=1
pkgdesc="A library which provides a secure layer over a reliable transport layer"
arch=('x86_64')
license=('GPL3' 'LGPL2.1')
url="https://www.gnutls.org/"
options=('!zipman')
depends=('gcc-libs' 'libtasn1' 'readline' 'zlib' 'nettle' 'p11-kit' 'libidn2'
         'libidn2.so' 'libunistring')
checkdepends=('net-tools')
source=(https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/${pkgname}-${pkgver}.tar.xz{,.sig})
sha256sums=('5b3409ad5aaf239808730d1ee12fdcd148c0be00262c7edf157af655a8a188e2'
            'SKIP')
validpgpkeys=('0424D4EE81A0E3D119C6F835EDA21E94B565716F'
              '1F42418905D8206AA754CCDC29EE58B996865171')
               # "Simon Josefsson <simon@josefsson.org>"
               # "Nikos Mavrogiannopoulos <nmav@gnutls.org>

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
	--with-zlib \
	--disable-static \
	--with-idn \
	--disable-guile \
	--with-default-trust-store-pkcs11="pkcs11:model=p11-kit-trust;manufacturer=PKCS%2311%20Kit"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # lots of .png files are put into infodir and are gzipped by makepkg! this needs to be fixed by using !zipman
  # gzip -9 all files in infodir and manpages manually
  find "$pkgdir/usr/share/info" -name '*.info*' -exec gzip -9 {} \;
  find "$pkgdir/usr/share/man" -exec gzip -9 {} \;
}

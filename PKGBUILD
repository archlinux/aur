# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: mesmer <mesmer@fisica.if.uff.br>
# Contributor: pRadoslaw Chmielarz <radoslaw.chmielarz@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=gnutls-openssl
_pkgname=gnutls
pkgver=3.6.13
pkgrel=1
pkgdesc="A library which provides a secure layer over a reliable transport layer with OpenSSL"
arch=("i686" "x86_64")
license=('GPL3' 'LGPL2.1')
url="https://gnutls.org/"
options=('!zipman')
depends=('gcc-libs' 'libtasn1' 'readline' 'zlib' 'nettle' 'p11-kit' 'libidn2'
         'libidn2.so' 'libunistring')
checkdepends=('net-tools')
optdepends=('guile: for use with Guile bindings')
provides=("gnutls")
conflicts=("gnutls")
source=(https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/${_pkgname}-${pkgver}.tar.xz{,.sig})
sha256sums=('32041df447d9f4644570cf573c9f60358e865637d69b7e59d1159b7240b52f38'
            'SKIP')
validpgpkeys=('0424D4EE81A0E3D119C6F835EDA21E94B565716F'
              '1F42418905D8206AA754CCDC29EE58B996865171')
               # "Simon Josefsson <simon@josefsson.org>"
               # "Nikos Mavrogiannopoulos <nmav@gnutls.org>
build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./configure --prefix=/usr \
	--with-zlib \
	--disable-static \
	--with-idn \
	--enable-guile --with-guile-site-dir=no \
	--with-default-trust-store-pkcs11="pkcs11:model=p11-kit-trust;manufacturer=PKCS%2311%20Kit" \
	--enable-openssl-compatibility
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make check
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

# lots of .png files are put into infodir and are gzipped by makepkg! this needs to be fixed by using !zipman
  # gzip -9 all files in infodir and manpages manually
  find "$pkgdir/usr/share/info" -name '*.info*' -exec gzip -n -9 {} \;
  find "$pkgdir/usr/share/man" -exec gzip -n -9 {} \;
}

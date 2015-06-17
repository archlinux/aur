# Maintainer: M0Rf30
pkgname=openca-base
pkgver=1.5.0
pkgrel=1
pkgdesc="The OpenCA PKI software provides a complete solution for managing your PKI"
arch=('i686' 'x86_64')
url="http://www.openca.org/projects/openca/"
license=('GPL2')
depends=('openssl' 'openca-tools' 'perl-dbi' 'perl-bit-vector' 'perl-authen-sasl' 'perl-cgi-session' 'perl-convert-asn1' 
'perl-dbd-pg' 'perl-dbd-mysql' 'perl-digest-hmac' 'perl-digest-md5' 'perl-digest-sha1' 'perl-file-temp' 'perl-io-socket-ssl' 'perl-io-stringy'
'perl-mime-base64' 'perl-mime-lite' 'perl-mime-tools' 'perl-mailtools' 'perl-net-ssleay' 'perl-net-server' 'perl-parse-recdescent' 'perl-uri'
'perl-x500-dn' 'perl-xml-parser' 'perl-xml-sax-base' 'perl-xml-twig' 'perl-libintl-perl' 'perl-ldap')
options=('!libtool')
install=$pkgname.install
source=("http://prdownloads.sourceforge.net/project/openca/$pkgname/releases/v$pkgver/sources/$pkgname-$pkgver.tar.gz"
	patch)


build() {
  cd "$srcdir/$pkgname-$pkgver"
              
  ./configure --prefix=/usr  --disable-static  --with-httpd-fs-prefix=/srv/http --with-httpd-url-prefix=/srv/http \
  --with-cgi-url-prefix=/srv/http/cgi-bin/pki --with-auth-user=openca --with-auth-password=openca \
  --with-db-type=mysql --with-httpd-user=http --with-httpd-group=http

  patch -Np1 -i ../patch
  make

}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/var/openca/crypto/cacerts
  make DEST_DIR="$pkgdir" install-online install-offline
  mkdir -p $pkgdir/etc/httpd/conf/extra/openca/
  cp $pkgdir/usr/etc/openca/contrib/apache/*.conf $pkgdir/etc/httpd/conf/extra/openca/
}

md5sums=('9f1102183f1fc1caf43d630f73013307'
         'd63462e9d1565257b835493e8e504ecc')

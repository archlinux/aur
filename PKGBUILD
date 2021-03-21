pkgname=shibboleth-sp
pkgver=3.2.1
pkgrel=1
pkgdesc="Shibboleth SAML2 single sign-on system - Service Provider"
url="https://www.shibboleth.net/"
license=(Apache)
arch=(x86_64)
depends=(
  curl
  gcc-libs
  krb5
  #libmemcached
  libsystemd
  log4shib
  opensaml
  openssl
  unixodbc
  xerces-c
  xml-security-c
  xmltooling
)
makedepends=(
  apache
  boost
  doxygen
  #fcgi
)
optdepends=(
  "apache: To use mod_shib."
)
source=("https://shibboleth.net/downloads/service-provider/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://shibboleth.net/downloads/service-provider/$pkgver/$pkgname-$pkgver.tar.gz.asc"
        "shibboleth-sp.sysusers"
        "shibboleth-sp.tmpfiles"
        "shibd.service")
sha256sums=('b8edaeb2a8a4a46fd1d81027ee3272165c3472f179c981efdf01db22ce3ee3c3'
            'SKIP'
            'c6705c063a8154d1e5503a182cf16057fd2571f2f750609c7436cb7a8a316ee8'
            '7723e6705fc63dd01163644ff1f1eb637cc7b6dc7e3fef2f0f37b5d63afa2d7e'
            '83d152120c8ec7650d1271c0956304c780649916ce21acdf2ee3d7c673a777a4')
validpgpkeys=('DCAA15007BED9DE690CD9523378B845402277962')

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --enable-systemd \
    --enable-apache-24 \
    --with-gssapi \
    ;
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # Duplicates of every config file
  mkdir -p "$pkgdir"/usr/share/$pkgname/dist
  mv "$pkgdir"/etc/shibboleth/*.dist "$pkgdir"/usr/share/$pkgname/dist/

  # Generated during installation
  rm -vf "$pkgdir"/etc/shibboleth/sp-*.pem

  # Miscellaneous garbage
  rm -vf "$pkgdir"/etc/shibboleth/shibd-*
  rm -rvf "$pkgdir"/var/run

  # Scripts
  for _x in keygen metagen seckeygen; do
    mv -v "$pkgdir"/etc/shibboleth/$_x.sh "$pkgdir"/usr/bin/shib-$_x
  done
  for _x in mdquery resolvertest; do
    mv -v "$pkgdir"/usr/bin/$_x "$pkgdir"/usr/bin/shib-$_x
  done

  # Apache module
  mkdir -p "$pkgdir"/usr/lib/httpd/modules
  mv -v "$pkgdir"/usr/lib/shibboleth/mod_shib_24.so \
          "$pkgdir"/usr/lib/httpd/modules/mod_shib.so

  # Extras
  install -Dm0644 "$srcdir"/shibboleth-sp.sysusers \
                    "$pkgdir"/usr/lib/sysusers.d/shibboleth-sp.conf
  install -Dm0644 "$srcdir"/shibboleth-sp.tmpfiles \
                    "$pkgdir"/usr/lib/tmpfiles.d/shibboleth-sp.conf
  install -Dm0644 "$srcdir"/shibd.service \
                    "$pkgdir"/usr/lib/systemd/system/shibd.service
}

# vim: ts=2:sw=2:et:

pkgname=shibboleth-sp
pkgver=3.2.2
pkgrel=1
pkgdesc="Shibboleth SAML2 Service Provider (including Apache mod_shib)"
url="https://wiki.shibboleth.net/confluence/display/SP3/Home"
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
  fcgi
  perl # for apxs
)
optdepends=(
  "apache: To use mod_shib in Apache."
  "fcgi: To use shibresponder and shibauthorizer in Nginx/Lighttpd."
)
source=("https://shibboleth.net/downloads/service-provider/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://shibboleth.net/downloads/service-provider/$pkgver/$pkgname-$pkgver.tar.gz.asc"
        "apache.conf"
        "shibboleth-sp.sysusers"
        "shibboleth-sp.tmpfiles"
        "shibd.service")
sha256sums=('79d304b5bd00f84b04ea87add59c7c2916d4d7d0af725f4b188a67cae6f8a9ec'
            'SKIP'
            'e33bf34a6d629125b79e93da5b7fff6489f6b385bfd6abf04145b438a0446060'
            '8df312358f8341b246f08bc8b8691f49b00dd3fe639061aa24f60a5ddb9551db'
            '425b561c7e3c582aae635e2f41448cdf10e393ab39209668ab3063fd13acebcd'
            '9f2d48c1cd3b80108c1a567ed6778272880c53e8c647b16f18084d681c3b8671')
validpgpkeys=('DCAA15007BED9DE690CD9523378B845402277962')
install=$pkgname.install
backup=(etc/shibboleth/attrChecker.html
        etc/shibboleth/attribute-map.xml
        etc/shibboleth/attribute-policy.xml
        etc/shibboleth/bindingTemplate.html
        etc/shibboleth/console.logger
        etc/shibboleth/discoveryTemplate.html
        etc/shibboleth/globalLogout.html
        etc/shibboleth/localLogout.html
        etc/shibboleth/metadataError.html
        etc/shibboleth/native.logger
        etc/shibboleth/partialLogout.html
        etc/shibboleth/postTemplate.html
        etc/shibboleth/protocols.xml
        etc/shibboleth/security-policy.xml
        etc/shibboleth/sessionError.html
        etc/shibboleth/shibboleth2.xml
        etc/shibboleth/shibd.logger
        etc/shibboleth/sslError.html)

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --enable-apache-24 \
    --enable-systemd \
    --with-apxs24=/usr/bin/apxs \
    --with-fastcgi \
    --with-gssapi \
    ;
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # Apache module
  mkdir -p "$pkgdir"/usr/lib/httpd/modules
  mv -v "$pkgdir"/usr/lib/shibboleth/mod_shib_24.so \
          "$pkgdir"/usr/lib/httpd/modules/mod_shib.so

  # Scripts
  for _x in keygen metagen seckeygen; do
    mv -v "$pkgdir"/etc/shibboleth/$_x.sh "$pkgdir"/usr/bin/shib-$_x
  done
  for _x in mdquery resolvertest; do
    mv -v "$pkgdir"/usr/bin/$_x "$pkgdir"/usr/bin/shib-$_x
  done

  # Remove keys generated during installation
  rm -vf "$pkgdir"/etc/shibboleth/sp-*.pem

  # Remove duplicates of every config file
  mkdir -p "$pkgdir"/usr/share/$pkgname/dist
  mv "$pkgdir"/etc/shibboleth/example-*.xml "$pkgdir"/usr/share/$pkgname/
  mv "$pkgdir"/etc/shibboleth/*.dist "$pkgdir"/usr/share/$pkgname/dist/

  # Remove the bundled Apache and init.d examples
  rm -vf "$pkgdir"/etc/shibboleth/apache*.config
  rm -vf "$pkgdir"/etc/shibboleth/shibd-*

  # Provide our own Apache and systemd examples
  install -Dm0644 "$srcdir"/apache.conf \
                    "$pkgdir"/usr/share/$pkgname/apache.conf
  install -Dm0644 "$srcdir"/shibboleth-sp.sysusers \
                    "$pkgdir"/usr/lib/sysusers.d/shibboleth-sp.conf
  install -Dm0644 "$srcdir"/shibboleth-sp.tmpfiles \
                    "$pkgdir"/usr/lib/tmpfiles.d/shibboleth-sp.conf
  install -Dm0644 "$srcdir"/shibd.service \
                    "$pkgdir"/usr/lib/systemd/system/shibd.service

  # Match tmpfiles.d
  rm -rf "$pkgdir"/var/run
  chmod 0700 "$pkgdir"/var/cache/shibboleth
  chmod 0750 "$pkgdir"/var/log/shibboleth
}

# vim: ts=2:sw=2:et:

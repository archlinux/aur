# Maintainer: Felix Golatofski <contact@xdfr.de>
# Maintainer: Nogweii <me@aether.earth>
# Contributor:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Run tests? They take a bit of time.
run_tests=false

pkgname=certmonger
pkgver=0.79.14
pkgrel=1
pkgdesc="Certificate status monitor and PKI enrollment client"
arch=(i686 x86_64)
url="https://pagure.io/certmonger"
license=(GPL)
depends=(nss tevent xmlrpc-c popt libdbus krb5 jansson)
checkdepends=(diffutils dos2unix expect)
backup=(etc/certmonger/certmonger.conf
        etc/tmpfiles.d/certmonger.conf)
install=${pkgname}.install
source=("https://pagure.io/certmonger/archive/certmonger-${pkgver}/certmonger-certmonger-${pkgver}.tar.gz")
sha512sums=('dea5aa24a23e5a20cf0e074c5048e0c51a1816413914b2b4a62c259d3439339be56d66727f91ce733e9fb4aaaa065e08c0be7bad9454c25e1d3f4cac727b0789')

build() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  unset KRB5_CONFIG
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/${pkgname} \
    --localstatedir=/var \
    --enable-systemd \
    --enable-tmpfiles \
    --with-tmpdir=/run/certmonger \
    --with-uuid \
    --with-gmp

  make
}

check() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  if [[ "${run_tests}" == "true" ]]; then
    make check
  fi
}

package() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

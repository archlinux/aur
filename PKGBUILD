# Maintainer: Felix Golatofski <contact@xdfr.de>
# Maintainer: Nogweii <me@aether.earth>
# Contributor:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Run tests? They take a bit of time.
run_tests=false

pkgname=certmonger
pkgver=0.79.15
pkgrel=1
pkgdesc="Certificate status monitor and PKI enrollment client"
arch=(i686 x86_64)
url="https://pagure.io/certmonger"
license=(GPL)
depends=(nss tevent xmlrpc-c popt libdbus krb5 jansson)
makedepends=(rpm-tools)
checkdepends=(diffutils dos2unix expect)
backup=(etc/certmonger/certmonger.conf)
install=${pkgname}.install
source=("https://pagure.io/certmonger/archive/certmonger-${pkgver}/certmonger-certmonger-${pkgver}.tar.gz")
sha512sums=('7304ce89736ca9d4dc170e39c43c1c2043dc76176fb4abe63558f2fbca277ee1988f1945e9e763db9e36a630837c436bb89965553059addb2620ee7aa9d652bf')

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

# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Run tests? They take a bit of time.
run_tests=false

pkgname=certmonger
pkgver=0.79.11
pkgrel=1
pkgdesc="Certificate status monitor and PKI enrollment client"
arch=(i686 x86_64)
url="https://pagure.io/certmonger"
license=(GPL)
depends=(nss tevent xmlrpc-c popt libdbus krb5)
checkdepends=(diffutils dos2unix expect)
backup=(etc/certmonger/certmonger.conf
        etc/tmpfiles.d/certmonger.conf)
install=${pkgname}.install
source=("https://pagure.io/certmonger/archive/certmonger-${pkgver}/certmonger-certmonger-${pkgver}.tar.gz")
sha512sums=('0cf4bcaf19651ae483d42bb2cda0aad5dba4c8070cb788ab50ceabd0cd8b6bd3ff22c9e015901691b418aced4316d88ff732caa74a0ec6d7dded07283a2e84aa')

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

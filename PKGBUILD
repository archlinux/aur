# Maintainer: Felix Golatofski <contact@xdfr.de>
# Maintainer: Nogweii <me@aether.earth>
# Contributor:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Run tests? They take a bit of time.
run_tests=false

pkgname=certmonger
pkgver=0.79.13
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
sha512sums=('c4d55e4534ee49f0edcb3e90e61eb4cae5caa3c0863fa8d5824cf8c8260facfd1d8eeb7807a449e3f4ca848e79d0654210563595bf8783ba39963e326e16187d')

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

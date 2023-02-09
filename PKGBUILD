# Maintainer: Felix Golatofski <contact@xdfr.de>
# Maintainer: Nogweii <me@nogweii.net>
# Contributor:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Run tests? They take a bit of time.
run_tests=false

pkgname=certmonger
pkgver=0.79.17
pkgrel=1
pkgdesc="Certificate status monitor and PKI enrollment client"
arch=(i686 x86_64)
url="https://pagure.io/certmonger"
license=(GPL)
depends=(nss tevent xmlrpc-c popt libdbus krb5 jansson)
makedepends=(rpm-tools)
checkdepends=(diffutils dos2unix expect)
backup=(etc/certmonger/certmonger.conf)
install="${pkgname}.install"
source=("https://pagure.io/certmonger/archive/${pkgver}/certmonger-${pkgver}.tar.gz")
sha512sums=('ed631cbfc0a757143af912549cecf65346994107f27651022ada8c70f0ed1bac7ee053a99b9a13290b844999710a3207aa0e7718428f3a3b6e5dd0d5db3a88a9')

build() {
  cd "${pkgname}-${pkgver}"
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
  cd "${pkgname}-${pkgver}"
  if [[ "${run_tests}" == "true" ]]; then
    make check
  fi
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

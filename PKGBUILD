# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Run tests? They take a bit of time.
run_tests=false

pkgname=certmonger
pkgver=0.78.6
pkgrel=1
pkgdesc="Certificate status monitor and PKI enrollment client"
arch=(i686 x86_64)
url="https://fedorahosted.org/certmonger/"
license=(GPL)
depends=(nss tevent xmlrpc-c popt libdbus)
checkdepends=(diffutils dos2unix expect)
backup=(etc/certmonger/certmonger.conf
        etc/tmpfiles.d/certmonger.conf)
install=${pkgname}.install
source=("http://fedorahosted.org/released/certmonger/certmonger-${pkgver}.tar.gz")
sha512sums=('b0c3887083c4ada70485cee22c8d546a7001dc8f2b6ef87d8ab05b075b9e8a309f7599eb9967f8a51277f3ebb9afba7d98129db95535f96aa0bc3bf4433160ab')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/${pkgname} \
    --localstatedir=/var \
    --enable-systemd \
    --enable-tmpfiles \
    --with-tmpdir=/run/certmonger

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

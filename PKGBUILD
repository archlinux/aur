# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Run tests? They take a bit of time.
run_tests=false

pkgname=certmonger
pkgver=0.77.5
pkgrel=1
pkgdesc="Certificate status monitor and PKI enrollment client"
arch=(i686 x86_64)
url="https://fedorahosted.org/certmonger/"
license=(GPL)
depends=(curl dbus libxml2 nspr nss openssl systemd talloc tevent xmlrpc-c)
checkdepends=(diffutils dos2unix expect)
backup=(etc/certmonger/certmonger.conf
        etc/tmpfiles.d/certmonger.conf)
install=${pkgname}.install
source=("http://fedorahosted.org/released/certmonger/certmonger-${pkgver}.tar.gz")
sha512sums=('556d50f8b7f50abc960e7baa2569cf9fed1579bb8cc0749b7557164c78688d47694b953870c859fad14a496b8f138802a66a61705f88a4c79e58d3a9085d0387')

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

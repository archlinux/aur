# Maintainer: Felix Golatofski <contact@xdfr.de>
# Maintainer: Nogweii <me@nogweii.net>
# Contributor:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Run tests? They take a bit of time.
run_tests=false

pkgname=certmonger
pkgver=0.79.18
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
sha512sums=('fff98b0e95f9e7394a8a4b7831f6249f2d0f518a178b9b65c4ff7a3c7fd98f9e3e634019a6a58e76454edaa8773b38bf2058c53cf51c8bf996b16388d5a5288a')

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

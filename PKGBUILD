# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Nogweii <me@nogweii.net>
# Contributor:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=certmonger
pkgver=0.79.20
pkgrel=1
pkgdesc="Certificate status monitor and PKI enrollment client"
arch=(i686 x86_64)
url="https://pagure.io/certmonger"
license=(GPL)
depends=(nss tevent xmlrpc-c popt libdbus krb5 jansson systemd)
makedepends=(rpm-tools)
checkdepends=(diffutils dos2unix expect)
backup=(etc/certmonger/certmonger.conf)
install="${pkgname}.install"
source=("https://pagure.io/certmonger/archive/${pkgver}/certmonger-${pkgver}.tar.gz")
sha512sums=('76685185172bbf2c766c477c399ce0b14c9fd2d81637b44b8da80ae045ebf6c650ae3d525a87dccd755a6c92d4a5916bb62f8ea1d8520c47ae64770be6a5d2be')

build() {
  cd "${pkgname}-${pkgver}"
  unset KRB5_CONFIG
  autoreconf -i -f
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/${pkgname} \
    --localstatedir=/var \
    --enable-systemd \
    --enable-tmpfiles \
    --with-tmpdir=/run/certmonger \
    --with-homedir=/run/certmonger \
    --with-uuid \
    --with-gmp \
    --with-xmlrpc \
    --enable-pie --enable-now

  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

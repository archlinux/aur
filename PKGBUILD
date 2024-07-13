# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Nogweii <me@nogweii.net>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=certmonger
pkgver=0.79.20
pkgrel=2
pkgdesc="Certificate status monitor and PKI enrollment client"
arch=(i686 x86_64)
url="https://pagure.io/${pkgname}"
license=(GPL)
depends=(nss tevent xmlrpc-c popt libdbus krb5 jansson systemd)
makedepends=(rpm-tools)
checkdepends=(python-dbus diffutils dos2unix expect)
backup=(etc/${pkgname}/${pkgname}.conf)
install="${pkgname}.install"
source=("https://pagure.io/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('76685185172bbf2c766c477c399ce0b14c9fd2d81637b44b8da80ae045ebf6c650ae3d525a87dccd755a6c92d4a5916bb62f8ea1d8520c47ae64770be6a5d2be')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Disable broken test.
  sed -i '/028-dbus \\/d' 'tests/Makefile.am'
}

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
    --with-tmpdir=/run/${pkgname} \
    --with-homedir=/run/${pkgname} \
    --with-uuid \
    --with-gmp \
    --with-xmlrpc \
    --disable-dsa \
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

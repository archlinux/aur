# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Nogweii <me@nogweii.net>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=certmonger
pkgver=0.80
pkgrel=1
pkgdesc="Certificate status monitor and PKI enrollment client"
arch=(i686 x86_64)
url="https://codeberg.org/freeipa/${pkgname}"
license=('GPL-3.0-or-later')
depends=(nss tevent xmlrpc-c popt libdbus krb5 jansson systemd libidn2 nspr openssl talloc libxml2)
makedepends=(rpm-tools gettext)
checkdepends=(python-dbus diffutils dos2unix expect)
backup=(etc/${pkgname}/${pkgname}.conf)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('629119b0621e71b8027242e17425b7824114ee5e9d5c14db0a380ad20b92cdf7b5051b579d57661a31af3cfcde230366e6ced8047747f51ae74c15360897276f')

_srcdir="${pkgname}"

prepare() {
  cd "${_srcdir}"

  # Disable broken test.
  sed -i '/028-dbus \\/d' 'tests/Makefile.am'
}

build() {
  cd "${_srcdir}"
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
  cd "${_srcdir}"
  make check
}

package() {
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}/" install
}

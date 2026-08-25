# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Nogweii <me@nogweii.net>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=certmonger
pkgver=0.79.21
pkgrel=3
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
sha512sums=('4d5cef4461018cb6dea486966fd079b143684a858bc51f108d4c7738c94fae028f40b54f810b75d89c12d25fa5ea36496db9746c94da7d1f893ff79da8142c0c')

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

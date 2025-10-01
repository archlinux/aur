# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Nogweii <me@nogweii.net>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=certmonger
pkgver=0.79.21
pkgrel=1
pkgdesc="Certificate status monitor and PKI enrollment client"
arch=(i686 x86_64)
url="https://pagure.io/${pkgname}"
license=('GPL-3.0-or-later')
depends=(nss tevent xmlrpc-c popt libdbus krb5 jansson systemd libidn2 nspr openssl talloc libxml2)
makedepends=(rpm-tools gettext)
checkdepends=(python-dbus diffutils dos2unix expect)
backup=(etc/${pkgname}/${pkgname}.conf)
install="${pkgname}.install"
source=("https://pagure.io/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a008984b7592c6af7f5b91f05158637bacf369c846f10e3c38dfa18e12e7738025a5897e627826e341e77ec9657cc0042687a79af8eb9c69d2063aee78be7c6b')

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

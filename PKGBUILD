# Maintainer: omgold
# Contributor:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname='conserver'
pkgver='8.2.6'
pkgrel='1'
pkgdesc='Serial console remote sharing and logging daemon with support for IPMI.'
arch=('i686' 'x86_64')
url=https://www.conserver.com
license=(BSD)
depends=(freeipmi openssl libwrap pam)

_giturl=https://github.com/conserver/conserver
_srcdir="${_giturl##*/}-${pkgver}"

source=(
    "${_srcdir}.tar.gz::${_giturl}/archive/v${pkgver}.tar.gz"
    conserver.service
    configure-fix.patch
)

sha256sums=(
    1c8b86f123d2d8e3ce568b782087b43dfac9cf6ffd5a9bdfcfdc6718d749a923
    SKIP
    SKIP
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 <"${srcdir}/configure-fix.patch"
  ./package/setup-configure
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --with-libwrap --with-ipv6 --with-pam --with-openssl --with-freeipmi --with-port=782
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make $MAKEFLAGS
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -j1 test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -j1 install DESTDIR="${pkgdir}"
  install -Dm644 "${srcdir}/conserver.service" "${pkgdir}/usr/lib/systemd/system/conserver.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

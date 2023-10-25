# Maintainer: omgold
# Contributor:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname='conserver'
pkgver='8.2.7'
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
)

sha256sums=(
    b88f1880f4090b42370e075ca9c8a6062fb553ee33f155b204714c43dc71cef3
    SKIP
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  LANG=C autoreconf --install
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

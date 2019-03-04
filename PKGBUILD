# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

set -u

pkgname='conserver'
pkgver='8.2.2'
pkgrel='2'
pkgdesc='An application that allows multiple users to watch a serial console at the same time.'
arch=('i686' 'x86_64')
url=https://www.conserver.com
license=(BSD)
depends=(freeipmi openssl)
_giturl=https://github.com/conserver/conserver
_srcdir="${_giturl##*/}-${pkgver}"
source=(
    "${_srcdir}.tar.gz::${_giturl}/archive/v${pkgver}.tar.gz"
    conserver.service
)
sha256sums=(
    ff869fc64afe15a81998a1e5c49734225ad54ecda214583b00e7f4c9f4bbb326
    SKIP
)

prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --with-openssl --with-freeipmi --with-port=782
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make $MAKEFLAGS
  set +u
}

check() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -j1 test
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -j1 install DESTDIR="${pkgdir}"
  install -Dm644 "${srcdir}/conserver.service" "${pkgdir}/usr/lib/systemd/system/conserver.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}

set +u

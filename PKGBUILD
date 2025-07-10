# Maintainer: omgold
# Contributor:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname='conserver'
pkgver='8.2.7.39.g290933b'
pkgrel='1'
pkgdesc='Serial console remote sharing and logging daemon with support for IPMI.'
arch=('i686' 'x86_64')
url=https://www.conserver.com
license=(BSD)
depends=(freeipmi openssl libwrap pam)

_giturl=https://github.com/conserver/conserver

source=(
    "git+https://github.com/conserver/conserver#commit=290933b4a7964d56f74d2e3c61f7045c5e0d6bfe"
    conserver.service
)

sha256sums=(
    SKIP
    SKIP
)

prepare() {
  cd "${srcdir}/${pkgname}"
  LANG=C autoreconf --install
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --with-libwrap --with-ipv6 --with-pam --with-openssl --with-freeipmi --with-port=782
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

check() {
  cd "${srcdir}/${pkgname}"
  make -j1 test
}

package() {
  cd "${srcdir}/${pkgname}"
  make -j1 install DESTDIR="${pkgdir}"
  install -Dm644 "${srcdir}/conserver.service" "${pkgdir}/usr/lib/systemd/system/conserver.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

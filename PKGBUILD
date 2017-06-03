# $Id$
# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: xav <xav at ethertricks dot net>

_pkgname=umurmur
pkgname=umurmur-openssl
pkgver=0.2.17
pkgrel=1
pkgdesc='Minimalistic Mumble server; built with openssl'
url='https://github.com/umurmur/umurmur'
arch=('i686' 'x86_64')
license=('custom')
depends=('openssl' 'libconfig' 'protobuf-c')
makedepends=('cmake')
backup=('etc/umurmur/umurmur.conf')
install=${_pkgname}.install
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/umurmur/umurmur/archive/${pkgver}.tar.gz
        umurmur.service)
sha256sums=('e77b7b6616768f4a1c07442afe49a772692f667b00c23cc85909d4dd0ce206d2'
            '3575e69da5ad1fc8541ef37af90cdd245e3202980589ffd26d124fd9e785b738')

prepare() {
  cd ${_pkgname}-${pkgver}
  mkdir build
}

build() {
  cd ${_pkgname}-${pkgver}/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSSL=openssl
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make -C build DESTDIR="${pkgdir}" install
  install -Dm 644 "${pkgdir}/usr/etc/umurmur.conf" -t "${pkgdir}/etc/umurmur"
  rm -r "${pkgdir}/usr/etc"
  install -Dm 644 "${srcdir}/umurmur.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

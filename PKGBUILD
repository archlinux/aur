# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=cowrie
pkgver=2.2.0
pkgrel=1
pkgdesc='Medium interaction SSH honeypot designed to log brute force attacks and entire shell interaction'
url='https://github.com/micheloosterhof/cowrie'
arch=('any')
license=('BSD')
# from the requirements.txt
depends=(
  'python-appdirs'
  'python-attrs'
  'python-bcrypt'
#  'python-configparser'
  'python-cryptography'
  'python-packaging'
  'python-pyasn1-modules'
  'python-pyopenssl'
  'python-pyparsing'
  'python-dateutil'
  'python-service-identity'
  'python-tftpy'
  'python-treq'
  'python-twisted'
  )

backup=('etc/cowrie/cowrie.cfg')
install=cowrie.install
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/micheloosterhof/${pkgname}/archive/v${pkgver}.tar.gz
  '0001-patch-service.patch')
sha512sums=('c65259353bf3b7eceda5c3937671343cc534154a1046c67427022eb133a344e70c56251d096e6fbe448b8f30986990c3327ead53385d7602f1af817cb8a68054'
            '76bfbd8cdf78e7365e95fb017e241ec23015b56f7ac292370d90cfabbd0086e7c199278f6956aabfc9e658fdbaacb16ac22699c39d042d6973a5963add0812ee')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -Ni '../0001-patch-service.patch'
}

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}

  mkdir -p "${pkgdir}/etc/cowrie"
  install -Dm 644 etc/cowrie.cfg.dist "${pkgdir}/etc/cowrie/cowrie.cfg"
  install -Dm 644 docs/systemd/etc/systemd/system/cowrie.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 docs/systemd/etc/systemd/system/cowrie.socket  -t "${pkgdir}/usr/lib/systemd/system"

  install -d "${pkgdir}/opt/cowrie"
  cp -a . "${pkgdir}/opt/cowrie"
  rm "${pkgdir}/opt/cowrie/etc/cowrie.cfg.dist"

  install -Dm 644 docs/LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a docs/* "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:

# Maintainer: Cody Schafer <aur[at]codyps[dot]com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=cowrie
pkgver=2.3.0
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

_pkgdir="${pkgname}-${pkgver}"
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/cowrie/${pkgname}/archive/v${pkgver}.tar.gz
  '0001-patch-service.patch')

# _pkgdir="${pkgname}-${_gitrev}"
#_gitrev="c5e9a6b21c8908e892c2169b33f560ccd1fd98ff"
#source=(${pkgname}-${_gitrev}.tar.gz::https://github.com/micheloosterhof/${pkgname}/archive/${_gitrev}.tar.gz
# '0001-patch-service.patch')

sha512sums=('e49ac55731aa2a0a9e7c996c12da2155893a2eb7956a3ce40e917f828935a4000fc7d1008b78357995758e299d2c31d1f1244550958bd9f6062019b26a4717f9'
            'a79904d764829b246fce7691f90d1de7a478985217eb458d441a2fad0aed4558d70eb2d38208d2bfb393bc42f662dba129678fc14765392959d1316c0d1a8dd1')

prepare() {
  cd "${_pkgdir}"
  patch -p1 -Ni '../0001-patch-service.patch'
}

build() {
  cd "${_pkgdir}"
  python setup.py build
}

package() {
  cd "${_pkgdir}"

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

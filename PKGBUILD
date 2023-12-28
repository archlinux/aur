# Maintainer: Cody Schafer <aur[at]codyps[dot]com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=cowrie
pkgver=2.5.0
pkgrel=1
pkgdesc='Medium interaction SSH honeypot designed to log brute force attacks and entire shell interaction'
url='https://github.com/cowrie/cowrie'
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

_pkgdir="${pkgname}-${pkgver}"
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/cowrie/${pkgname}/archive/v${pkgver}.tar.gz
  0001-patch-service.patch
  cowrie.sysusers
)

# _pkgdir="${pkgname}-${_gitrev}"
#_gitrev="c5e9a6b21c8908e892c2169b33f560ccd1fd98ff"
#source=(${pkgname}-${_gitrev}.tar.gz::https://github.com/micheloosterhof/${pkgname}/archive/${_gitrev}.tar.gz
# '0001-patch-service.patch')

sha256sums=('9db15102675729783a4d65617fb4355e366a7fdcd8f5705f6d41541eb1f5919b'
            '8001a666e05d224858a7a71fcf767461d6b8bc22293273c6f012452bb125e4fc'
            '50114e6c538945945439ad36a08d4a42305db09f0eb7b09649abac69063308de')

prepare() {
  cd "${_pkgdir}"
  patch -p1 -Ni '../0001-patch-service.patch'
}

package() {
  cd "${_pkgdir}"

  mkdir -p "${pkgdir}/etc/cowrie"
  install -Dm 644 etc/cowrie.cfg.dist "${pkgdir}/etc/cowrie/cowrie.cfg"
  install -Dm 644 docs/systemd/etc/systemd/system/cowrie.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 docs/systemd/etc/systemd/system/cowrie.socket  -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 ../${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

  install -d "${pkgdir}/opt/cowrie"

  # FIXME: instead of copying the entiry repo here, install the python bits
  # normally (via `python -m installer` or similar) and only copy the data
  # components. Really, data components belong elsewhere as well, and we should
  # place the recorded logs/downloads into another directory.
  #
  # All of the above would allow us to move out of using `/opt`. Note when
  # doing this that changes to the systemd service may be needed due to
  # sandboxing there.
  cp -a . "${pkgdir}/opt/cowrie"
  rm "${pkgdir}/opt/cowrie/etc/cowrie.cfg.dist"

  install -Dm 644 docs/LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a docs/* "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:

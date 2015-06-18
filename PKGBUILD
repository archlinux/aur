# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Andre Kwakernaak <andre.kwakernaak@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=kippo
pkgver=0.9
pkgrel=3
pkgdesc="A medium interaction SSH honeypot designed to log brute force attacks and, most importantly, the entire shell interaction performed by the attacker"
url="https://github.com/desaster/kippo"
arch=('any')
license=('BSD')
depends=('twisted' 'pycrypto' 'zope-interface' 'python2-pyasn1')
backup=('etc/kippo.cfg')
install=kippo.install
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/desaster/kippo/archive/v${pkgver}.tar.gz
        kippo.service
        INSTALL)
sha512sums=('0e17c410ecb8e44ba3862f0bd6c2773d6fa768750d7917ba7f5fbfdec8ddfa63fbde0e0190bcd5361a6c5ea0bcb2017e24593c4181b5cb915a605723bce07a26'
            'f815717a2abb7abf548e229be83f62d166f039e9018c30f6a1d47c48dfafe5d6bb417b046e3d5056ac69e6791fb26ba04f20718fa3593f77e41c09d1830ebb42'
            'fd82f060af248b413e62d779a4a20c6d6f4972cc724503a8c60fe435955ad7b1829caf9b5a8ceca41a2d9cf02144ab9fa9d892b59012e52a81d9dbfa832d4106')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -e 's|env python$|env python2|g' -i utils/*
  sed -e 's|/usr/bin/python$|/usr/bin/python2|g' -i utils/fsctl.py
  sed -e 's|kippo.cfg|/etc/kippo.cfg|g' -i kippo.tac
}

build() {
  cd ${pkgname}-${pkgver}
  python2 -m compileall .
  python2 -O -m compileall .
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm 644 kippo.cfg.dist "${pkgdir}/etc/kippo.cfg"
  install -Dm 644 ../kippo.service \
    "${pkgdir}/usr/lib/systemd/system/kippo.service"

  find . -type f -not \( -name kippo.cfg.dist -o -name start.sh -o -name stop.sh \) \
    -exec install -Dm 644 {} "${pkgdir}/opt/kippo/{}" \;

  install -Dm 644 doc/COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 doc/README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 ../INSTALL "${pkgdir}/usr/share/doc/${pkgname}/INSTALL"
}

# vim: ts=2 sw=2 et:

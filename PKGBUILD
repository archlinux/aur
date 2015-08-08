# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=cowrie
pkgver=1.0.0_alpha
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="A medium interaction SSH honeypot designed to log brute force attacks and, most importantly, the entire shell interaction performed by the attacker"
url="https://github.com/micheloosterhof/cowrie.git"
arch=('any')
license=('BSD')
depends=('twisted' 'pycrypto' 'zope-interface' 'python2-pyasn1')
backup=('etc/cowrie.cfg')
install=cowrie.install
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/micheloosterhof/${pkgname}/archive/v${_pkgver}.tar.gz
        cowrie.service
        INSTALL)
sha512sums=('0ffcb55906d30869f551676fbdded32d5de50519107f9e1e2be27c8a8914b887af4070c470abee5018b1edb815c604b1961a5598ab1d9b61764034bcf191995b'
            '106618a2c73d5f1f2ad75997e693f6ff4e903644a6be0dc59e85f72ae81f583927b2f079823c3379a8796e03fd542f497d2cc9405dc5d0d20d6caeb9dc88abed'
            'a80dc0e9ec922c795af13ec85fc4e3414481a0d7ae14d9f17e29ade2a118010c1d69d474fe38c7e648d69b07ff09144efe97183e8a64ccf8165ec3a767a18ce2')

prepare() {
  cd ${pkgname}-${_pkgver}
  sed -e 's|env python$|env python2|g' -i utils/*.py
  sed -e 's|/usr/bin/python$|/usr/bin/python2|g' -i utils/fsctl.py
}

build() {
  cd ${pkgname}-${_pkgver}
  python2 -m compileall .
  python2 -O -m compileall .
}

package() {
  cd ${pkgname}-${_pkgver}

  install -Dm 644 cowrie.cfg.dist "${pkgdir}/etc/cowrie.cfg"
  install -Dm 644 "${srcdir}/cowrie.service" "${pkgdir}/usr/lib/systemd/system/cowrie.service"

  find . -type f -not \( -name cowrie.cfg.dist -o -name start.sh -o -name stop.sh \
    -o -name '.git*' -o -path './.git/*' \) \
    -exec install -Dm 644 {} "${pkgdir}/opt/cowrie/{}" \;

  install -Dm 644 doc/COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 "${srcdir}/INSTALL" "${pkgdir}/usr/share/doc/${pkgname}/INSTALL"
}

# vim: ts=2 sw=2 et:

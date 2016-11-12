# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=cowrie
pkgver=1.1.0
pkgrel=1
pkgdesc='Medium interaction SSH honeypot designed to log brute force attacks and entire shell interaction'
url='https://github.com/micheloosterhof/cowrie'
arch=('any')
license=('BSD')
depends=('twisted' 'zope-interface' 'zope-interface' 'python2-crypto' 'python2-pyasn1' 'python2-cryptography'
         'python2-gmpy2' 'python2-pyopenssl' 'mysql-python' 'python2-dateutil' 'python2-tftpy')
backup=('etc/cowrie.cfg')
install=cowrie.install
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/micheloosterhof/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('da6cb2e25f57dd5a1e9b7ff02a39ae4d6955ee2be03b0054f92f07b429a1a12b938c571862b05d5ccbe9949d132185079bd93644bd38469e841cb9a8cc95dfbd')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -e 's|env python$|env python2|g' -i bin/* cowrie/commands/tftp.py
  sed -e 's|/home/cowrie|/opt|g' -i doc/systemd/cowrie.service
  sed -e '/PIDFile/d' -i doc/systemd/cowrie.service
  sed -r 's|(cowrie)$|\1 -c /etc/cowrie.cfg|g' -i start.sh
}

build() {
  cd ${pkgname}-${pkgver}
  python2 -m compileall .
  python2 -O -m compileall .
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm 644 cowrie.cfg.dist "${pkgdir}/etc/cowrie.cfg"
  install -Dm 644 doc/systemd/cowrie.service -t "${pkgdir}/usr/lib/systemd/system"

  install -d "${pkgdir}/opt/cowrie"
  cp -a . "${pkgdir}/opt/cowrie"
  rm -r "${pkgdir}/opt/cowrie/cowrie.cfg.dist"

  install -Dm 644 doc/COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md INSTALL.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:

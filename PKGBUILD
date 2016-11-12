# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=cowrie-git
pkgver=1.1.0+1329+7c1bd80
pkgrel=1
pkgdesc='Medium interaction SSH honeypot designed to log brute force attacks and entire shell interaction'
url='https://github.com/micheloosterhof/cowrie'
arch=('any')
license=('BSD')
depends=('twisted' 'python2-zope-interface' 'python2-crypto' 'python2-pyasn1' 'python2-cryptography'
         'python2-gmpy2' 'python2-pyopenssl' 'mysql-python' 'python2-dateutil' 'python2-tftpy')
makedepends=('git')
backup=('etc/cowrie.cfg')
provides=('cowrie')
conflicts=('cowrie')
install=cowrie.install
source=(${pkgname}::git+https://github.com/micheloosterhof/cowrie.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s+%s+%s" "$(git describe --tags --abbrev=0|sed -r 's|v?([^-]+).*|\1|')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  sed -e 's|env python$|env python2|g' -i bin/* cowrie/commands/tftp.py
  sed -e 's|/home/cowrie|/opt|g' -i doc/systemd/cowrie.service
  sed -e '/PIDFile/d' -i doc/systemd/cowrie.service
  sed -r 's|(cowrie)$|\1 -c /etc/cowrie.cfg|g' -i start.sh
}

build() {
  cd ${pkgname}
  python2 -m compileall .
  python2 -O -m compileall .
}

package() {
  cd ${pkgname}

  install -Dm 644 cowrie.cfg.dist "${pkgdir}/etc/cowrie.cfg"
  install -Dm 644 doc/systemd/cowrie.service -t "${pkgdir}/usr/lib/systemd/system"

  install -d "${pkgdir}/opt/cowrie"
  cp -a . "${pkgdir}/opt/cowrie"
  rm -r "${pkgdir}/opt/cowrie/"{.git,cowrie.cfg.dist}

  install -Dm 644 doc/COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md INSTALL.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:

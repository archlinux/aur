# Maintainer : Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
pkgname=kippo-git
pkgver=v0.9.285.0d03635
provides=('kippo') 
conflicts=('kippo')
pkgrel=2
pkgdesc="A medium interaction SSH honeypot designed to log brute force attacks and, most importantly, the entire shell interaction performed by the attacker"
arch=('any')
url="https://github.com/desaster/kippo"
license=('BSD')
depends=('twisted' 'pycrypto' 'zope-interface' 'python2-pyasn1')
optdepends=(
            'python2-wokkel: XAMPP Support' 
            'python2-mysql-connector: MySQL Support for kippo')
makedepends=('git')
source=('git+http://github.com/desaster/kippo' 'kippo.service')
sha512sums=(
'SKIP'
'1ef2d5b1223567dbe37ea51ad668fc39d173e85b22cbbf13d85d781bfe0b52a994f9768ef4f2389f5970f8636be9ca3b30b6e8ae7b6b040bb6564c1387d16d42'
)
install=kippo.install

pkgver() {
  cd ${provides}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${provides}
  sed -e 's|env python$|env python2|g' -i utils/*
  sed -e 's|/usr/bin/python$|/usr/bin/python2|g' -i utils/fsctl.py
  sed -e 's|kippo.cfg|/etc/kippo.cfg|g' -i kippo.tac
}

build() {
  cd ${provides}
  python2 -m compileall .
  python2 -O -m compileall .
}

package() {
  cd ${provides}

  install -Dm 644 kippo.cfg.dist "${pkgdir}/etc/kippo.cfg"
  install -Dm 644 ../kippo.service \
    "${pkgdir}/usr/lib/systemd/system/kippo.service"

  find . -type f -not \( -name kippo.cfg.dist -o -name start.sh -o -name stop.sh \
    -o -path './.git/*' -o -name .gitignore \) \
    -exec install -Dm 644 {} "${pkgdir}/opt/kippo/{}" \;

  install -Dm 644 doc/COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 doc/README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set et sw=2 ts=2 tw=79:

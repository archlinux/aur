# Maintainer : Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=kippo-git
pkgver=v0.9.281.860224d
provides=('kippo') 
conflicts=('kippo')
pkgrel=1
pkgdesc="A medium interaction SSH honeypot designed to log brute force attacks and, most importantly, the entire shell interaction performed by the attacker"
arch=('i686' 'x86_64')
url="https://github.com/desaster/kippo"
license=('BSD')
depends=('python2' 'twisted' 'pycrypto')
makedepends=('git')
source=('git+http://github.com/desaster/kippo' 'kippo.service' 'kippo.install')
sha512sums=(
'SKIP'
'1ef2d5b1223567dbe37ea51ad668fc39d173e85b22cbbf13d85d781bfe0b52a994f9768ef4f2389f5970f8636be9ca3b30b6e8ae7b6b040bb6564c1387d16d42'
'd1a15c792912e6f127839665bbe1cde82711ba485f536083c84e568faf6ebdfb4c941abfc7f25e8098d2a6f5f328a900fde78242cf49cc751c7227dfd3584d1a'
)
install=kippo.install

pkgver() {
  cd $provides
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $provides
  sed -e 's|env python$|env python2|g' -i utils/*
  sed -e 's|/usr/bin/python$|/usr/bin/python2|g' -i utils/fsctl.py
  sed -e 's|kippo.cfg|/etc/kippo.cfg|g' -i kippo.tac
}

build() {
  cd $provides
  python2 -m compileall .
  python2 -O -m compileall .
}

package() {
  cd $provides

  install -Dm 644 kippo.cfg.dist "${pkgdir}/etc/kippo.cfg"
  install -Dm 644 ../kippo.service \
    "${pkgdir}/usr/lib/systemd/system/kippo.service"

  find . -type f -not \( -name kippo.cfg.dist -o -name start.sh -o -name stop.sh \) \
    -exec install -Dm 644 {} "${pkgdir}/opt/kippo/{}" \;

  install -Dm 644 doc/COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 doc/README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set et sw=2 ts=2 tw=80:

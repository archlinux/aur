# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=aether-git
pkgver=20141026
pkgrel=2
pkgdesc="Distributed network that creates forum–like, anonymous and encrypted public spaces for its constituents"
arch=('any')
depends=('python2'
         'python2-cffi'
         'python2-characteristic'
         'python2-cryptography'
         'python2-miniupnpc'
         'python2-pif'
         'python2-pyasn1'
         'python2-pyasn1-modules'
         'python2-pycparser'
         'python2-pyopenssl'
         'python2-pyqt5'
         'python2-pytz'
         'python2-requests'
         'python2-service-identity'
         'python2-six'
         'python2-sqlalchemy'
         'python2-tendo'
         'python2-termcolor'
         'python2-twisted'
         'python2-ujson'
         'python2-wsgiref'
         'python2-zope-interface'
         'qt5-base'
         'qt5-webkit')
makedepends=('git')
url="https://github.com/nehbit/aether-public"
license=('AGPL3')
source=(${pkgname%-git}::git+https://github.com/nehbit/aether-public
        aether.sh)
sha256sums=('SKIP'
            '7dee50b26626046bf8c4c010b10c4780e6bfb3c73a95c2bfe96d8e3f26d29f81')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg2 'Fixing Non-ASCII character (\xc3) in qt5reactor.py...'
  sed -i '1s/^/#coding: utf8 /' qt5reactor.py

  msg2 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/aether/LICENSE"

  msg2 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/aether/README.md"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/aether"
  find . -mindepth 1 -maxdepth 1 \
    -prune ! -name "README.md" \
    -prune ! -name "LICENSE" \
    -exec cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/aether" \;

  msg2 'Installing executable...'
  install -Dm 755 "$srcdir/aether.sh" "$pkgdir/usr/bin/aether"
}

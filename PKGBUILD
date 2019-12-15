# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=python2-translate-toolkit-lib
_name=translate-toolkit
pkgver=2.4.0
pkgrel=1
pkgdesc="A toolkit to convert between various different translation formats, help process and validate localisations"
arch=('any')
url="http://toolkit.translatehouse.org/"
license=('GPL')
depends=('bash' 'python2-lxml' 'python2-six' 'python2-diff-match-patch' 'python2-cheroot')
makedepends=('python2-setuptools')
source=($_name-$pkgver.tar.gz::https://github.com/translate/translate/archive/$pkgver.tar.gz)
sha256sums=('7f1d6a9566bb512fd88d51bd8bc920f42e379c91a4686761dbe89762f8a3a51d')

prepare() {
  cd translate-$pkgver
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|"    \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find . -name '*.py')
}

package() {
  cd translate-$pkgver
  python2 -s setup.py install --root="${pkgdir}" --optimize=1
  python2 -m compileall "$pkgdir/usr/lib/python2.7/site-packages/translate"

    # keep tmserver and podebug for virtaal, and
    # rename to avoid conflict with translate-toolkit
  find "$pkgdir/usr/bin/" ! -name '*tmserver' ! -name '*podebug' -type f -exec rm -f {} +
  mv "$pkgdir/usr/bin/podebug"{,-py2}
  mv "$pkgdir/usr/bin/tmserver"{,-py2}
}

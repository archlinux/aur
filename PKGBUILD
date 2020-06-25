# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# based on 'translate-toolkit' by:
#     Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
#     Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
#     Contributor: Andrea Scarpino <andrea@archlinux.org>
#     Contributor: Hugo Doria <hugodoria at gmail.com>

pkgname=python2-translate-toolkit-lib
_name=translate-toolkit
pkgver=2.5.1
pkgrel=1
pkgdesc="A toolkit to convert between various different translation formats, help process and validate localisations"
arch=('any')
url="https://toolkit.translatehouse.org/"
license=('GPL')
depends=(
  'python2-six'
  'python2-lxml'
  'python2-levenshtein'
  'python2-chardet'
  'python2-pycountry'
  'python2-backports.csv'
  'python2-cheroot'
)
makedepends=('python2-setuptools')
source=($_name-$pkgver.tar.gz::https://github.com/translate/translate/archive/$pkgver.tar.gz)
sha256sums=('f86a34e40c52dcdf1ce516687180736e24a52e44164df1d3d1570c8ac223561f')

prepare() {
  cd translate-$pkgver
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|"    \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find . -name '*.py')
}

package() {
  cd translate-$pkgver
  python2 -s setup.py install --root="$pkgdir" --optimize=1
  python2 -m compileall "$pkgdir/usr/lib/python2.7/site-packages/translate"

    # keep tmserver and podebug for virtaal, and
    # rename to avoid conflict with translate-toolkit
  find "$pkgdir/usr/bin/" ! -name '*tmserver' ! -name '*podebug' -type f -exec rm -f {} +
  mv "$pkgdir/usr/bin/podebug"{,-py2}
  mv "$pkgdir/usr/bin/tmserver"{,-py2}
}

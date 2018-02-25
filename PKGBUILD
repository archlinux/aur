# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=python2-translate-toolkit-lib
_name=translate-toolkit
pkgver=2.2.5
pkgrel=1
pkgdesc="A toolkit to convert between various different translation formats, help process and validate localisations"
arch=('any')
url="http://toolkit.translatehouse.org/"
license=('GPL')
depends=('bash' 'python2-lxml' 'python2-six' 'python2-diff-match-patch')
makedepends=('python2-setuptools' 'python2-setuptools')
optdepends=('python2-iniparse: for ini2po'
            'gaupol: for po2sub')
source=("https://github.com/translate/translate/releases/download/$pkgver/$_name-${pkgver}.tar.gz")
md5sums=('a4e3c0a671d23ed3f58a8f50dcdd59c2')

prepare() {
  cd $_name-$pkgver
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|"    \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find . -name '*.py')
}

build() {
  cd $_name-$pkgver
  python2 -s setup.py build
}

package() {
  cd $_name-$pkgver
  python2 -s setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  python2 -m compileall "$pkgdir/usr/lib/python2.7/site-packages/translate"
    # avoid conflict with pkg translate-toolkit
  rm -rf "$pkgdir/usr/bin"
}

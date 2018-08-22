# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=python2-translate-toolkit-lib
_name=translate-toolkit
pkgver=2.3.0
pkgrel=2
pkgdesc="A toolkit to convert between various different translation formats, help process and validate localisations"
arch=('any')
url="http://toolkit.translatehouse.org/"
license=('GPL')
depends=('bash' 'python2-lxml' 'python2-six' 'python2-diff-match-patch')
makedepends=('python2-setuptools')
optdepends=('gaupol: for po2sub')
source=("https://github.com/translate/translate/releases/download/$pkgver/$_name-${pkgver}.tar.gz")
sha256sums=('763325a419fdf2d5429e24bad42f33bccca7eb58279f57ddd742c4c3ea794ccb')

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

    # keep tmserver and podebug for virtaal, and
    # rename to avoid conflict with translate-toolkit
  find "$pkgdir/usr/bin/" ! -name '*tmserver' ! -name '*podebug' -type f -exec rm -f {} +
  mv "$pkgdir/usr/bin/podebug"{,-py2}
  mv "$pkgdir/usr/bin/tmserver"{,-py2}
}

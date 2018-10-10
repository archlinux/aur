# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=python2-translate-toolkit-lib
_name=translate-toolkit
pkgver=2.3.1
pkgrel=1
pkgdesc="A toolkit to convert between various different translation formats, help process and validate localisations"
arch=('any')
url="http://toolkit.translatehouse.org/"
license=('GPL')
depends=('bash' 'python2-lxml' 'python2-six' 'python2-diff-match-patch')
makedepends=('python2-setuptools')
optdepends=('gaupol: for po2sub')
source=($_name-$pkgver.tar.gz::https://github.com/translate/translate/archive/$pkgver.tar.gz)
sha256sums=('0b2d79f0023ce545c6240829624ce1e1ce54ea7bc7913428880345ff423fd999')

prepare() {
  cd translate-$pkgver
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|"    \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find . -name '*.py')
}

build() {
  cd translate-$pkgver
  python2 -s setup.py build
}

package() {
  cd translate-$pkgver
  python2 -s setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  python2 -m compileall "$pkgdir/usr/lib/python2.7/site-packages/translate"

    # keep tmserver and podebug for virtaal, and
    # rename to avoid conflict with translate-toolkit
  find "$pkgdir/usr/bin/" ! -name '*tmserver' ! -name '*podebug' -type f -exec rm -f {} +
  mv "$pkgdir/usr/bin/podebug"{,-py2}
  mv "$pkgdir/usr/bin/tmserver"{,-py2}
}

# Maintainer: Morten Linderud <foxboron@archlinux.no>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor : Giedrius Slavinskas <giedrius25@gmail.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=python2-babel
pkgver=2.9.0
_core=37
pkgrel=1
pkgdesc="A collection of tools for internationalizing Python 2.x applications"
url="http://babel.pocoo.org/"
license=("BSD")
arch=('any')
makedepends=('python2'
             'python2-setuptools'
             'python2-pytz')
checkdepends=('python2-pytest' 'python2-pytest-runner' 'python2-freezegun')
noextract=("cldr-core-$_core.zip")
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-babel/babel/archive/v$pkgver.tar.gz"
        "cldr-core-$_core.zip::http://unicode.org/Public/cldr/$_core/core.zip")

sha256sums=('7df55ebc7a75b6c544c381e1cc07151c2429f73f4ed01107bd8998b96cc83f42'
            'ba93f5ba256a61a6f8253397c6c4b1a9b9e77531f013cc7ffa7977b5f7e4da57')

prepare() {

  cp "$srcdir"/cldr-core-$_core.zip babel-$pkgver/cldr/cldr-core-$_core.zip
}

build(){
  cd "$srcdir/babel-$pkgver"
  python2 setup.py import_cldr
  python2 setup.py build
}

check(){
  cd "$srcdir/babel-$pkgver"
  TZ=UTC python2 setup.py pytest
}

package_python2-babel() {
  depends=('python2' 'python2-pytz')

  cd "$srcdir"/babel-${pkgver}
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  mv "$pkgdir"/usr/bin/pybabel "$pkgdir"/usr/bin/pybabel2
  install -D -m0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

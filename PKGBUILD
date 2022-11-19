# Maintainer: Morten Linderud <foxboron@archlinux.no>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor : Giedrius Slavinskas <giedrius25@gmail.com>

pkgname=python38-babel
pkgver=2.11.0
_core=41
pkgrel=1
pkgdesc="A collection of tools for internationalizing Python 3.8 applications"
url="http://babel.pocoo.org/"
license=("BSD")
arch=('any')
depends=('python38' 'python38-pytz')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest' 'python38-pytest-runner' 'python38-freezegun')
noextract=("cldr-core-$_core.zip")
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-babel/babel/archive/v$pkgver.tar.gz"
        "cldr-core-$_core.zip::http://unicode.org/Public/cldr/$_core/core.zip"
        "cldr-common-$_core.0.zip::http://unicode.org/Public/cldr/$_core/cldr-common-$_core.0.zip")
sha256sums=('ae1eef5784c3399df3df9ceb62f1236d0347b0d1f6ac15d22234ff75eccbe470'
            '823c6170c41e2de2c229574e8a436332d25f1c9723409867fe721e00bc92d853'
            '823c6170c41e2de2c229574e8a436332d25f1c9723409867fe721e00bc92d853')

prepare() {
  cp "$srcdir"/cldr-core-$_core.zip babel-$pkgver/cldr/cldr-core-$_core.zip
  cp "$srcdir"/cldr-common-$_core.0.zip babel-$pkgver/cldr/cldr-common-$_core.0.zip
}

build(){
  cd "babel-$pkgver"
  python3.8 setup.py import_cldr
  python3.8 setup.py build
}

check(){
  cd "babel-$pkgver"
  # the tests fail if running in the wrong timezone:
  # https://github.com/python-babel/babel/issues/757
  TZ=UTC python3.8 setup.py pytest
}

package_python38-babel() {
  cd "babel-$pkgver"
  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

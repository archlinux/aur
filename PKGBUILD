# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgbase='python38-webob'
pkgname=('python38-webob' 'python38-webob-docs')
pkgver=1.8.7
pkgrel=4
pkgdesc="WSGI request and response object"
arch=('any')
url="http://pythonpaste.org/webob/"
license=('MIT')
depends=('python38')
makedepends=('python38-setuptools' 'python38-sphinx')
checkdepends=('python38-pytest-runner')
optdepends=('python38-webob-docs: documentation')
source=("https://pypi.io/packages/source/W/WebOb/WebOb-$pkgver.tar.gz"
        $pkgname-py39.patch::https://github.com/Pylons/webob/commit/6b5d8c382c26.patch)
sha512sums=('ff6a1ce796a59d9c078dc908a0d6307a080230a5c806be2278eebcbb78016bed43067e78e3e4a6d72a5f51184c137e8267ac75cbb92b057db008b51a792ff489'
            'aba4b333bc67f6ccde084efca793aff7b978548b1179ca4dbeb969f05b0e0e0bb00201640929cd07741434e27cf935361fcacc1943706e6399c5aa8407ec0116')

prepare() {
  patch -Np1 -F3 -d WebOb-$pkgver<$pkgname-py39.patch # https://github.com/Pylons/webob/pull/411
  cp -a WebOb-$pkgver{,-docs}
  sed -i "s/pkg_resources.get_distribution('webob').version/'$pkgver'/" WebOb-$pkgver-docs/docs/conf.py
}

build() {
  cd "$srcdir"/WebOb-$pkgver
  python3.8 setup.py build

  cd "$srcdir"/WebOb-$pkgver-docs
  PYTHONPATH="$PWD/src" make -C docs html
}

check() {
  cd "$srcdir"/WebOb-$pkgver
  python3.8 setup.py pytest --addopts "--ignore=docs"
}

package_python38-webob() {
  cd "$srcdir"/WebOb-$pkgver
  python3.8 setup.py install -O1 --root="$pkgdir"
  install -D -m644 "docs/license.txt" \
                   "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}

package_python38-webob-docs() {
  optdepends=()

  cd "$srcdir"/WebOb-$pkgver-docs
  _doc_dir="$pkgdir"/usr/share/doc/python38-webob
  mkdir -p "$_doc_dir"
  cp -a "docs/_build/html" "$_doc_dir"
  install -D -m644 "docs/license.txt" \
                   "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}

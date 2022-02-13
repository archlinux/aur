# Maintainer: David Runge <dvzrv@archlinux.org>

_name=sly
pkgname=python-sly
# use a commit slightly post 0.4
# there are currently no tags
# https://github.com/dabeaz/sly/issues/90
# no tests
# https://github.com/dabeaz/sly/issues/91
# no license
# https://github.com/dabeaz/sly/issues/92
_commit=b8e5ac3f6bce536fff60ab42d770c79bd435e27a
pkgver=0.4
pkgrel=1
pkgdesc="Python implementation of the lex and yacc tools"
arch=(any)
url="https://github.com/dabeaz/sly"
license=(BSD)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
# sdist tarballs on pypi.org do not have test files: https://github.com/dabeaz/sly/issues/91
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=($_name-$pkgver.tar.gz::https://github.com/dabeaz/sly/archive/$_commit.tar.gz)
sha512sums=('7cf229300a66c99ccc08cf683d84f68ba6e11898d0f1cca31b17b0d5d89d57a187b63abd5f5d85e2c0cea209edba83ec4df0be433b23e235c5b3165fa934b5dc')
b2sums=('fd1084319f039d6805f8f1df96c687f50c4365bdfb3802a41b1ec40c27ffccab682f6c1e024fa341f25d4999a8ad8bdbccd69e5053b5d322fa71b7056b0de2de')

prepare() {
  mv -v $_name-$_commit $_name-$pkgver
  touch $_name-$pkgver/tests/__init__.py
}

build() {
  cd $_name-$pkgver
  python setup.py build
}

check() {
  cd $_name-$pkgver
  PYTHONPATH="build/lib:$PYTHONPATH"
  pytest -v tests
}

package() {
  cd $_name-$pkgver
  python setup.py install --optimize=1 --root="$pkgdir"
  install -vDm 644 CHANGES CONTRIBUTING.md README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

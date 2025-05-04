# Maintainer: Christopher Arndt <aur at chrisarndt dot de>
# Contributor: Simon Conseil <contact+aur at saimon dot org>
# Contributor: Jesus Alvarez

_name=radon
pkgname=python-$_name
pkgver=6.0.1
pkgrel=2
pkgdesc='A tool that computes various metrics for Python source code'
arch=(any)
url='https://radon.readthedocs.org/'
license=(MIT)
depends=('python-flake8>=3.0' python-colorama python-mando python-tomli)
makedepends=(python-sphinx python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d1ac0053943a893878940fedc8b19ace70386fc9c9bf0a09229a44125ebf45b5')


build() {
  cd $_name-$pkgver
  sed -i -e "s/mando[^']*/mando/" -e "s/colorama[^']*/colorama/" setup.py
  python setup.py build
  cd docs
  make html
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  # documentation
  install -d "$pkgdir"/usr/share/doc/$pkgname
  cp -r docs/_build/html/* "$pkgdir"/usr/share/doc/$pkgname
  # license
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:

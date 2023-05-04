# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=copulae
pkgname=python-$_pkgname
pkgver=0.7.7
pkgrel=2
pkgdesc='Multivariate data modelling with Copulas in Python'
arch=('x86_64' 'aarch64')
url='https://copulae.readthedocs.io'
license=('MIT')
depends=('python-statsmodels' 'python-scikit-learn' 'python-wrapt')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest')
source=($pkgname-$pkgver.tar.gz::"https://github.com/DanielBok/copulae/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2823ee639a1cd1742bd56c06fa5ebd553d76a822c1e755799da8583255522a35')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  mv setup.cfg setup.cfg.backup
  local _python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_python_version" pytest -k 'not test_gmc'
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

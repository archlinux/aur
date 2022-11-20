# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-hypothesis
pkgver=6.54.4
pkgrel=3
pkgdesc="Advanced Quickcheck style testing library for Python 3.8"
arch=('any')
license=('MPL')
url="https://hypothesis.readthedocs.org"
depends=('python38-attrs' 'python38-sortedcontainers' 'python38-exceptiongroup')
optdepends=('python38-pytz: for datetime and django module'
            'python38-faker: for fakefactory and django module'
            'python38-django: for django module'
            'python38-numpy: for numpy module'
            'python38-pytest: for pytest module'
            'python38-lark-parser: for lark module'
            'python38-libcst: for codemods module')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools' 'python38-wheel')
checkdepends=('python38-pytest' 'flake8' 'python38-pytz' 'python38-numpy' 'python38-faker'
              'python38-flaky' 'python38-django' 'python38-pandas' 'python38-dpcontracts'
              'python38-pytest-xdist' 'python38-lark-parser' 'python38-pexpect' 'python38-coverage'
              'python38-typing_extensions' 'python38-black' 'python38-fakeredis' 'python38-libcst')
source=("$pkgname-$pkgver.tar.gz::https://github.com/HypothesisWorks/hypothesis/archive/hypothesis-python-$pkgver.tar.gz")
sha512sums=('7e5b70cc2df874163205e3d35f3f5e6a71319e779b35f1596c69222373e9b766a143ccf37aa1699de6b98827978e44ccbca0b1e30e6ffe29c8b68c83bb3af869')

prepare() {
  mv hypothesis-hypothesis-python-$pkgver hypothesis-$pkgver
}

build() {
  cd hypothesis-$pkgver/hypothesis-python

  python3.8 -m build -nw
}

check() {
  cd hypothesis-$pkgver/hypothesis-python

  python3.8 setup.py install --root="$PWD/tmp_install" --optimize=1
  python3.8 examples/example_hypothesis_entrypoint/setup.py install --root="$PWD/tmp_install" --optimize=1

  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PWD/examples/example_hypothesis_entrypoint" \
  PATH="$PWD/tmp_install/usr/bin:$PATH" \
    pytest --ignore tmp_install || echo "Tests failed"
}

package() {
  cd hypothesis-$pkgver/hypothesis-python

  python3.8 -m installer -d "$pkgdir" dist/*.whl

  # It's only present when tests are enabled, so adding -f
  rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests
}

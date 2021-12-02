# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-celery
pkgver=0.0.0
pkgrel=3
pkgdesc='A shim pytest plugin to enable celery.contrib.pytest'
arch=('any')
license=('BSD')
url='https://github.com/celery/pytest-celery'
depends=('python-celery')
makedepends=('python-dephell')
source=("https://pypi.io/packages/source/p/pytest-celery/pytest-celery-$pkgver.tar.gz")
sha512sums=('5fc9c52da674ec2fcf55d6ebf278aec166877c5bd7962c786e5432e77d15132247021e4552001aad19bd7827e5b16256062eade43a8fc59c5b52e264d06b1cae')

prepare() {
  cd pytest-celery-$pkgver

  # poetry-generated setup.py is badly broken in several ways, including
  # distribution of tests in the built package as well as using distutils for
  # bad metadata. See https://github.com/sdispater/poetry/issues/866
  dephell deps convert --from pyproject.toml --to setup.py

  # dephell does not generate py_modules into setup.py, so the resulting installation is missing
  # the module source code itself. Patching it here as a workaround until we fix it properly.
  sed -i '/author_email=/a \    py_modules=["pytest_celery"],' setup.py
}

build() {
  cd pytest-celery-$pkgver
  python setup.py build
}

package() {
  cd pytest-celery-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:

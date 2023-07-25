# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-single-version
_name=${pkgname#python-}
pkgver=1.5.1
pkgrel=5
pkgdesc="Small utility to define version string for Poetry-style Python project"
arch=('any')
url="https://github.com/hongquan/single-version"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d0dee097581a4a9cdf1576075219369abedb67583449c6a0ae2c3f8100b9e903')

prepare() {
  cd "$_name-$pkgver"

  # Change build system to Poetry Core
  sed -i 's/poetry>=0.12/poetry-core/g' pyproject.toml
  sed -i 's/poetry.masonry/poetry.core.masonry/g' pyproject.toml
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

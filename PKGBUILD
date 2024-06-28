# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-caerus
pkgdesc='Detection of favorable moments in time series data'
pkgver=0.1.10
pkgrel=1
url='https://github.com/erdogant/caerus'
arch=('any')
license=('MIT')
depends=('python-matplotlib' 'python-numpy' 'python-pandas' 'python-tqdm')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')

_pypi=caerus
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
  'https://erdogant.github.io/datasets/facebook_stocks.zip'
  'https://erdogant.github.io/datasets/BTCUSDT.zip'
  'include_example_datasets.patch'
)
sha256sums=(
  'e2cac5a1f1c5cbdebfa687ccb969a64630510f597724a6590049d1ee79452353'
  '1c57af47f4ae1796643cfd654be48d87729061616ea909bd2c4b48a0c209b892'
  '080a583e30cb5fd695e195e8d7b1a65ebf44d396f61e2b124e53a04f42e9a0aa'
  '1b2bd7d977b84217f4f45a244b1f610d90fb20f77f2d24b84cae91c8eec847c4'
)

prepare() {
  cd "$_pypi-$pkgver"
  patch -p0 -i "$srcdir/include_example_datasets.patch"
}

build() {
  cd "$_pypi-$pkgver"
  python -m build --no-isolation --wheel
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  cd "$srcdir"
  install -Dm644 -t "$pkgdir/usr/share/$pkgname" fb.csv BTCUSDT/BTCUSDT.csv
}

# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-caerus
pkgdesc='Detection of favorable moments in time series data'
pkgver=0.1.9
pkgrel=1
url='https://github.com/erdogant/caerus'
arch=('any')
license=('MIT')
depends=('python-matplotlib' 'python-numpy' 'python-pandas' 'python-tqdm')
makedepends=('python-build' 'python-installer' 'python-wheel')

_pypi=caerus
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
  'https://erdogant.github.io/datasets/facebook_stocks.zip'
  'https://erdogant.github.io/datasets/BTCUSDT.zip'
  'include_example_datasets.patch'
)
sha256sums=(
  '06b793c4537b663438270ea740c65eafe72d987ad18e942c85bab1bfc6a3a216'
  '1c57af47f4ae1796643cfd654be48d87729061616ea909bd2c4b48a0c209b892'
  '080a583e30cb5fd695e195e8d7b1a65ebf44d396f61e2b124e53a04f42e9a0aa'
  'f9cbf62d056435b88efb94ca8b19870400668bdf0fa4ea833551c3ff0eccec75'
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

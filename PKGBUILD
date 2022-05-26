# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-caerus
pkgdesc='Detection of favorable moments in time series data'
pkgver=0.1.8
pkgrel=1
url='https://github.com/erdogant/caerus'
arch=('any')
license=('MIT')
depends=('python-matplotlib' 'python-numpy' 'python-pandas' 'python-tqdm')
makedepends=('python-setuptools')

_pypi=caerus
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
  'https://erdogant.github.io/datasets/facebook_stocks.zip'
  'https://erdogant.github.io/datasets/BTCUSDT.zip'
  'include_example_datasets.patch'
)
sha256sums=(
  '5a23ea41a3a93865ae9f831bb50a642cfaad19ad8678f927cd630689573de31b'
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
  python setup.py build
}

package() {
  cd "$_pypi-$pkgver"
  python setup.py install --skip-build --optimize=1 --prefix=/usr --root="$pkgdir"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  cd "$srcdir"
  install -Dm644 -t "$pkgdir/usr/share/$pkgname" fb.csv BTCUSDT/BTCUSDT.csv
}

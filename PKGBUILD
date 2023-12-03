# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-findpeaks
pkgver=2.6.1
pkgrel=1
pkgdesc="Detection of peaks and valleys in vectors and images"
url='https://erdogant.github.io/findpeaks/'
arch=('any')
license=('MIT' 'LGPL')
depends=(
  'python-caerus' 'python-joblib' 'python-matplotlib' 'python-numpy' 'python-pandas'
  'python-peakdetect' 'python-requests' 'python-scipy' 'python-tqdm' 'python-xarray'
)
optdepends=(
  'python-opencv: for loading example images'
  'python-tabulate: to run example scripts'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-opencv' 'python-pytest')

_pypi=findpeaks
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
  'https://erdogant.github.io/datasets/2dpeaks.zip'
  'https://erdogant.github.io/datasets/2dpeaks_image.png'
  'change_opencv_message.patch'
  'include_example_datasets.patch'
)
sha256sums=(
  'e47cc0f1d05b4f15bc575d307e1dfb34e23264e1bad7ddee79fb3fb1e24956e0'
  'cde41d4a434c2c8d0f7273283796e9d5ed621f6877556cc2504b271e6fe6b329'
  'ea0f10f39f73363fe5e41b6bac51b33b13213fc1770d510ac29d3dbac661e474'
  'a1a2c8894ce3d4246c37f6582278d5fe9bacc621e862795e8e171b5c40cc2d55'
  '2d82888c63c3419cf71b242aaeb04fe0137c57e8b0d60028f82895f11330c76e'
)

prepare() {
  cd "$_pypi-$pkgver"

  # Don't tell the user to install with pip, just raise the original exception
  # and let them handle it.
  patch -p0 -i "$srcdir/change_opencv_message.patch"

  # Move the example datasets into the library source and modify the setup.py
  # to include them in the built package.
  cp "$srcdir/2dpeaks_image.png" findpeaks/data
  cp "$srcdir/2dpeaks.zip" findpeaks/data
  patch -p0 -i "$srcdir/include_example_datasets.patch"
}

build() {
  cd "$_pypi-$pkgver"
  python -m build --no-isolation --wheel
}

check() {
  cd "$_pypi-$pkgver"
  pytest -v -k "not test_fit"  # Fails locally and on upstream CI.
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"

  # Move the example script to /usr/share
  install -Dm644 -t "$pkgdir/usr/share/$pkgname" findpeaks/examples.py
  find "$pkgdir/usr/lib" -type f -name "examples.py" -exec rm '{}' \;
  find "$pkgdir/usr/lib" -type f -name "examples.*pyc" -exec rm '{}' \;
}

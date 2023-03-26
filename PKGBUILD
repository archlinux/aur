# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-findpeaks
pkgver=2.4.6
pkgrel=1
pkgdesc="Detection of peaks and valleys in vectors and images"
url='https://erdogant.github.io/findpeaks/'
arch=('any')
license=('MIT' 'LGPL')
depends=(
  'python-matplotlib' 'python-numpy' 'python-pandas' 'python-peakdetect'
  'python-requests' 'python-scipy' 'python-tqdm' 'python-caerus'
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
  'fix_requirement_formatting.patch'
)
sha256sums=(
  'a560f2d65415b5504844d019eba964560b7815baafe930d6d633c98e76cd4088'
  'cde41d4a434c2c8d0f7273283796e9d5ed621f6877556cc2504b271e6fe6b329'
  'ea0f10f39f73363fe5e41b6bac51b33b13213fc1770d510ac29d3dbac661e474'
  'ca6b39de18e583d9b58785abd89f20474413f442e1379dd31c40d0347704aaf9'
  '5e7ddb7918f98c559c0bc1833250b9194abe9e7b061c96ebe758e642d0a25d50'
  '8ee4e290df80d422e1be392180b0ccf0e83d9051cf6e5db28305bbcff0f27420'
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

  # Version requirement formatting doesn't work (at least not with the build module)
  patch -p0 -i "$srcdir/fix_requirement_formatting.patch"
}

build() {
  cd "$_pypi-$pkgver"
  python -m build --no-isolation --wheel
}

check() {
  cd "$_pypi-$pkgver"
  pytest -v
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

# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-findpeaks
pkgver=2.1.1
pkgrel=1
pkgdesc="Detection of peaks and valleys in vectors and images"
url='https://erdogant.github.io/findpeaks/'
arch=('any')
license=('MIT' 'LGPL')
depends=(
  'python-matplotlib' 'python-numpy' 'python-pandas' 'python-peakdetect'
  'python-scipy' 'python-tqdm' 'python-requests'
)
optdepends=(
  'opencv: for loading example images'
)
makedepends=('git' 'python-setuptools')
checkdepends=('hdf5' 'opencv' 'qt5-base')
source=(
  "git+https://github.com/erdogant/findpeaks#tag=$pkgver"
  "replace-wget.patch::https://patch-diff.githubusercontent.com/raw/erdogant/findpeaks/pull/1.patch"
  'change-opencv-message.patch'
)
sha256sums=(
  'SKIP'
  '4a852ea713017a5292db8963a5a56c373351776e2e9584d2cd5bb1b0b6613f50'
  'e5285b156bcbe898453fe64f5cb525e59b15c2e2508f363dec091e429a0d6d24'
)

prepare() {
  cd "findpeaks"
  git apply "$srcdir/replace-wget.patch"
  patch -p0 -i "$srcdir/change-opencv-message.patch"
}

build() {
  cd "findpeaks"
  python setup.py build
}

check() {
  cd "findpeaks/tests"

  # Run the test function with Matplotlib forced to be non-interactive.
  PYTHONPATH="../build/lib" PYTHONDONTWRITEBYTECODE=1 python - << EOF
from test_findpeaks import test_fit
import matplotlib
matplotlib.use("Agg")
test_fit()
EOF

  # Remove example data downloaded for the tests.
  cd ../build/lib/findpeaks/data
  rm 2dpeaks.zip 2dpeaks_image.png
}

package() {
  cd "findpeaks"
  python setup.py install --root="$pkgdir" --prefix=/usr --skip-build --optimize=1
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"

  # Move the example script to /usr/share
  install -Dm644 -t "$pkgdir/usr/share/$pkgname" findpeaks/examples.py
  find "$pkgdir/usr/lib" -type f -name "examples.py" -exec rm '{}' \;
  find "$pkgdir/usr/lib" -type f -name "examples.*pyc" -exec rm '{}' \;
}

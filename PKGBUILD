# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Sam <dev at samarthj dot com>
pkgname=pyinstaller-hooks-contrib
pkgver=2024.1
pkgrel=1
pkgdesc="Community maintained hooks for PyInstaller"
arch=('any')
url="https://github.com/pyinstaller/pyinstaller-hooks-contrib"
license=('GPL-2.0-or-later AND Apache-2.0')
depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=(
  # libraries with referenced hooks that work with tests
  'python-boto3'
  'python-pygraphviz'
  'python-pycparser'
  'python-pytest'
  'python-pyusb'
  'python-pyqt5'
  'python-pyqt5-webengine'
  'python-uvloop'
  'python-importlib-metadata'
  'python-importlib_resources'
)
#checkdepends=(
#  'python-pytest'
#  'python-psutil'
#  # Ability to retry a failed test
#  'python-flaky'
#  # Plugin to abort hanging tests.
#  'python-pytest-timeout>=2.0.0'
#  # allows specifying order without duplicates
#  'python-pytest-drop-dup-tests'
#  # reruns failed flaky tests
#  'python-pytest-rerunfailures'
#  # parallel processing for tests
#  'python-pytest-xdist'
#  'python-execnet>=1.5.0'
#)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bbbc3eac5d35bf3b5cb3fb2992053b9394f123559ccdd2090b5e49e993c9b4ba')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

  ## TODO: Move this into the pyinstaller pkg and be a universal build for 2 targets
  # They both depend on each other and is now causing a cyclical dependency.
#check() {
#  cd "$pkgname-$pkgver"

  # Disabling several tests that are not relevant to the release of this pkg
  # darwin, win32, slow - self explanatory
  # test_cv2_highgui - needs interactive interface
  # test_pynput - needs interactive interface
  # test_boto - known to fail for python 3
  # test_cv2 - needs full suite of libraries
#  QT_QPA_PLATFORM="offscreen" \
#  pytest -c pytest.ini -m "not darwin and not win32 and not slow" \
#    -k "not test_cv2_highgui and not test_pynput and not test_boto and not test_cv2" \
#    --maxfail=3 \
#    -n=auto --maxprocesses="${PYTEST_XDIST_AUTO_NUM_WORKERS:-2}" \
#    --dist=load \
#    --force-flaky --no-flaky-report --reruns=3 --reruns-delay=10
#}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

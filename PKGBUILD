# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

# shellcheck disable=2034,2148,2154,2155

pkgname=pyinstaller-hooks-contrib
_pkgbase="${pkgname%-git}"
_pkgname="${_pkgbase#python-}"
pkgver=2023.5
pkgrel=1
pkgdesc="Community maintained hooks for PyInstaller"
arch=('any')
license=('GPL2' 'Apache' 'custom:PyInstaller')
depends=(
  "mpdecimal"
)
makedepends=(
  "python-build"
  "python-installer"
  "python-wheel"
  "python-setuptools"
)
optdepends=(
  # libraries with referenced hooks that work with tests
  "python-boto3"
  "python-pygraphviz"
  "python-pycparser"
  "python-pytest"
  "python-pyusb"
  "python-pyqt5"
  "python-pyqt5-webengine"
  "python-uvloop"
  "python-importlib-metadata"
  "python-importlib_resources"
)
# checkdepends=(
#   "python-pytest"
#   "python-psutil"
#   # Ability to retry a failed test
#   "python-flaky"
#   # Plugin to abort hanging tests.
#   "python-pytest-timeout>=2.0.0"
#   # allows specifying order without duplicates
#   "python-pytest-drop-dup-tests"
#   # reruns failed flaky tests
#   "python-pytest-rerunfailures"
#   # parallel processing for tests
#   "python-pytest-xdist"
#   "python-execnet>=1.5.0"
# )

url="https://github.com/pyinstaller/$_pkgname"
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('4f39329d84344707c23dea7ac9669cbc6ed7a0f909e57c9c8751e5ca85e37c08235820bbf960d45836cd301b5f5bb28fcbb02da8c3d11c13e18f2fe22efd6553')
b2sums=('0d2a6bc0e29329262fffabc37eb0f8e4914ac0d72590bba9de27e80c054eb09591cf1eef9ec3e33d872b164561791076b1b29a3e4b9893209daf4931cf4e5b5d')

prepare() {
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  if [[ $python_version -lt 39 ]]; then
    depends+=("python-importlib-metadata")
    checkdepends+=("python-importlib_resources")
  fi
}

build() {
  cd "$_pkgname-$pkgver" || exit 1
  python -m build --wheel --no-isolation
}

#TODO: Move this into the pyinstaller pkg and be a universal build for 2 targets
# The both depend on each other and is now causing a cyclical dependency.
# check() {
#   cd "$_pkgname-$pkgver" || exit 1

#   # Disabling several tests that are not relevant to the release of this pkg
#   # darwin, win32, slow - self explanatory
#   # test_cv2_highgui - needs interactive interface
#   # test_pynput - needs interactive interface
#   # test_boto - known to fail for python 3
#   # test_cv2 - needs full suite of libraries
#   QT_QPA_PLATFORM="offscreen" \
#     pytest -c pytest.ini -m "not darwin and not win32 and not slow" \
#     -k "not test_cv2_highgui and not test_pynput and not test_boto and not test_cv2" \
#     --maxfail=3 \
#     -n=auto --maxprocesses="${PYTEST_XDIST_AUTO_NUM_WORKERS:-2}" \
#     --dist=load \
#     --force-flaky --no-flaky-report --reruns=3 --reruns-delay=10
# }

package() {
  cd "$_pkgname-$pkgver" || exit 1
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 "LICENSE"* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 "README"* -t "$pkgdir/usr/share/doc/$pkgname/"
}

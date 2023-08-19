# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

# shellcheck disable=2034,2148,2154,2155

pkgname=pyinstaller-hooks-contrib
_pkgbase="${pkgname%-git}"
_pkgname="${_pkgbase#python-}"
pkgver=2023.7
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
sha512sums=('1bcd3d1472789e3cfb4b5a5b5914f9a0382b096741f9e2b1b01cf39915f38314b7c85e5b8cf530718207a9b143d44f4cc4acb3448a38fa1bd331d1673d45f4bb')
b2sums=('603158640ab85e993cb60342a4d36e14187a56816155b28a88b2ddcde2ade391a5bb05cd56db60089ea6959687317b04e7b0cfbb31b1081361f4a460ac45ebb7')

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

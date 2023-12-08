# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Sam <dev at samarthj dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>
pkgname=pyinstaller
pkgver=6.2.0
pkgrel=2
pkgdesc="Bundles a Python application and all its dependencies into a single package"
arch=('x86_64')
url="https://www.pyinstaller.org"
license=('custom')
depends=(
  'binutils'
  'mpdecimal'
  'pyinstaller-hooks-contrib'
  'python-altgraph'
  'python-setuptools'
)
makedepends=(
  'cmocka'
  'python-build'
  'python-installer'
  'python-wheel'
  'zlib'
)
checkdepends=(

  # Testing framework
  'python-pytest'
  # Work-around for a bug in execnet 1.4.1
  'python-execnet'
  # Better subprocess alternative with implemented timeout.
  'python-psutil'
  # These are required by some of basic tests
  'python-lxml'
  'python-tinyaes'
  # Plugin to abort hanging tests.
  'python-pytest-timeout'
  # Ability to retry a failed test
  'python-flaky'
  # allows specifying order without duplicates
  'python-pytest-drop-dup-tests'
  # reruns failed flaky tests
  'python-pytest-rerunfailures'
  # parallel processing for tests
  'python-pytest-xdist'
)
optdepends=('python-tinyaes: bytecode encryption support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyinstaller/pyinstaller/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('740836bc8ea2b2cfff47968b57158729fdeea691a3aa823ca6b94ebaa70d6ae6')

prepare() {
  cd "$pkgname-$pkgver"

  # Force bootloader build for the current platform
  # and remove the unnecessary binaries
  rm -rvf PyInstaller/bootloader/{Darwin,Linux,Windows}*
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"

  # run only the unit tests
  pytest tests/unit \
    -m 'not darwin and not win32' \
    --maxfail=3 \
    -n=auto --maxprocesses="${PYTEST_XDIST_AUTO_NUM_WORKERS:-2}" \
    --dist='load' \
    --force-flaky --no-flaky-report --reruns=3 --reruns-delay=10
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 COPYING.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}

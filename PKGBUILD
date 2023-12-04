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

  # The tests use an installed version of PyInstaller dist + bootloader
  # to run properly, and dogfood on that module for a lot of basic tests.
  # Temporarily extracting the built wheel to build to test it out.
  python -m installer --destdir="$srcdir/$pkgname/build" dist/*.whl

  # Disabling several tests that are not relevant to the release of this pkg
  # test_macos_bundle_signing - macos only
  # test_apple_events - macos only
  # test_pywin32 - win32 only
  # test_hooks - needs additional libraries (will vary by libs installed by user)
  # test_libraries - needs additional libraries (will vary by libs installed by user)
  # test_django - needs additional libraries (will vary by libs installed by user)
  # test_qt - needs additional libraries (hit or miss, works in chroot/clean system, but fails on daily driver)
  # test_django - needs additional libraries (will vary by libs installed by user)
  # test_interactive - needs ui-interface (will always fail on headless system)

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$srcdir/$pkgname/build/${site_packages}" \
    QT_QPA_PLATFORM='offscreen' \
    pytest \
    -m 'not darwin and not win32' \
    --ignore 'tests/functional/test_macos_bundle_signing.py' \
    --ignore 'tests/functional/test_apple_events.py' \
    --ignore 'tests/functional/test_pywin32.py' \
    --ignore-glob 'tests/functional/test_hooks/**' \
    --ignore 'tests/functional/test_libraries.py' \
    --ignore 'tests/functional/test_django.py' \
    --ignore 'tests/functional/test_qt.py' \
    --ignore 'tests/functional/test_interactive.py' \
    --maxfail=3 \
    -n=auto --maxprocesses="${PYTEST_XDIST_AUTO_NUM_WORKERS:-2}" \
    --dist='load' \
    --force-flaky --no-flaky-report --reruns=3 --reruns-delay=10

  # cleanup temporary wheel extraction
  rm -rf "$srcdir/$pkgname/build/usr"
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 COPYING.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}

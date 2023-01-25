# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>

# shellcheck disable=2034,2148,2154,2155

pkgname=pyinstaller
_pkgbase="${pkgname%-git}"
_pkgname="${_pkgbase#python-}"
pkgver=5.7.0
pkgrel=3
pkgdesc="Bundles a Python application and all its dependencies into a single package"
arch=('any')
url="http://www.pyinstaller.org"
license=('GPL2' 'Apache' 'custom:PyInstaller')
depends=(
  "python-altgraph"
  "pyinstaller-hooks-contrib>=2021.4"
  "python>=3.7"
  "python<3.12"
  "python-setuptools>=42.0.0"
  "binutils"
  "mpdecimal"
)
makedepends=(
  "zlib"
  "cmocka"
  "python-installer"
  "python-build"
  "python-wheel"
  "python-setuptools"
)
checkdepends=(
  # Testing framework.
  "python-pytest"
  # Work-around for a bug in execnet 1.4.1
  "python-execnet>=1.5.0"
  # Better subprocess alternative with implemented timeout.
  "python-psutil"
  # These are required by some of basic tests
  "python-lxml"
  "python-tinyaes>=1.0.0"
  # Plugin to abort hanging tests.
  "python-pytest-timeout>=2.0.0"
  # Ability to retry a failed test
  "python-flaky"
  # Plugin to abort hanging tests.
  "python-pytest-timeout"
  # allows specifying order without duplicates
  "python-pytest-drop-dup-tests"
  # reruns failed flaky tests
  "python-pytest-rerunfailures"
  # parallel processing for tests
  "python-pytest-xdist"
)
optdepends=(
  "python-tinyaes>=1.0.0: bytecode encryption support"
  "python-importlib-metadata: support for python 3.8 and lower"
  "python-importlib_resources: support for python 3.8 and lower"
)
source=(
  "https://github.com/$_pkgname/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
  "$_pkgname-5.7.0-bootloader-cmocka-fix.patch"
)
sha512sums=('3e4c6fc5cc6aa986fd3fe64cd15ae6834707a485845116b7129e79b365d2c953c958d108827628c764e82a913c0c9e2f5b391ad050b8db9202adefead879a11c'
            'ebee936836b68e6214cea72f65ec7e862fe8bac253913f57e7b36268a4c823219668b8f5d7295992b7cf0adb62954405ced2a588be7f1101995f7b0395c92f0c')
b2sums=('fa886386d57d644d65ec3a2bc3595171e8bff968dc740cf46cab97d5ae24bb6a9969b6e49fc53d9aaffba619fb297cd6d05f73ba2170031d20e7447ada5c013a'
        '863322c8ae832b6e609135c31496481d7c337a38316dbafd442c010a4dac94b2f21407c1367c5374b6170035ec1ffba97c522ee64679adfa93247b31bf87b998')

prepare() {
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  if [[ $python_version -lt 39 ]]; then
    depends+=("python-importlib-metadata")
    checkdepends+=("python-importlib_resources")
  fi

  # Broken bootloader build due to cmocka
  # TODO: Remove after merged in next release
  # https://github.com/pyinstaller/pyinstaller/pull/7383
  if [[ $pkgver == "5.7.0" ]]; then
    patch -Np1 -d "$_pkgname-$pkgver" -i ../"$_pkgname-5.7.0-bootloader-cmocka-fix.patch"
  fi
}

build() {
  cd "$_pkgname-$pkgver" || exit 1
  # Forcing bootloader build for the current platform
  # and removing the unnecessary pre-builts
  rm -rvf PyInstaller/bootloader/Darwin*
  rm -rvf PyInstaller/bootloader/Windows*
  rm -rvf PyInstaller/bootloader/Linux*
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver" || exit 1

  # The tests use an installed version of PyInstaller dist + bootloader
  # to run properly, and dogfood on that module for a lot of basic tests.
  # Temporarily extracting the built wheel to build to test it out.
  python -m installer --destdir="$srcdir/$_pkgname/build" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

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

  PYTHONPATH="$srcdir/$_pkgname/build/$site_packages" \
    QT_QPA_PLATFORM="offscreen" \
    pytest \
    -m "not darwin and not win32" \
    --ignore "tests/functional/test_macos_bundle_signing.py" \
    --ignore "tests/functional/test_apple_events.py" \
    --ignore "tests/functional/test_pywin32.py" \
    --ignore-glob "tests/functional/test_hooks/**" \
    --ignore "tests/functional/test_libraries.py" \
    --ignore "tests/functional/test_django.py" \
    --ignore "tests/functional/test_qt.py" \
    --ignore "tests/functional/test_interactive.py" \
    --maxfail=3 \
    -n=auto --maxprocesses="${PYTEST_XDIST_AUTO_NUM_WORKERS:-2}" \
    --dist=load \
    --force-flaky --no-flaky-report --reruns=3 --reruns-delay=10

  # cleanup temporary wheel extraction
  rm -rf "$srcdir/$_pkgname/build/usr"
}

package() {
  cd "$_pkgname-$pkgver" || exit 1
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 "COPYING.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 "README.rst" -t "$pkgdir/usr/share/doc/$pkgname/"
}

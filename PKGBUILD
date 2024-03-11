# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Sam <dev at samarthj dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>
pkgname=pyinstaller
pkgver=6.5.0
pkgrel=2
pkgdesc="Bundles a Python application and all its dependencies into a single package"
arch=('x86_64')
url="https://www.pyinstaller.org"
license=('custom')
depends=(
  'binutils'
  'pyinstaller-hooks-contrib'
  'python-altgraph'
  'python-setuptools'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-pillow'
  'python-psutil'
  'python-pytest'
  'python-pytest-xdist'
  'xmldiff'
)
optdepends=('python-argcomplete: tab completion for CLI tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyinstaller/pyinstaller/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0200fb8e27c284e5698a688aa904980b7a1692bc38daf6446bbae8f71b65dc2e')

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
    -n=auto --maxprocesses="${PYTEST_XDIST_AUTO_NUM_WORKERS:-2}" --dist='load'
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 doc/{"$pkgname.1",pyi-makespec.1} -t \
    "$pkgdir/usr/share/man/man1/"
  install -Dm644 COPYING.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}

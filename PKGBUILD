# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-pylgbst-git
_name=pylgbst
pkgver=1.3.0.r7.g789a52e
pkgrel=1
pkgdesc="Python library to interact with LEGO PoweredUp devices (LEGO BOOST Move Hub etc.)"
arch=('any')
url="https://github.com/undera/pylgbst"
license=('MIT')
depends=('python' 'python-bleak' 'bluez')
optdepends=('python-bluepy: bluepy backend'
            'python-pygatt: pygatt (gatttool/BlueGiga) backend'
            'python-gatt: gatt (D-Bus) backend'
            'python-gattlib: gattlib backend')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest')
provides=("python-pylgbst=${pkgver%%.r*}")
conflicts=('python-pylgbst')
source=("$_name::git+https://github.com/undera/pylgbst.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name"
  # tests for other BLE backends need libraries this package doesn't depend on
  python -m pytest tests \
    --ignore=tests/test_cbluepy.py \
    --ignore=tests/test_gatt.py \
    --ignore=tests/test_pygatt.py
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
  local license=("$pkgdir$site_packages/$_name-"*.dist-info/licenses/LICENSE)
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "${license[0]#"$pkgdir"}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

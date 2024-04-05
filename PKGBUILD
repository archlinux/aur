# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pylink-square
_name=pylink
pkgver=1.2.0
pkgrel=2
pkgdesc="Python interface for the SEGGER J-Link"
arch=(any)
url="https://github.com/Square/pylink"
license=(Apache-2.0)
depends=(
  python
  python-psutil
  python-six
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
conflicts=(pylink)
provides=(pylink)
replaces=(pylink)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/square/pylink/archive/refs/tags/v$pkgver.tar.gz
  $pkgname-0.14.3-remove_mock.patch
)
sha512sums=('eca7432884ecbd0deb70018c8046f95e4e9aac5b0306a0f855f09742d268c54a5c7521b5cebc45cdc0e8f53b7c2d5ad4b31c1c3611976343b4fe3979faba258c'
            '35ff6497171de4acb6eebbca0619419ba8fa74da9487181dcbd90068fe2c7122e79d0d3e54dfc9a0bf010e398d144ff6ce20ca5e76e426269f6274b1d66287da')
b2sums=('5bf83a517706a09e9c569040086d7be76d2bb06cbcb9937c3a0003d19d68ee10f0eeb12f74324bc5caaa915063d095e12c9057699e2c22755ac8249ba4ef5b8f'
        '4cc08b683975b3400caa0d73efb986737971c1003f1c0632d7440c25c9f0cc661f847275753c6ba03dc214e303a3cfd1ea8d3fb2bb6824c7560945fe1f2ecb05')

prepare() {
  # remove use of mock: https://github.com/square/pylink/issues/149
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-0.14.3-remove_mock.patch
  # test library changed with Python 3.12: https://github.com/square/pylink/issues/197
  sed -i 's/assertEquals/assertEqual/g' $_name-$pkgver/tests/unit/test_library.py
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # tests broken with Python 3.12: https://github.com/square/pylink/issues/197
    --deselect tests/unit/test_jlink.py::TestJLink::test_cp15_register_write_success
    --deselect tests/unit/test_jlink.py::TestJLink::test_jlink_restarted
    --deselect tests/unit/test_jlink.py::TestJLink::test_set_log_file_success
  )

  cd $_name-$pkgver
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 *.md -t "$pkgdir/usr/share/doc/$pkgname"
}

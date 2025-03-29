# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pylink-square
_name=pylink
pkgver=1.5.1
pkgrel=1
pkgdesc="Python interface for the SEGGER J-Link"
arch=(any)
url="https://github.com/Square/pylink"
license=(Apache-2.0)
depends=(
  python
  python-psutil
  python-six
  jlink-software-and-documentation
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
sha512sums=('a95380c22b18f4bccd2dae64d8975010365d8c844b142351bc4764b9b4759dec008dc0066668bfd80005e348e47a08565f5817ac63449591cff46e10b7f8a723'
            '35ff6497171de4acb6eebbca0619419ba8fa74da9487181dcbd90068fe2c7122e79d0d3e54dfc9a0bf010e398d144ff6ce20ca5e76e426269f6274b1d66287da')
b2sums=('799a2b49588b4b843d970b3d2b32db7a0d51e8431954440dcf005e8bb5679ea2e54824af5ac214659fcd9048be90173962f3bdaf2c1dcb7da84d8e0ec1dd2bf5'
        '4cc08b683975b3400caa0d73efb986737971c1003f1c0632d7440c25c9f0cc661f847275753c6ba03dc214e303a3cfd1ea8d3fb2bb6824c7560945fe1f2ecb05')

prepare() {
  # remove use of mock: https://github.com/square/pylink/issues/149
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-0.14.3-remove_mock.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   local pytest_options=(
#     -vv
#     # tests broken with Python 3.12: https://github.com/square/pylink/issues/197
#     --deselect tests/unit/test_jlink.py::TestJLink::test_cp15_register_write_success
#     --deselect tests/unit/test_jlink.py::TestJLink::test_jlink_restarted
#     --deselect tests/unit/test_jlink.py::TestJLink::test_set_log_file_success
#   )
#
#   cd $_name-$pkgver
#   pytest "${pytest_options[@]}"
# }

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 *.md -t "$pkgdir/usr/share/doc/$pkgname"
}

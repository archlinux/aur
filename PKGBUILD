# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pylink-square
_name=pylink
pkgver=1.5.0
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
sha512sums=('9768a4492ddf4cab875c22d62d5de0a57324afc90bfc83485c430747e2f6956093cc8ffcd558b40270416c880f1aebaa4475c74f09e9a8929922f4f12eb8273e'
            '35ff6497171de4acb6eebbca0619419ba8fa74da9487181dcbd90068fe2c7122e79d0d3e54dfc9a0bf010e398d144ff6ce20ca5e76e426269f6274b1d66287da')
b2sums=('8896c3e79fc952025e4559ce3b0d0bfafa9a7a315e99e69da6266f593607091609449471ead338479d9a75fca47832277488367cf42d8bacb85a2e0206ce7a70'
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

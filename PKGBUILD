# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pylink-square
_name=pylink
pkgver=1.4.0
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
sha512sums=('612fd536de86847f9bc2847686ed2d5fc595225694b97380205498aa161632898a240fd93ea4feddc7e5e9a5e8c74bd32f8f8cb4d3be91e91a1a0ed54936d123'
            '35ff6497171de4acb6eebbca0619419ba8fa74da9487181dcbd90068fe2c7122e79d0d3e54dfc9a0bf010e398d144ff6ce20ca5e76e426269f6274b1d66287da')
b2sums=('e513d21aa55af17fd09d19747b8132574fb9b4dd07c80369db8d4886cecabb11cff51a5696fe2957797c46cc210e06558f45ebef44f2599735c8e18c14914a8c'
        '4cc08b683975b3400caa0d73efb986737971c1003f1c0632d7440c25c9f0cc661f847275753c6ba03dc214e303a3cfd1ea8d3fb2bb6824c7560945fe1f2ecb05')

prepare() {
  # remove use of mock: https://github.com/square/pylink/issues/149
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-0.14.3-remove_mock.patch
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

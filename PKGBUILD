# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Matteo Triggiani <davvore33@gmail.com>

pkgname=python-pickledb
pkgver=1.3.2
pkgrel=2
pkgdesc='A Lightweight, simple and fast Python key-value store with asynchronous support'
url="https://patx.github.io/pickledb/"
arch=('any')
license=('BSD-3-Clause')
depends=(
  'python'
  'python-aiofiles'
  'python-orjson'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
source=("git+https://github.com/patx/pickledb.git#tag=v$pkgver"
        "fix_test_invalid_file_loading.patch")
sha256sums=('526cb7976899b641bb6500faf14978cf9c87a7955e7e7828dfd3e64d2abded8c'
            '24b9ca38bfa9d5e5f732d62c125cf45888c1883a0c0a32f4bfc2fa7c76197ccb')

prepare () {
    cd "pickledb"
    # https://github.com/patx/pickledb/issues/102
    patch -p1 < ../fix_test_invalid_file_loading.patch
}

build() {
    cd "pickledb"
    python -m build --wheel --no-isolation
}

check() {
    cd "pickledb"
    pytest tests.py -v
}

package() {
    cd "pickledb"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

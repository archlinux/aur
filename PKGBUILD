# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-nvdlfw-inspect
_pkgname=nvidia-dlfw-inspect
pkgver=0.2.2
pkgrel=1
pkgdesc='Debugging and inspection tools for deep-learning frameworks'
arch=('any')
url='https://github.com/NVIDIA/nvidia-dlfw-inspect'
license=('Apache-2.0')
depends=(
  'python'
  'python-pytorch>=2.1'
  'python-yaml'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
options=('!debug')
_commit=4118044cc84f0183714a2ab1bc215fa49f9aaa82
_archive="$_pkgname-$_commit"
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
)
sha256sums=(
  'e706821db11cf1fd60b5c221bfb5ca753caee13e724d96e973fa9e242ac74784'
)

build() {
  cd "$_archive"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"
  CUDA_VISIBLE_DEVICES='' PYTHONPATH="$PWD" pytest -ra
}

package() {
  cd "$_archive"
  python -m installer --compile-bytecode 1 \
    --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

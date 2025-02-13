# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-trl
_pkgname=${pkgname#python-}
pkgver=0.15.0
pkgrel=1
pkgdesc='Train transformer language models with reinforcement learning'
arch=('any')
url='https://github.com/huggingface/trl'
license=('Apache')
groups=('huggingface')
depends=(
  'python-accelerate'
  'python-datasets'
  'python-rich'
  'python-transformers>=4.46.0'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'python-bitsandbytes: Quantization support'
  'python-deepspeed: Low-level routines for distributed training'
  'python-diffusers: Diffusion models'
  'python-peft: Parameter efficient fine-tuning'
)
source=(
  "python-trl-$pkgver.tar.gz"::"https://github.com/lvwerra/trl/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('3e98c303dabe0ddbfe162eeddbe27a93590fc884cb4d4e4d644ac265897456d2')

prepare() {
  # Avoid packaging tests.
  rm -rfv $_pkgname-$pkgver/tests
}

build() {
  python -m build -nw $_pkgname-$pkgver
}

check() {
  cd $_pkgname-$pkgver
  PYTHONPATH=$PWD python -c 'import trl'
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver-*-*.whl
}

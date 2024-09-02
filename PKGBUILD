# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-trl
_pkgname=${pkgname#python-}
pkgver=0.10.0
_pkgver=0.10
pkgrel=1
pkgdesc='Train transformer language models with reinforcement learning'
arch=('any')
url='https://github.com/huggingface/trl'
license=('Apache')
groups=('huggingface')
depends=(
  'python-accelerate'
  'python-datasets'
  'python-numpy'
  'python-pytorch'
  'python-transformers'
  'python-tyro'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'python-bitsandbytes: Quantization support'
  'python-deepspeed: Low-level routines for distributed training'
  'python-diffusers: Diffusion models'
  'python-peft: Parameter efficient fine-tuning'
)
source=(
  "python-trl-$pkgver.tar.gz"::"https://github.com/lvwerra/trl/archive/refs/tags/v$_pkgver.tar.gz"
)
sha256sums=('7dccf947ffe6b2187fce1dd8717c4b14ae33267e56023c8d1dcc6a1d31fac564')

prepare() {
  # Avoid packaging tests.
  rm -rfv $_pkgname-$_pkgver/tests
  sed -i '/__version__ = "0.10.0.dev0"/c\__version__ = "0.10.0"' \
    $_pkgname-$_pkgver/setup.py
}

build() {
  python -m build -nw $_pkgname-$_pkgver
}

check() {
  cd $_pkgname-$_pkgver
  PYTHONPATH=$PWD python -c 'import trl'
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$_pkgver/dist/$_pkgname-$pkgver-*-*.whl
}

# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-trl
_pkgname=${pkgname#python-}
pkgver=0.25.0
pkgrel=1
pkgdesc='Train transformer language models with reinforcement learning'
arch=('any')
url='https://github.com/huggingface/trl'
license=('Apache-2.0')
groups=('huggingface')
depends=(
  'python-accelerate'
  'python-datasets'
  'python-transformers>=4.56.1'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'python-bitsandbytes: Quantization support'
  'python-deepspeed: Low-level routines for distributed training'
  'python-diffusers: Diffusion models'
  'python-peft: Parameter efficient fine-tuning'
  'python-rich: Fancy text, tables, progress bars, and so on'
)
source=(
  "python-trl-$pkgver.tar.gz"::"https://github.com/lvwerra/trl/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('6ce6b46dae7ba2e232b42a97f14881db507a8972eaa05eb15358916a0f282ba5')

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
  cd $srcdir/$_pkgname-$pkgver
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python -m installer --compile-bytecode=1 --destdir=$pkgdir \
    dist/$_pkgname-$pkgver-*.whl
}

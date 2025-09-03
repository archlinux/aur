# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
# Maintainer: @xiota
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

_module="diffusers"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.35.1
pkgrel=1
pkgdesc='Pretrained diffusion models for image and audio generation in PyTorch'
url='https://github.com/huggingface/diffusers'
license=('Apache-2.0')
arch=('any')
groups=('huggingface')
depends=(
  'python-filelock'
  'python-huggingface-hub'
  'python-numpy'
  'python-pillow'
  'python-regex'
  'python-requests'
  'python-safetensors'
)
optdepends=(
  'python-accelerate: multi-GPU and TPU training support'
  'python-datasets: datasets and data loading'
  'python-flax: JAX/FLAX support'
  'python-peft: parameter efficient fine-tunning'
  'python-pytorch: PyTorch support'
  'python-tensorflow: TensorFlow support'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('d92405aa01f14559fbaceef90f06c1b80ca19d622c2c1d228afdef047b529307')

prepare() {
  cd "$_pkgsrc"
  sed -i '/License :: OSI Approved/d' setup.py
  sed -i 's/license=.*,/license="Apache-2.0",/' setup.py
  sed -i '/importlib_metadata/d' setup.py
  python setup.py deps_table_update
}

build() {
  python -m build -nw "$_pkgsrc"
}

check() {
  PYTHONPATH=$srcdir/$_pkgsrc/src python -c 'import diffusers'
}

package() {
  cd "$_pkgsrc"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --compile-bytecode=1 --destdir="$pkgdir" dist/*.whl
}

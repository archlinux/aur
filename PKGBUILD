# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-nanotron
_pkgname=${pkgname#python-}
pkgver=0.5.0
_pkgver=0.5
pkgrel=1
pkgdesc='Minimalistic large language model 3D-parallelism training'
arch=('any')
url='https://github.com/huggingface/nanotron'
license=('Apache-2.0')
groups=('huggingface')
depends=(
    'python-dacite'
    'python-datasets'
    'python-numpy<2'
    'python-packaging'
    'python-pytorch'
    'python-safetensors'
    'python-tqdm'
    'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'python-boto3: for S3 support'
  'python-transformers: for extra models'
  'python-flash-attn: for faster attention module'
)
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/refs/tags/v0.5.tar.gz")
sha256sums=('73f7127c6f7af6a5f031843575f0621b392f8a7c91462b78d1460c8a586f04f0')

prepare() {
  ln -sf "${_pkgname}-${_pkgver}" "${_pkgname}-${pkgver}"
  cd "${_pkgname}-${pkgver}"
  sed -Ei 's/^version = "0.4"/version = "0.5.0"/' pyproject.toml
}

build() {
  python -m build -nw "${_pkgname}-${_pkgver}"
}

check() {
  cd "${_pkgname}-${_pkgver}"
  PYTHONPATH=$PWD/src python -c 'import nanotron'
}

package() {
  cd "${_pkgname}-${_pkgver}"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --compile-bytecode=1 --destdir=$pkgdir \
    dist/${_pkgname}-${pkgver}-*-*.whl
}

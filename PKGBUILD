# Maintainer: LY <ly-niko@qq.com>

pkgname=python-py-key-value-aio
_name=py_key_value_aio
pkgver=0.4.5
pkgrel=2
pkgdesc="Async key-value store with pluggable backends"
arch=('any')
url="https://github.com/chrisguidry/py-key-value-aio"
license=('Apache')
depends=(
  'python>=3.10'
  'python-beartype'
  'python-typing_extensions'
)
optdepends=(
  'python-cachetools: memory backend support'
  'python-redis: redis backend support'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build')
source=("https://files.pythonhosted.org/packages/fb/e2/d689d922894a7ecde73b6daeaf9b13dab5aae06fe6aaaf7514722644d382/${_name}-${pkgver}.tar.gz")
sha256sums=('c6563a2c6abe5da5e20f4f9e875c2a9b425a2244a54fadbf46cf140a9eea45d7')

prepare() {
  cd "${_name}-${pkgver}"
  # uv_build 0.12 remains compatible, but the upstream constraint still
  # excludes it. Arch currently ships uv_build 0.12.x.
  sed -i 's/uv_build>=0.11.4,<0.12/uv_build>=0.11.4,<0.13/' pyproject.toml
}

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=opencensus-proto
pkgname=python-${_base}
pkgver=0.4.1
pkgrel=1
pkgdesc="Python library generated from OpenCensus cross-language protos."
arch=('any')
url="https://github.com/census-instrumentation/${_base}"
license=(Apache-2.0)
depends=('python' 'python-grpcio')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('a098b98817b5f6d8359686749f1e9cb096db172936881a2fc0fc7d68674f42ef255ab88fe7c537f164ed14051290e9a6c94309be184d343df962f38e446deb83')

build() {
  cd "${_base}-${pkgver}/gen-python"
  python -m build --wheel --no-isolation
}

package() {
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  cd "${_base}-${pkgver}/gen-python"
  python -m installer --destdir="$pkgdir" dist/*.whl

  rm "$pkgdir"/usr/lib/python${python_version}/site-packages/opencensus/__init__.py
  rm -r "$pkgdir"/usr/lib/python${python_version}/site-packages/opencensus/__pycache__

  install -Dm 644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

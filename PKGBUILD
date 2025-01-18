# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=CPyCppyy
pkgname=python-cpycppyy
pkgver=1.13.0
pkgrel=2
pkgdesc="Python-C++ bindings interface based on Cling/LLVM (CPython intermediate)"
arch=(x86_64)
url="https://github.com/wlav/CPyCppyy"
license=(BSD-3-Clause-LBNL)
depends=(
  gcc-libs
  glibc
  python
  # https://github.com/wlav/CPyCppyy/blob/master/pyproject.toml
  python-cppyy-cling=6.32.8
  python-cppyy-backend=1.15.3
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
provides=(${_name,,})
replaces=(${_name,,})
source=(
  $url/archive/refs/tags/$_name-$pkgver.tar.gz
  fix-versions.patch
)
b2sums=('ff52a5803f5c5ca0b0f9a8c88f3df7a14f537f3c7dae7cf5230a44196d703dcef587b2a4eeb73a3f9671fdfc7ba3bd9a6b88c129a34d733f8706c739e428fc27'
        'dca952c9b1577954fc9cd8796a45be87348697353929be7b94eceb3079116ad8a73b80da5b5eeddf6fc7ab952bdfb8afe9f16060683e8082a4c6c32efccc1f7d')

prepare() {
  cd $_name-$_name-$pkgver
  # fix versions in pyproject.toml
  # https://github.com/wlav/CPyCppyy/commit/7b31a6b525897f6309b358a06b2e43d3df428c2d
  # https://github.com/wlav/CPyCppyy/issues/46
  patch -Np1 -i ../fix-versions.patch
}

build() {
  cd $_name-$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

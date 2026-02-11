# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-zxing-cpp
_name=${pkgname#python-}
pkgver=3.0.0
pkgrel=2
pkgdesc="Python bindings for zxing-cpp"
arch=('x86_64')
url="https://github.com/zxing-cpp/zxing-cpp"
license=('Apache-2.0')
depends=(
  'python'
  'zxing-cpp'
)
makedepends=(
  'cmake'
  'git'
  'pybind11'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("git+https://github.com/zxing-cpp/zxing-cpp.git#tag=v$pkgver"
        'git+https://github.com/zint/zint.git')
sha256sums=('072683b5dec4060f2abfb54f8b7da9db198406138895876831fc16dece6aee7a'
            'SKIP')

prepare() {
  cd "$_name"
  git submodule init
  git config submodule.zint.url "$srcdir/zint"
  git -c protocol.file.allow=always submodule update

  git -C wrappers/python clean -dfx

  # We really do have the dependencies, however
  # it can't find them...
  sed -i '/cmake/d' wrappers/python/pyproject.toml
  sed -i '/pybind11/d' wrappers/python/pyproject.toml
}

build() {
  cd "$_name/wrappers/python"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name/wrappers/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

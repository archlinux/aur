# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=arro3-core
pkgname=python-$_name
pkgver=0.9.1
pkgrel=1
pkgdesc='A minimal Python library for Apache Arrow, binding to the Rust Arrow implementation'
arch=('x86_64' 'aarch64')
_repo='https://github.com/kylebarron/arro3'
url="$_repo/tree/main/$_name"
license=('MIT OR Apache-2.0')
depends=('python'
         'libgcc'
         'glibc')
makedepends=('python-maturin'
             'python-build'
             'python-installer'
             'rust')
checkdepends=('python-geoarrow-types'
              'python-pandas'
              'python-pyarrow'
              'python-pytest')
source=("${_name%-core}-$pkgver.tar.gz::$_repo/archive/refs/tags/py-v$pkgver.tar.gz")
sha256sums=('ed1cd4f44e51f6d4c657f5b1723b422d0f69cd167100a71daa90847e1cc11746')

prepare() {
  cd "${_name%-core}-py-v$pkgver"
  # Use the maturin version shipped by Arch
  sed -i '/^requires = /s/"maturin[<>=!~][^"]*"/"maturin"/' $_name/pyproject.toml ${_name%-core}-compute/pyproject.toml
}

build() {
  cd "${_name%-core}-py-v$pkgver"
  python -m build --wheel --no-isolation $_name
  python -m build --wheel --no-isolation ${_name%-core}-compute
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "${_name%-core}-py-v$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer $_name/dist/*.whl
  test-env/bin/python -m installer ${_name%-core}-compute/dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests/core
}

package() {
  cd "${_name%-core}-py-v$pkgver"
  python -m installer --destdir="$pkgdir" $_name/dist/*.whl
  install -Dm644 LICENSE_MIT -t "$pkgdir"/usr/share/licenses/$pkgname/
}

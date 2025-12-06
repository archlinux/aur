# Maintainer:

pkgname=python-pycapnp
_name=pycapnp
pkgver=2.2.1
pkgrel=1
pkgdesc="A cython wrapping of the C++ Cap'n Proto library"
url="https://github.com/capnproto/pycapnp"
license=(BSD-2-Clause)
arch=(x86_64)
depends=(
  gcc-libs
  glibc
  python
)
makedepends=(
  git
  capnproto
  cython
  python-build
  python-installer
  python-pkgconfig
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
)
optdepends=('python-jinja: for capnpc-cython')
source=("git+$url#tag=v$pkgver")
sha512sums=('0468dba04d0ca9b49dbe9bf04720d14ae4a87077dac3d9ee6f3344a69cacce26034cba1e2078481c747d89bd225625c3e2eb655a1d8e4fb4c79be9acf97f8ce2')

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  cd $_name
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -Pm pytest
}

package() {
  depends+=(
    capnproto libkj.so libkj-async.so libcapnpc.so libcapnp.so libcapnp-rpc.so
  )
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}

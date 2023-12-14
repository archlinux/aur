# Maintainer:

pkgname=python-pycapnp
pkgver=1.3.0
_commit=33c453eff788295804c094601b657ec4fdadc6f8
pkgrel=3
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
  cython0
  python-build
  python-installer
  python-pkgconfig
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
optdepends=('python-jinja: for capnpc-cython')
source=(git+$url#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd pycapnp
  git describe --tags | sed 's/^[vV]//;s/-/+/g'
}

build() {
  cd pycapnp
  python -m build --wheel --no-isolation
}

check() {
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  cd pycapnp
  PYTHONPATH="build/lib.linux-$CARCH-cpython-$python_version" pytest
}

package() {
  depends+=(
    capnproto libkj.so libkj-async.so libcapnpc.so libcapnp.so libcapnp-rpc.so
  )
  cd pycapnp
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pycapnp
_name=pycapnp
pkgver=2.2.2
pkgrel=1
pkgdesc="A cython wrapping of the C++ Cap'n Proto library"
url="https://github.com/capnproto/pycapnp"
license=(BSD-2-Clause)
arch=($CARCH)
depends=(
  glibc
  libgcc
  libstdc++
  python
  python-jinja
)
makedepends=(
  git
  capnproto
  pkgconf
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
optdepends=()
source=("git+$url#tag=v$pkgver")
sha512sums=('d8c2fdb10ad35bfff68eef751316b1cd4a8d30f4190b79825bb0f66065cd5da9c8c73628ade94166acc7e6ce4c431d5d0b8c974b4f9c30175dcae6f716db99cc')

prepare() {
    git -C $_name clean -dfx
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  cd $_name
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -Pm pytest -k "not ssl" -v
}

package() {
  depends+=(
    capnproto libkj.so libkj-async.so libcapnpc.so libcapnp.so libcapnp-rpc.so
  )
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}

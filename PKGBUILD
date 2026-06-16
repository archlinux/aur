# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pycapnp
_name=pycapnp
pkgver=2.2.3
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
sha512sums=('62b9b204ded2439f62183d937bee4630f22849fa6d170e10a60660403aabff8cdc7c510d46cc010185be86852fde445a3d0ab361162ef1ca3d8487d871c9811c')

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

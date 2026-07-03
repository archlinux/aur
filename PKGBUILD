# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pycapnp
_name=pycapnp
pkgver=2.2.4
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
sha512sums=('9126a9e74920f52d10018d1d531609b95d629836b50397027a9a5087d3e14ae4483de3cde392b45472fd63da7455171765869194548607700e58243158dc3307')

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

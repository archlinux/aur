# Maintainer:

pkgname=python-pycapnp
_name=pycapnp
pkgver=2.0.0b2
_commit=c89174e80c4017dd9c2f85d26aa19792fa856855
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
checkdepends=(
  python-pytest
  python-pytest-asyncio
)
optdepends=('python-jinja: for capnpc-cython')
source=(git+$url#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd $_name
  git describe --tags | sed 's/^[vV]//;s/-/+/g'
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}" test/
}

package() {
  depends+=(
    capnproto libkj.so libkj-async.so libcapnpc.so libcapnp.so libcapnp-rpc.so
  )
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}

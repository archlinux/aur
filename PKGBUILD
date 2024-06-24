# Maintainer:

pkgname=python-pycapnp
_name=pycapnp
pkgver=2.0.0
_commit=78dd54e64155c7b4513008b5295803d6dab9fde8
pkgrel=2
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
source=(git+$url#commit=$_commit
        cython3.patch)
sha512sums=('7ea804afbe5afd05ae7295fc7e7c2f5dfb4688b2bebb97a69a1bac619382057882e8bd359956ba9ff1fbee7398024a38b9fb083586d1dee69a8a95b0157f48e4'
            '75f48922b25f622715a8a3cccb167e134acac27e0a9c8c70f5ca379f6c67491cc216299ab21283dc94c9ed5ef826ee761ea05745de8cb66d2f30751f25a0b392')

pkgver() {
  cd $_name
  git describe --tags | sed 's/^[vV]//;s/-/+/g'
}

prepare() {
  cd $_name
  patch -p1 -i ../cython3.patch
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

# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pycapnp
pkgver=1.3.0
_commit=33c453eff788295804c094601b657ec4fdadc6f8
pkgrel=2
pkgdesc="A cython wrapping of the C++ Cap'n Proto library"
url="https://github.com/capnproto/pycapnp"
license=(BSD)
arch=(x86_64)
depends=(gcc-libs glibc python)
makedepends=(git capnproto cython python-build python-installer python-pkgconfig python-setuptools python-wheel)
checkdepends=(python-pytest)
optdepends=('python-jinja: for capnpc-cython')
source=(git+https://github.com/capnproto/pycapnp.git#commit=$_commit)
sha512sums=('SKIP')

build() {
  cd pycapnp
  python -m build --wheel --no-isolation
}

check() {
  cd pycapnp
  PYTHONPATH="build/lib.linux-$CARCH-cpython-311" pytest
}

package() {
  depends+=(
    capnproto libkj.so libkj-async.so libcapnpc.so libcapnp.so libcapnp-rpc.so
  )
  cd pycapnp
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}

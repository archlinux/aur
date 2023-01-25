# Maintainer: Felix Yan <felixonmars@archlinux.org>

_name=pycapnp
pkgname=python-pycapnp
pkgver=1.2.2
pkgrel=3
pkgdesc="A cython wrapping of the C++ Cap'n Proto library"
url="https://github.com/capnproto/pycapnp"
license=(BSD)
arch=(x86_64)
depends=(gcc-libs glibc python)
makedepends=(capnproto cython python-build python-installer python-pkgconfig python-setuptools python-wheel)
checkdepends=(python-pytest)
optdepends=('python-jinja: for capnpc-cython')
source=(https://github.com/capnproto/$_name/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('3c0bdd90ec2f7a2e631f05d1e7ddfa06524d003d0f3f7e68eda8affc423ecf5921ab5608e27fbee94603556e9a3a4bd3e52f5452d0501b29def8ac9f789630f0')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pycapnp-$pkgver
  PYTHONPATH="build/lib.linux-$CARCH-cpython-310" pytest
}

package() {
  depends+=(
    capnproto libkj.so libkj-async.so libcapnpc.so libcapnp.so libcapnp-rpc.so
  )
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm 644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}

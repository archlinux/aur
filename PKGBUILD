# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: Jerry Lin <jerry73204 at gmail dot com>

_pyname=aiokafka
pkgname=python-$_pyname
pkgver=0.14.0
pkgrel=1
pkgdesc='Asyncio client for Kafka'
arch=(x86_64 aarch64)
url='https://aiokafka.readthedocs.io'
license=(Apache-2.0)
depends=(python-async-timeout python-packaging python-typing_extensions)
makedepends=(python-setuptools cython python-build python-installer python-wheel)
checkdepends=(python-pytest-asyncio python-pytest-mock python-docker python-cramjam)
source=($pkgname-$pkgver.tar.gz::https://github.com/aio-libs/aiokafka/archive/v$pkgver.tar.gz)
sha256sums=('750e128e778690d9f33d04d7fcdebcf882230c2ced204a781245f1e6850dbf5c')

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

check() {
  cd "$srcdir/$_pyname-$pkgver"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  mv $_pyname $_pyname-orig

  test-env/bin/python -m pytest -v
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl
}

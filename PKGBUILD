# Maintainer:  Anton Kudelin <kudelin at proton dot me>

_pyname=eventkit
pkgname=python-$_pyname
pkgver=1.0.3
pkgrel=1
pkgdesc='Event-driven data pipelines'
arch=(any)
url='https://github.com/erdewit/eventkit'
license=(BSD)
depends=(python-numpy)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=($url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('567ebad6a3d05483a6091d46e1716716465ea2c237be2c44778160c5eb30602b')

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

  test-env/bin/python -m pytest
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl

  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

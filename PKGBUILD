# Maintainer:  Anton Kudelin <kudelin at proton dot me>

_pyname=eventkit
pkgname=python-$_pyname
pkgver=1.0.0
pkgrel=1
pkgdesc='Event-driven data pipelines'
arch=(any)
url='https://github.com/erdewit/eventkit'
license=(BSD)
depends=(python-numpy)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/5e/aa/b8f33fefa6761d3cd006588f183cd7cda136668b34534a05d3a387777f63/$_pyname-$pkgver.tar.gz)
sha256sums=('c9c4bb8a9685e4131e845882512a630d6a57acee148f38af286562a76873e4a9')

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

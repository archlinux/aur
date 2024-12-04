# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pyname=aiohttp-jinja2
pkgname=python-$_pyname
pkgver=1.6
pkgrel=2
pkgdesc='jinja2 template renderer for aiohttp.web'
arch=(any)
url='http://aiohttp-jinja2.aio-libs.org/'
license=(Apache-2.0)
depends=(python-aiohttp python-jinja)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-aiohttp python-pytest-asyncio)
source=(https://github.com/aio-libs/$_pyname/releases/download/v$pkgver/$_pyname-$pkgver.tar.gz)
sha256sums=('a3a7ff5264e5bca52e8ae547bbfd0761b72495230d438d05b6c0915be619b0e2')

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
  sed -i '/--cov/d' pytest.ini

  test-env/bin/python -m pytest -v
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl
}

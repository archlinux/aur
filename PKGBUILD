# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pyname=ibapi
pkgname=python-$_pyname
pkgver=10.22.01
pkgrel=1
pkgdesc="Python IB API"
arch=(any)
url="https://interactivebrokers.github.io/tws-api"
license=(custom)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://interactivebrokers.github.io/downloads/twsapi_macunix.${pkgver/./}.zip
        LICENSE)
sha256sums=('32fa9535cc5cd925ddb77d316b17f420ebb99049538bdd40fa89df3c101e5627'
            'c60f3a3fe9a6799a346fe9519b2448334d99a6f0ff3db5c9969493be75941c5d')

build() {
  cd "$srcdir/IBJts/source/pythonclient"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

check() {
  cd "$srcdir/IBJts/source/pythonclient"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  rm -r $_pyname

  test-env/bin/python -m pytest -v
}

package() {
  cd "$srcdir/IBJts/source/pythonclient"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl

  install -Dm755 "$srcdir/LICENSE" \
    -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

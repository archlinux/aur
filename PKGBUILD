pkgname=python-ccxt
pkgver=1.56.41
pkgrel=1
pkgdesc="A JavaScript / Python / PHP cryptocurrency trading library with support for 130+ exchanges"
arch=(any)
url="https://ccxt.trade"
license=(MIT)
depends=("python")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/c/ccxt/ccxt-$pkgver.tar.gz")
sha256sums=('928e6f4e9a515d219dea6257eec16f7e0b8762a205e88042693c73dc4610b220')

prepare() {
  cd "$srcdir"/ccxt-$pkgver
  mv README.{rst,md}
}

build() {
  cd "$srcdir"/ccxt-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/ccxt-$pkgver
  python setup.py install -O1 --skip-build --root="$pkgdir"
  install -m0644 -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  _site_packages=$(python -sSc 'import site; print(site.getsitepackages()[0])')
  sed -r 's/^([^\[][^<>=]+)[<>=].*/\1/g' -i "$pkgdir"$_site_packages/*.egg-info/requires.txt
}

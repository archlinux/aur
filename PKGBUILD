pkgname=python-ccxt
pkgver=1.42.39
pkgrel=1
pkgdesc="A JavaScript / Python / PHP cryptocurrency trading library with support for 130+ exchanges"
arch=(any)
url="https://ccxt.trade"
license=(MIT)
depends=("python")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/c/ccxt/ccxt-$pkgver.tar.gz")
sha256sums=('256392a00af1bb4b68699c484974b33140fd9ddaa957d9e62e17045da42172b1')

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

# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: Stanisław Pitucha <viraptor@gmail.com>

_pyname=ofxparse
pkgname=python-$_pyname
pkgver=0.21
pkgrel=3
pkgdesc="Tools for working with the OFX (Open Financial Exchange) file format"
arch=(any)
url="http://sites.google.com/site/ofxparse"
license=(MIT)
depends=(python-beautifulsoup4 python-six)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-lxml)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jseutter/ofxparse/archive/$pkgver.tar.gz")
sha256sums=('2c61c5ab65b432c548823de656167ba738c937565206e0768f4c437e850f4821')

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

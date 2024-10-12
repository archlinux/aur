# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=damo
pkgver=2.5.0
pkgrel=1
pkgdesc="DAMON user-space tool"
arch=('any')
url='https://damonitor.github.io'
license=('GPL2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/damonitor/damo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5bb0449e9ada779e1c9547155d8ea18f60f1928e2dacfcb7675016d5d0561991')
b2sums=('3586595a6c9cb521fdae1ec30e470a2e64edd52bdadf4bc8d733a2caba4f9dac2f3ae6fbc9207194e359745b1837209eec8148b18577b8b403e6c5ffa24b7c08')

build() {
  cd "$pkgname-$pkgver"

  mkdir build && cd build

  cp ../packaging/{pyproject.toml,setup.py} .
  ../packaging/mk_readme.sh "$PWD" "$pkgver"

  mkdir -p src/damo
  cp -p ../src/*.py src/damo
  touch src/damo/__init__.py

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver/build"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    ../LICENSE
}

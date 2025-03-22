# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=damo
pkgver=2.7.2
pkgrel=1
pkgdesc="DAMON user-space tool"
arch=('any')
url='https://damonitor.github.io'
license=('GPL2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/damonitor/damo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8bad999b2b3814b7e4c03203d093b60f2ced8eee634f75ea00c67926c6373380')
b2sums=('6705444fd2c8bde3cdd488fa4b6044656298c9990a03890dae19fb6940420b0ee1f7f23c45f1728eba250fb9459b41adfad11eaf3b16891b235923e81dab9ed1')

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

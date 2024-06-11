# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=damo
pkgver=2.3.8
pkgrel=1
pkgdesc="DAMON user-space tool"
arch=('any')
url='https://damonitor.github.io'
license=('GPL2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/awslabs/damo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0ef0ba39d68487ba3ec243e855e0e6762a436f3afd7442097af284556c24b001')
b2sums=('06051583a9b1a93e4df91e033b8228fe078163c88a0d8cbc26f817c59e6ff700a6492fd15142e9094bbd1b48faa2b96f0533b19d7471debdfa294399c3de52a8')

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

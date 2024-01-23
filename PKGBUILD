# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=damo
pkgver=2.1.8
pkgrel=1
pkgdesc="DAMON user-space tool"
arch=('any')
url='https://damonitor.github.io'
license=('GPL2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/awslabs/damo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9b2b102ae0bb9b5271538078685f4bc525cfed2773debe3f38c71a8a316fae77')
b2sums=('bf983ea0f5bfdaf342eb453f4ed21ff3ff1e5e8beb25eda495ac25c10e9b83d22fcc8b29dd9e2c30cfd227b555b28bc5c1774730390c3f30a39a137db9eeacb1')

build() {
  cd "$pkgname-$pkgver"

  mkdir build && cd build

  cp ../packaging/{pyproject.toml,setup.py} .
  ../packaging/mk_readme.sh "$PWD" "$pkgver"

  mkdir -p src/damo
  cp -p ../*.py src/damo
  cp -p ../damo src/damo/damo.py
  touch src/damo/__init__.py

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver/build"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    ../LICENSE
}

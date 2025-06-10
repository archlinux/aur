# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=damo
pkgver=2.8.4
pkgrel=1
pkgdesc="DAMON user-space tool"
arch=('any')
url='https://damonitor.github.io'
license=('GPL-2.0-only')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/damonitor/damo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('67aa5cd260f66b8fcef57b9d755232942c230473522237aaad290c143a302b1f')
b2sums=('12593c62d4c87e59fa96bcf64780f202d3830b770a2ca56853a74eced0bf5aa266350e7a31e6e1e8041264aa9d1f21b18374f2ad93f1c6e0549686c001d3c786')

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

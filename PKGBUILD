# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=damo
pkgver=2.9.0
pkgrel=1
pkgdesc="DAMON user-space tool"
arch=('any')
url='https://damonitor.github.io'
license=('GPL-2.0-only')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/damonitor/damo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6677d2e4c6e1222b723d840562c5e2de704a7292626339e8adde4a29d35b8b33')
b2sums=('cc87506bb76e377e7117bffe131e4162bdc9ded270ae1ca0cdf3e77ba2b9e0e58f8bb270ca9cc45dd60888608692abc54fa3079b0b1fbf096b5ebf1b5ce99e52')

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

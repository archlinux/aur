# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=damo
pkgver=2.1.9
pkgrel=1
pkgdesc="DAMON user-space tool"
arch=('any')
url='https://damonitor.github.io'
license=('GPL2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/awslabs/damo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('02c6dd15dbd35f8fca0468597798767c7a22659cc56829077a13ee850b6ed97e')
b2sums=('e22e79205148be3d0e5c29f94d7f78b2699ad7e6f6b89169cdd0d5c17ee1a5cc4379385c9bc16d0cd5e4febf35f0043ddc963fe6d01a990dc824b55666eaa323')

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

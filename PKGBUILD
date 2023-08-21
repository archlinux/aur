# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=damo
pkgver=1.9.4
pkgrel=1
pkgdesc="DAMON user-space tool"
arch=('any')
url='https://damonitor.github.io'
license=('GPL2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/awslabs/damo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('91808710a93b78c2aa0635f25d9034eadf16da7e5a86ddb793b6301bdd3123c4')
b2sums=('c8f826883aa210a8b66cb09425931627c69e12e07b6984772da10de24719312c19b6497f87cbe9b793012c7b7049e36e693ec8144c739789a6f1b2664dc16e40')

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

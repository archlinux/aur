# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=damo
pkgver=1.2.2
pkgrel=1
pkgdesc="DAMON user-space tool"
arch=('any')
url='https://damonitor.github.io'
license=('GPL2')
depends=('python')
makedepends=('python-build')
source=("$pkgname-$pkgver.tar.gz::https://github.com/awslabs/damo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2dd22cb21dc3ee06374c957c45f80b3fee466e2655daf136961720337c47d4af')
b2sums=('b80b3b03cbd08f7f1c117222af4b7d60d76db67003cd96c1ae83ac54c5d48df922ff01601cbd40980b741f231118aeefb9ba64cdbd2234c08f16c2d6afd838ca')

prepare() {
  cd "$pkgname-$pkgver"

  mkdir -p build && cd build

  cp ../packaging/{setup.py,pyproject.toml} .
  sed -i "s/<<replace_me_with_the_version_number>>/$pkgver/" setup.py

  ../packaging/mk_readme.sh "$PWD" "$pkgver"

  mkdir -p src/damo
  cp ../*.py src/damo
  cp ../damo src/damo/damo.py
  touch src/damo/__init__.py

  rm -f src/damo/damo_version.py
}

build() {
  cd "$pkgname-$pkgver/build"

  python setup.py build
}

package() {
  cd "$pkgname-$pkgver/build"

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    ../LICENSE
}

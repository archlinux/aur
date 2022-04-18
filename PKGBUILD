# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=damo
pkgver=1.2.8
pkgrel=1
pkgdesc="DAMON user-space tool"
arch=('any')
url='https://damonitor.github.io'
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/awslabs/damo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b3ac946fc8858cbdb67417f881b0d08abe8f02f0db60cf7fdf4aa8e07a06f7c1')
b2sums=('cc2f3c06c0333a69ffebe16813f9a3eedcd4c38774a660f17507915327cae335aa64e7d69a6d735308b5f8abc99eca1aa93337c28d183b30fb04e9e7f126dd16')

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

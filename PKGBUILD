# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=damo
pkgver=2.0.6
pkgrel=1
pkgdesc="DAMON user-space tool"
arch=('any')
url='https://damonitor.github.io'
license=('GPL2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/awslabs/damo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d5a5cd50fe145365c97a9225e40683a77b06871d0a361f85d4a4b99ae52542bd')
b2sums=('616d56942111060af2ceaa1076eb253a54f2ab85635d72f35c45e11e47002f9b948a4f9fed583fc71d5d29d54eaca285bbfd8255db656c9e95724760394d6638')

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

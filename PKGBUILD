# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=PyMCTranslate
pkgname=python-${_name,,}
pkgver=1.2.8
pkgrel=1
pkgdesc='A library of block mappings that can be used to convert from any Minecraft format into any other Minecraft format'
arch=('any')
url="https://github.com/gentlegiantJGC/$_name"
license=('custom')
depends=('python' 'python-amulet-nbt' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-versioneer-518' 'python-wheel')
# tests directory isn't in pypi sdist
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('13d263e44e0d6d289437011648e5b678cd2263b48936c0dd69cb5144be111cf5')

prepare() {
  cd "$_name-$pkgver"

  # remove when setuptools >=62.4.0 is in [extra]
  sed -Ei 's/setuptools(\.command\.build)/distutils\1/' build_tools/minify_json.py
}

build() {
  cd "$_name-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"

  python -m unittest discover -s tests
}

package() {
  cd "$_name-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

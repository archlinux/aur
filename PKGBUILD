# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=PyMCTranslate
_pkgname=python-${_name,,}
pkgname=$_pkgname-git
pkgver=1.2.6.r0.g2e6cad45
pkgrel=1
pkgdesc='A library of block mappings that can be used to convert from any Minecraft format into any other Minecraft format - git version'
arch=('any')
url="https://github.com/gentlegiantJGC/$_name"
license=('custom')
depends=('python' 'python-amulet-nbt' 'python-numpy')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-versioneer-518' 'python-wheel')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_name"

  # remove when setuptools >=62.4.0 is in [extra]
  sed -Ei 's/setuptools(\.command\.build)/distutils\1/' build_tools/minify_json.py
}

build() {
  cd "$_name"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_name"

  python -m unittest discover -s tests
}

package() {
  cd "$_name"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=PyMCTranslate
_pkgname=python-${_name,,}
pkgname=$_pkgname-git
pkgver=1.0.12.r0.gbac6952d
pkgrel=2
pkgdesc='A library of block mappings that can be used to convert from any Minecraft format into any other Minecraft format - git version'
arch=('any')
url="https://github.com/gentlegiantJGC/$_name"
license=('custom')
depends=('python' 'python-amulet-nbt' 'python-numpy')
makedepends=('git' 'python-pip' 'python-setuptools' 'python-wheel')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"

  # only bdist_wheel minifies and installs json
  python setup.py bdist_wheel
}

package() {
  cd "$_name"

  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "dist/$_name-$(python -c 'import versioneer; print(versioneer.get_version())')-py3-none-any.whl"
  python -O -m compileall "$pkgdir"/usr/lib/python*/site-packages/$_name
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

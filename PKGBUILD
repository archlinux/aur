# Maintainer: David Runge <dvzrv@archlinux.org>

_name=click-command-tree
pkgname=python-click-command-tree
pkgver=1.1.1
pkgrel=2
pkgdesc="Click plugin to show the command tree of your CLI"
arch=(any)
url="https://github.com/whwright/click-command-tree"
license=(MIT)
depends=(python python-click)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
# tests not in sdist tarball: https://github.com/whwright/click-command-tree/issues/5
# source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
source=($_name-$pkgver.tar.gz::https://github.com/whwright/$_name/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('0bb9c223cedf72af004ae6ba6daf916a21300d03d5fb8e939a7265fbe481f6d2')
b2sums=('7fc40e8273c05aedb8f71ddfe33d640761f3fe8c02afdb8973828b8c247910c67e7469aa43e41bc003dadd741736c0b4ffc48d146cd417051a4b939299a49033')

prepare() {
  cd $_name-$pkgver
  # flake8 is not required for building the project: https://github.com/whwright/click-command-tree/issues/4
  sed -e '/flake8/d' -i setup.py
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv tests.py
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

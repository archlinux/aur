# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=pyg3t
pkgname=$_name-git
pkgver=0.5.1.r401.3939d89
pkgrel=1
pkgdesc="Python GetText Translation Toolkit"
arch=(any)
url="https://gitlab.com/pyg3t/pyg3t"
license=(GPL-3.0-or-later)
depends=(python)
makedepends=(git python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest)
provides=($_name)
conflicts=($_name)
source=(git+${url}.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  v=$(python -c 'from pyg3t import __version__; print(__version__)')
  r="$(git rev-list --count HEAD)"
  h="$(git rev-parse --short HEAD)"
  printf "$v.r$r.$h"
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

# Workaround for the tests requiring installed scripts (poselect, etc.)
check() {
  cd $_name
  python -m installer --destdir='tmp_dir' dist/*.whl
  export PATH="$PWD/tmp_dir/usr/bin:$PATH"
  PYTHONPATH=$PWD python -m pytest -vv
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}

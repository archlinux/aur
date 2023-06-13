# Maintainer:
# Contributor: gee

_pkgname="ialauncher"
pkgname="$_pkgname-git"
pkgver=r127.b93f75d
pkgrel=1
pkgdesc='Play all of the Internet Archive’s MS-DOS games offline'
arch=('any')
url='https://github.com/rtts/ialauncher'
license=('GPL3')

depends=(
  'dosbox'
  'python-pygame'
  'python-pyxdg'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

options=(!strip)

source=(
  "$_pkgname"::"git+$url"
  "ialauncher-19-xdg-cache.patch"::"https://github.com/rtts/ialauncher/pull/19.patch"
)
sha256sums=(
  'SKIP'
  '6def4ff58722dc5efbbd93c19837bb80774bb2d979a69567279273a4e0a4dc5b'
)

prepare() {
  cd "$srcdir/$_pkgname"

  for patch in "$srcdir"/*.patch ; do
    if [ -f "$patch" ] ; then
      echo "Applying patch: ${patch##*/}"
      patch -Np1 -F100 -i "$patch"
    fi
  done
}

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --no-isolation --wheel
}

package() {
  cd ialauncher
  python -m installer --destdir="$pkgdir" dist/*.whl
}

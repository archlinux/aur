# Author: Gaute Hope <eg@gaute.vetsj.com> / 2015-11-25

pkgname=python-cartopy-git
pkgver=20151125
pkgrel=1
pkgdesc="A cartographic python library with matplotlib support for visualisation"
url="https://github.com/SciTools/cartopy"
depends=('python' 'python-shapely' 'python-pyshp' 'python-pyproj')
makedepends=('git' 'python3' 'cython')
license=('LGPLv3')
arch=('any')
source=()
md5sums=()
provides=('python-cartopy')
conflicts=('python-cartopy')

_gitroot=https://github.com/SciTools/cartopy.git
_gitname=cartopy

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python setup.py build || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  python setup.py install --root="$pkgdir" --optimize=1 || return 1
}


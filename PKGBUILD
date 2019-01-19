# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=kicad-packages3d-git
_pkgname=kicad-packages3D
pkgver=r2019.01.18.430092b
pkgrel=1
pkgdesc="KiCad component 3D model libraries from the official git repo"
arch=('any')
url="https://github.com/KiCad/kicad-packages3D"
license=('GPL')
options=('!strip')
makedepends=('cmake' 'git')
conflicts=('kicad-library-bzr' 'kicad-library-git' 'kicad-library-3d' 'kicad-library' 'kicad-packages' 'kicad-packages3d')
provides=('kicad-packages3d')
source=()
md5sums=()

prepare(){
  if [ -d ${_pkgname} ]; then
    cd ${_pkgname}
    git fetch --depth 1
    git checkout master
  else
    git clone --depth 1 https://github.com/KiCad/kicad-packages3D.git
  fi
}

pkgver() {
  cd "$srcdir/$_pkgname"
  _DATE=$(date -d @`git log -1 --format="%at"` --rfc-3339='date')
  printf "r%s.%s" "${_DATE//-/.}" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"
  mkdir -p "$srcdir/build/"
  cd "$srcdir/build"
  cmake ../${_pkgname} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}


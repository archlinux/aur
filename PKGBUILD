pkgname=performer-git
pkgver=1.0.r158.1f48923
pkgrel=1.0
pkgdesc="Audio session manager for live music performances"
arch=('i686' 'x86_64')
url="https://github.com/progwolff/performer"
provides=('performer-git')
license=("GPL")
depends=('carla' 'qt5-base' 'qt5-declarative') 
makedepends=('git' 'cmake' 'qt5-tools' 'python')
optdepends=(
    'kdebase-runtime: KDE integration'
    'extra-cmake-modules: KDE integration'
    'kparts: display notes or chords with okular'
    'okular-git: display notes or chords'
    'qt5-webengine: display notes or chords')
source=('performer::git+https://github.com/progwolff/performer.git')
md5sums=('SKIP')

_gitroot="https://github.com/progwolff/performer.git"
_gitname=performer

pkgver() {
  cd "$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir"

  mkdir -p build
  cd build

  cmake ../${_gitname} -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
}


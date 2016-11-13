pkgname=performer-git
pkgver=r24.bb992d5
pkgrel=1
pkgdesc="Session manager for live audio performances"
arch=('i686' 'x86_64')
url="https://github.com/progwolff/performer"
provides=('performer-git')
license=("GPL")
depends=('carla' 'kdebase-runtime' 'kparts') 
makedepends=('git' 'extra-cmake-modules' 'qt5-tools' 'python')
optdepends=('okular-git: display notes or chords')
source=('performer::git+https://github.com/progwolff/performer.git')
md5sums=('SKIP')

_gitroot="https://github.com/progwolff/performer.git"
_gitname=performer

pkgver() {
  cd "$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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


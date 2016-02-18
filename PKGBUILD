# $Id$
# Maintainer: Peter Strapp <peter at strapp.co.uk>

pkgname=openskyimager-git
pkgver=r233.d4c6f91
pkgrel=1
url="https://github.com/OpenSkyProject/OpenSkyImager"
license=(GPL3)
arch=(i686 x86_64)
depends=(cfitsio fxload gtk3 glib2 libvorbis libnova libqhy-git)
makedepends=(cmake boost)
source=("git+https://github.com/OpenSkyProject/OpenSkyImager.git")
sha1sums=('SKIP')

_gitname='OpenSkyImager'

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  cd "$_gitname"
  sed -e '/Will add QHY firmwares/d' -i CMakeLists.txt                              # Disable build of QHY firmware,
  sed -e 's/add_subdirectory[(]qhy[)]/#add_subdirectory(qhy)/' -i CMakeLists.txt    #   install libqhy-git instead
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DFORCE_QHY_ONLY=off ../${_gitname}
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
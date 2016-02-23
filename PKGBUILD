# $Id$
# Maintainer: Peter Strapp <peter at strapp.co.uk>

pkgname=libqhy-git
pkgver=r77.1f33871
pkgrel=1
pkgdesc="SDK including firmware and drivers for QHY astronomy camaras."
url="https://github.com/qhyccd-lzr/QHYCCD_Linux"
license=(GPL2)
arch=(i686 x86_64)
depends=(libusb)
makedepends=(cmake boost git)
source=("git+https://github.com/qhyccd-lzr/QHYCCD_Linux.git")
sha1sums=('SKIP')

_gitname='QHYCCD_Linux'

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  cd "$_gitname"
  sed -e 's|[“”]|"|g' -i CMakeLists.txt                                                         # Fix for bad character encoding
  sed -e 's|"\/lib|"${CMAKE_INSTALL_PREFIX}/lib|g' -i CMakeLists.txt                            # Allow installing outside of /lib
  sed -e 's|\} ${LIB_INSTALL_DIR}|} '"${pkgdir}"'${LIB_INSTALL_DIR}|g' -i CMakeLists.txt        # Create symlinks inside the package
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../${_gitname}
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
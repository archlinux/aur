# Contributor: Flamelab <panosfilip@gmail.com> 
# PKGBUILD based on libkface-svn. Contributors:
# Chris Heien <chris.h.heien@gmail.com>
# Dany Martineau <dany.luc.martineau at gmail.com>

pkgname=libkface-git
pkgver=r780.ec6e823
pkgrel=1
pkgdesc='A Qt/C++ wrapper around LibFace library to perform face recognition and detection over pictures'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('qt5-base' 'opencv')
makedepends=('git' 'extra-cmake-modules-git' 'kdoctools')
conflicts=('libkface')
provides=('libkface')
groups=('digikamsc-git')
source=('libkface::git+git://anongit.kde.org/libkface')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/libkface"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
if [[ -d "${srcdir}/build" ]]; then
      msg "Cleaning the previous build directory..."
      rm -rf "${srcdir}/build"
  fi
  mkdir "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake "${srcdir}/libkface" -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=lib \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
                -DBUILD_TESTING=OFF -DENABLE_OPENCV3=ON
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}

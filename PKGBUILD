# Maintainer: Timo Sarawinski <timo@it-kraut.net>

pkgname=openjpeg2-git
_pkgname=openjpeg2
pkgver=2.3.2.r2787.647f9b11
pkgrel=1
pkgdesc="An open source JPEG 2000 codec, version ${pkgver}"
arch=(x86_64)
license=('custom: BSD')
url="https://github.com/uclouvain/openjpeg"
makedepends=('cmake' 'doxygen')
depends=('zlib' 'libpng' 'libtiff' 'lcms2')
provides=('openjpeg2')
conflicts=('openjpeg2')
replaces=('openjpeg2')
source=(openjpeg2::git+https://github.com/uclouvain/openjpeg)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"
  mkdir build

  # Install doxygen docs to the right directory
  sed -i -e "s:DESTINATION\ share/doc:DESTINATION\ share/doc/${_pkgname}:" openjpeg2/doc/CMakeLists.txt
}

build() {
  cd "${srcdir}/build"

  cmake "../openjpeg2" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_STATIC_LIBS=OFF \
    -DBUILD_DOC=on

  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  
  install -m755 -d "${pkgdir}/usr/share/licenses/openjpeg2"
  mv "${pkgdir}"/usr/share/doc/openjpeg-*/LICENSE "${pkgdir}"/usr/share/licenses/openjpeg2
  rmdir "${pkgdir}"/usr/share/doc/openjpeg-*
}

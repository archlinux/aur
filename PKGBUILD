
pkgbase=oyranos-git
pkgname=('oyranos-qt4-git' 'oyranos-qt5-git')
pkgver=0.9.5.625.gb685ebf
pkgrel=1
pkgdesc="A Colour Management System (CMS) on operating system level. (GIT version)"
arch=('i686' 'x86_64')
url="http://www.oyranos.org/kolormanager/"
license=('BSD')
makedepends=('qt4' 'qt5-base' 'git' 'cmake' 'exiv2' 'elektra-git' 'libxcm-git' 'libraw' 'fltk' 'xcalib' 'cairo' 'libcups' 'libxrandr')
conflicts=('oyranos')
source=('git+https://github.com/oyranos-cms/oyranos.git')
sha1sums=('SKIP')

pkgver() {
  cd oyranos
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build-qt{4,5}
}

build() {
  cd "${srcdir}/build-qt4"
  cmake ../oyranos \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_Qt4=ON
  make

  cd "${srcdir}/build-qt5"
  cmake ../oyranos \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_Qt4=OFF
  make
}

package_oyranos-qt4-git() {
  pkgdesc="A Colour Management System (CMS) on operating system level. build with Qt4 tools (GIT version)"
  conflicts=('oyranos-qt5-git')
  provides=('oyranos' 'oyranos-qt4')
  depends=('qt4' 'exiv2' 'elektra-git' 'libxcm-git' 'libraw' 'fltk' 'xcalib' 'cairo' 'libcups')
  install=oyranos-git.install

  make -C build-qt4 DESTDIR="${pkgdir}" install
  install -Dm644 oyranos/COPYING.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Fix references to SRCDIR
  for i in $(find ${pkgdir}/usr/share/doc -type f); do sed 's|&#45;git|-git|g' -i ${i} ;done
  for i in $(find ${pkgdir}/usr/share/doc -type f); do sed "s|${srcdir}|/usr/share/doc|g" -i ${i} ;done
  sed -e "s|${srcdir}/build|\"\"|g" -e "s|${srcdir}/oyranos|\"\"|g" -i "${pkgdir}/usr/bin/oyranos-config"
}

package_oyranos-qt5-git() {
  pkgdesc="A Colour Management System (CMS) on operating system level. build with Qt5 tools (GIT version)"
  conflicts=('oyranos-qt4-git')
  provides=('oyranos' 'oyranos-qt5')
  depends=('qt5-x11extras' 'exiv2' 'elektra-git' 'libxcm-git' 'libraw' 'fltk' 'xcalib' 'cairo' 'libcups' 'libxrandr')
  install=oyranos-git.install

  make -C build-qt5 DESTDIR="${pkgdir}" install
  install -Dm644 oyranos/COPYING.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Fix references to SRCDIR
  for i in $(find ${pkgdir}/usr/share/doc -type f); do sed 's|&#45;git|-git|g' -i ${i} ;done
  for i in $(find ${pkgdir}/usr/share/doc -type f); do sed "s|${srcdir}|/usr/share/doc|g" -i ${i} ;done
  sed -e "s|${srcdir}/build|\"\"|g" -e "s|${srcdir}/oyranos|\"\"|g" -i "${pkgdir}/usr/bin/oyranos-config"
}

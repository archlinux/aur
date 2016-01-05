
pkgname=oyranos-git
pkgver=0.9.5.681.gf48ba00
pkgrel=1
pkgdesc="A Colour Management System (CMS) on operating system level. (GIT version)"
arch=('i686' 'x86_64')
url='http://www.oyranos.org/kolormanager'
license=('BSD')

depends=('libxcm-git'
         'libxrandr'
         'elektra-git'
         'fltk'
         'cairo'
         )
makedepends+=('git'
             'cmake'
             'qt5-tools'
             'doxygen'
             'graphviz'
             'sane'
             'libraw'
             'exiv2'
             'libcups'
             'lcms'
             'lcms2'
             'qt5-x11extras'
             )
optdepends=('xcalib'
            'openicc'
            'sane: sane module'
            'libraw: lraw module'
            'lcms: lcms module'
            'lcms2: lcms2 module'
            'exiv2: lraw & oyRE module'
            'libcups: CUPS module'
            'qt5-x11extras: qcmsevents'
            )
conflicts=('oyranos')
provides=('oyranos')
source=('git+https://github.com/oyranos-cms/oyranos.git')
sha1sums=('SKIP')
install=oyranos-git.install

pkgver() {
  cd oyranos
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../oyranos \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_Qt4=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 oyranos/COPYING.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Fix references to SRCDIR
  for i in $(find ${pkgdir}/usr/share/doc -type f); do sed 's|&#45;git|-git|g' -i ${i} ;done
  for i in $(find ${pkgdir}/usr/share/doc -type f); do sed "s|${srcdir}|/usr/share/doc|g" -i ${i} ;done
  sed -e "s|${srcdir}/build|\"\"|g" -e "s|${srcdir}/oyranos|\"\"|g" -i "${pkgdir}/usr/bin/oyranos-config"
}

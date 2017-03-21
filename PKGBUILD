# Maintainer: bartus szczepaniak <aur@bartus.33mail.com>
name=colmap
pkgname=${name}-git
pkgver=2.1.r71.g0a93918
pkgrel=1
pkgdesc="COLMAP is a general-purpose Structure-from-Motion (SfM) and Multi-View Stereo (MVS) pipeline with a graphical and command-line interface."
arch=('i686' 'x86_64')
url="https://colmap.github.io/"
license=('GPL')
groups=()
depends=('suitesparse' 'freeglut' 'glew' 'google-glog' 'freeimage' 'boost-libs' 'qt5-base')
makedepends=('git' 'cmake' 'gcc5' 'eigen') #gcc5 to fix cud 8.0 compatibility issue.
provides=()
options=()
install=${pkgname}.install
source=("${pkgname}::git+https://github.com/colmap/colmap.git"
        "${pkgname}.install"
        "${name}.desktop")
md5sums=('SKIP'
         'ebb1dc43e014a1e720a06422c6248a40'
         '55d81534d969cf706719007462f20443')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd ${srcdir}/${pkgname}

  mkdir -p build
  cd build
  cmake -DTESTS_ENABLED=OFF -DCUDA_HOST_COMPILER=/usr/bin/gcc-5 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}


package() {
  cd ${srcdir}/${pkgname}/build
  make DESTDIR=${pkgdir} install

  # install desktop entry
  install -d -m755 "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/${name}.desktop" "${pkgdir}/usr/share/applications"
  sed -i "s#Version=.*#Version=$pkgver#" "${pkgdir}/usr/share/applications/${name}.desktop"
}

# vim:set ts=2 sw=2 et:

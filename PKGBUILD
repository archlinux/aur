# Maintainer: Eric Berquist <eric.berquist at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=avogadro
pkgver=1.2.0
pkgrel=6
pkgdesc="An advanced molecular editor based on Qt"
arch=('x86_64')
url="http://avogadro.openmolecules.net/wiki/Main_Page"
license=('GPL2')
depends=('openbabel' 'python2-pyqt4' 'boost-libs' 'glew' 'python2-numpy')
makedepends=('cmake' 'boost' 'doxygen' 'libgl' 'eigen2' 'libmsym-git')
options=('!emptydirs')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'boost153.patch'
        'avogadro-glibc2.23.patch'
        'avogadro-fix-linking.patch'
        'avogadro-force-eigen2.patch')
sha256sums=('6453e36e8ae3e61655cbe062df6d6fa6b2409122c7b5abc0a6f1d410a181640b'
            '0aaddbac2ed6e9688d7923a303b68c229f435068372f3665d731b1b9fa1d8cfb'
            '8ea373a31466fba7442e57616e0f9031ba22f530c5b5481bf0027b38438e6b2d'
            '3f7a236ec59684762514e81f8211cee625a44af843c8ce401e1ee002786e9d31'
            '9619aaf87f7d8be838a421b380e2a468473e15e119bc1a14dba85681e58c1700')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"  

  patch -p1 -i "${srcdir}"/boost153.patch
  # Fix build with glibc 2.23
  patch -p1 -i "${srcdir}"/avogadro-glibc2.23.patch
  # Fix linking (Fedora)
  patch -p1 -i "${srcdir}"/avogadro-fix-linking.patch
  # Force Eigen 2, newer versions of Eigen 3 remove backward
  # compatibility
  patch -p1 -i "${srcdir}"/avogadro-force-eigen2.patch

  mkdir -p build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  cmake "${srcdir}/${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DQT_MKSPECS_RELATIVE=share/qt4/mkspecs

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}" install

  # The packaged libmsym conflicts with the system version.
  find ${pkgdir} -type d -name "*msym*" -exec rm -r '{}' +
}

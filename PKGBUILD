# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=meshlab
pkgver=1.3.3
pkgrel=3
pkgdesc="System for processing and editing triangular meshes"
arch=('i686' 'x86_64')
url="http://meshlab.sourceforge.net/"
license=('GPL2')
depends=('bzip2' 'desktop-file-utils' 'glu' 'lapack' 'mpir' 'openssl' 'qt4')
install="${pkgname}.install"
source=("http://downloads.sourceforge.net/project/meshlab/meshlab/MeshLab%20v${pkgver//[a-z]/}/MeshLabSrc_AllInc_v${pkgver//./}.tgz"
        "gcc-4.7.patch"
        "lapack.patch"
        "mpir.patch"
        "rpath.patch"
        "qt-4.8.patch"
        "meshlab.1"
        "meshlabserver.1"
        "meshlab.desktop")
noextract=("MeshLabSrc_AllInc_v${pkgver//./}.tgz")
md5sums=('cbdd83d4f3ed69e7a9837c34ebae307a'
         '65d7ff92ad2d6e74119af9c0e377bb37'
         '4139d3217f1540c67306545213126391'
         '581064adf1319814a33b05d0af37a340'
         '2cc1246fc1b01029ae762c82a7dbf364'
         '1df4ee299f4ad996a05e80d9cf5e5389'
         '32a52b0a8dab1b4816b028b463e7fd9c'
         '0af205a93961dbfcb6b003765f79c4cf'
         '18aed0a21276a22325bf8c32166fb110')

prepare() {
  cd "${srcdir}"

  tar -zxf "MeshLabSrc_AllInc_v${pkgver//./}.tgz"

  # remove bundled headers and libraries
  rm -fr meshlab/src/external/{inc,lib}

  # fix compile errors with GCC 4.7
  patch -Np0 -i "${srcdir}/qt-4.8.patch"
  # fix Qt 4.8 compatibility
  patch -Np1 -i "${srcdir}/gcc-4.7.patch"

  cd "${srcdir}/meshlab/src"
  # build levmar with lapack
  patch -Np2 -i "${srcdir}/lapack.patch"
  # use system mpir
  patch -Np2 -i "${srcdir}/mpir.patch"
  # fix rpath
  patch -Np2 -i "${srcdir}/rpath.patch"
}

build() {
  cd "${srcdir}/meshlab/src"

  # build external libraries
  cd external
  qmake-qt4 -recursive external.pro
  make

  # build meshlab
  cd ..
  qmake-qt4 -recursive meshlab_full.pro
  make
}

package() {
  cd "${srcdir}/meshlab/src"

  # install meshlab
  install -d -m755 "${pkgdir}/opt"
  cp -a distrib "${pkgdir}/opt/meshlab"

  # add symbolic links for executables
  install -d -m755 "${pkgdir}/usr/bin"
  ln -s ../../opt/meshlab/meshlab "${pkgdir}/usr/bin/meshlab"
  ln -s ../../opt/meshlab/meshlabserver "${pkgdir}/usr/bin/meshlabserver"

  # install man pages
  install -d -m755 "${pkgdir}/usr/share/man/man1"
  install -m644 "${srcdir}/meshlab.1" "${pkgdir}"/usr/share/man/man1
  install -m644 "${srcdir}/meshlabserver.1" "${pkgdir}"/usr/share/man/man1

  # install icons
  install -d -m755 "${pkgdir}/usr/share/pixmaps"
  install -m644 "${srcdir}/meshlab/src/meshlab/images/eye_cropped.png" "${pkgdir}/usr/share/pixmaps/meshlab.png"

  # install desktop entry
  install -d -m755 "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/meshlab.desktop" "${pkgdir}/usr/share/applications"
  sed -i "s#Version=.*#Version=$pkgver#" "${pkgdir}/usr/share/applications/meshlab.desktop"
}

# vim:set ts=2 sw=2 et:

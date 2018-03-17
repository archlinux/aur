# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgbase=opencascade7
pkgname=('opencascade7' 'opencascade7-docs')
pkgver=7.2.0
pkgrel=2
pkgdesc="3D modeling & numerical simulation SDK"
url="http://www.opencascade.org"
arch=('i686' 'x86_64')
license=('custom')
makedepends=('libx11' 'cmake' 'qt5-webkit' 'gl2ps' 'freeimage' 'tk' 'glu' 'libxmu' 'vtk'
             'intel-tbb' 'doxygen' 'graphviz')
source=("opencascade-${pkgver}.tar.gz::http://git.dev.opencascade.org/gitweb/?p=occt.git;a=snapshot;h=refs/tags/V${pkgver//./_};sf=tgz"
        "fix-install-dir-references.patch")
md5sums=('SKIP'
         '9614204ad945c1fcfa4c2c058c9d0423')

prepare(){
  cd "occt-V${pkgver//./_}"
  patch -Np1 -i "$srcdir/fix-install-dir-references.patch"
  sed -i 's,#include <xlocale.h>,#include <X11/Xlocale.h>,g' src/Standard/Standard_CLocaleSentry.hxx
  sed -i s/InsertNextTupleValue/InsertNextTypedTuple/ src/IVtkVTK/IVtkVTK_ShapeData.cxx
}

build() {
  cd "occt-V${pkgver//./_}"
  mkdir -p build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/${pkgbase} \
    -DCMAKE_INSTALL_RPATH=/opt/${pkgbase}/lib \
    -DUSE_GL2PS=ON \
    -D3RDPARTY_GL2PS_DIR= \
    -DUSE_FREEIMAGE=ON \
    -DUSE_TBB=ON \
    -DUSE_VTK=ON \
    -DUSE_TBB=ON

  make

  # Documentation must be built separately.
  ../gendoc -html -overview
  ../gendoc -html -refman
}

package_opencascade7() {
  depends=('gl2ps' 'freeimage' 'tk' 'glu' 'libxmu' 'vtk' 'intel-tbb')
  cd "occt-V${pkgver//./_}/build"
  make DESTDIR="${pkgdir}" install

  # Remove doc folder with licence files (wrong location).
  rm -R "${pkgdir}/opt/${pkgbase}/share/doc"

  # Install license files into the right location.
  install -Dm644 ../LICENSE_LGPL_21.txt -t "${pkgdir}/usr/share/licenses/${pkgbase}/"
  install -Dm644 ../OCCT_LGPL_EXCEPTION.txt -t "${pkgdir}/usr/share/licenses/${pkgbase}/"

  # Fix permission of draw.sh script.
  chmod 755 "${pkgdir}/opt/${pkgbase}/bin/draw.sh"

  # Remove compile scripts. If they aren't removed opencascades
  # buildsystem tries to access (and modify?!) them in subsequent
  # build attempts. Also they are quite useless.
  rm "${pkgdir}/opt/${pkgbase}/bin/"custom*.sh
}

package_opencascade7-docs() {
  pkgdesc="3D modeling & numerical simulation SDK - documentation"
  cd "occt-V${pkgver//./_}"

  # Install separately built documentation and remove empty dir.
  install -d "${pkgdir}/usr/share/doc/${pkgbase}"
  cp -R doc/overview "${pkgdir}/usr/share/doc/${pkgbase}"
  cp -R doc/refman "${pkgdir}/usr/share/doc/${pkgbase}"
  #rm -d "${pkgdir}/usr/share/doc/${pkgbase}/overview/latex"
}
# vim:set ts=2 sw=2 et:

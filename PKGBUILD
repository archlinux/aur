# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgbase=opencascade7
pkgname=('opencascade7' 'opencascade7-docs')
pkgver=7.1.0
pkgrel=6
pkgdesc="3D modeling & numerical simulation SDK"
url="http://www.opencascade.org"
arch=('i686' 'x86_64')
license=('custom')
makedepends=('cmake' 'qt5-webkit' 'gl2ps' 'freeimage' 'tk' 'glu' 'libxmu' 'vtk'
             'intel-tbb' 'doxygen' 'graphviz')
source=("opencascade-${pkgver}.tar.gz::http://git.dev.opencascade.org/gitweb/?p=occt.git;a=snapshot;h=refs/tags/V${pkgver//./_};sf=tgz"
        "fix-install-dir-references.patch")
md5sums=('SKIP'
         '9614204ad945c1fcfa4c2c058c9d0423')

prepare(){
  cd "occt-V${pkgver//./_}"
  patch -Np1 -i "$srcdir/fix-install-dir-references.patch"

  mkdir -p build
  cd build

  flags=""
  flags="$flags -DCMAKE_BUILD_TYPE=Release"
  flags="$flags -DCMAKE_INSTALL_PREFIX=/opt/${pkgname}"
  flags="$flags -DUSE_GL2PS=ON"
  flags="$flags -D3RDPARTY_GL2PS_DIR="
  flags="$flags -DUSE_FREEIMAGE=ON"
  flags="$flags -DUSE_TBB=ON"
  flags="$flags -DUSE_VTK=ON"
  flags="$flags -DUSE_TBB=ON"

  cmake $flags ..
}

build() {
  cd "occt-V${pkgver//./_}"

  # let's use all but one core to build 
  (cd build && make -j$(nproc --ignore=1))

  # Documentation must be built separately.
  ./gendoc -html -overview
  ./gendoc -html -refman
}

package_opencascade7() {
  depends=('gl2ps' 'freeimage' 'tk' 'glu' 'libxmu' 'vtk' 'intel-tbb')
  cd "occt-V${pkgver//./_}/build"
  make DESTDIR="${pkgdir}" install

  # Remove doc folder with licence files (wrong location).
  rm -R "${pkgdir}/opt/${pkgname}/share/doc"

  # Install license files into the right location.
  install -Dm644 ../LICENSE_LGPL_21.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 ../OCCT_LGPL_EXCEPTION.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  # Fix permission of draw.sh script.
  chmod 755 "${pkgdir}/opt/${pkgname}/bin/draw.sh"

  # Remove compile scripts. If they aren't removed opencascades
  # buildsystem tries to access (and modify?!) them in subsequent
  # build attempts. Also they are quite useless.
  rm "${pkgdir}/opt/${pkgname}/bin/"custom*.sh
}

package_opencascade7-docs() {
  pkgdesc="3D modeling & numerical simulation SDK - documentation"
  cd "occt-V${pkgver//./_}"

  # Install separately built documentation and remove empty dir.
  install -d "${pkgdir}/usr/share/doc/${pkgbase}"
  cp -R doc/overview "${pkgdir}/usr/share/doc/${pkgbase}"
  cp -R doc/refman "${pkgdir}/usr/share/doc/${pkgbase}"
  rm -d "${pkgdir}/usr/share/doc/${pkgbase}/overview/latex"
}
# vim:set ts=2 sw=2 et:

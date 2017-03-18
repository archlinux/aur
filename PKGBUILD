# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=opencascade7
pkgver=7.1.0
pkgrel=5
pkgdesc="Open CASCADE Technology, 3D modeling & numerical simulation, version 7"
url="http://www.opencascade.org"
arch=('i686' 'x86_64')
license=('custom')
makedepends=('cmake' 'qt5-webkit')
depends=('gl2ps' 'freeimage' 'tk' 'glu' 'libxmu' 'vtk')
optdepends=('intel-tbb: multithreading support')
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
  #flags="$flags -D3RDPARTY_VTK_DIR=/opt/vtk6"
  #flags="$flags -D3RDPARTY_VTK_INCLUDE_DIR=/opt/vtk6/include"
  #flags="$flags -D3RDPARTY_VTK_LIBRARY_DIR=/opt/vtk6/lib"
  #flags="$flags -D3RDPARTY_VTK_BIN_DIR=/opt/vtk6/bin"
  flags="$flags -DCMAKE_INSTALL_PREFIX=/opt/${pkgname}"
  flags="$flags -DUSE_GL2PS=ON"
  flags="$flags -D3RDPARTY_GL2PS_DIR="
  flags="$flags -DUSE_FREEIMAGE=ON"
  flags="$flags -DUSE_TBB=ON"
  flags="$flags -DUSE_VTK=ON"
  #flags="$flags -DBUILD_LIBRARY_TYPE=Static"
  #flags="$flags -DBUILD_YACCLEX=ON"
  #flags="$flags -D3RDPARTY_BISON_EXECUTABLE=bison"
  #flags="$flags -D3RDPARTY_FLEX_EXECUTABLE=flex"
  if pacman -T intel-tbb > /dev/null 2>/dev/null; then
    flags="$flags -DUSE_TBB=ON"
  else
    flags="$flags -DUSE_TBB=OFF"
  fi
  cmake $flags ..
}

build() {
  cd "occt-V${pkgver//./_}/build"
  make -j$(nproc --ignore=1) #let's use all but one core to build 
}

package() {
  cd "occt-V${pkgver//./_}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE_LGPL_21.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 ../OCCT_LGPL_EXCEPTION.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  # Fix permission of draw.sh script.
  chmod 755 "${pkgdir}/opt/${pkgname}/bin/draw.sh"

  # Remove compile scripts. If they aren't removed opencascades
  # buildsystem tries to access (and modify?!) them in subsequent
  # build attempts. Also they are quite useless.
  rm "${pkgdir}/opt/${pkgname}/bin/"custom*.sh

  # Remove doc folder with licence files (wrong location).
  rm -R "${pkgdir}/opt/${pkgname}/share/doc"
  
  #install -m644 -D "${srcdir}/99_oce.conf" -t "${pkgdir}/etc/ld.so.conf.d"
  #install -m755 -D "${srcdir}/opencascade-${pkgver}/build/env.sh" -t "${pkgdir}/etc/profile.d"
}

# vim:set ts=2 sw=2 et:

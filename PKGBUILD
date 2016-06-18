# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=opencascade7
pkgver=7.0.0
pkgrel=4
pkgdesc="Open CASCADE Technology, 3D modeling & numerical simulation, version 7"
url="http://www.opencascade.org"
arch=('i686' 'x86_64')
license=('custom')
makedepends=('cmake' 'flex' 'bison')
depends=('gl2ps' 'freeimage' 'tk' 'ftgl' 'libxmu' 'vtk' 'mesa')
optdepends=('intel-tbb')
_short_commit_hash=1d505bb
#source=("http://git.dev.opencascade.org/gitweb/?p=occt.git;a=snapshot;h=${_short_commit_hash};sf=tgz")
source=("https://sources.archlinux.org/other/community/opencascade/opencascade-$pkgver.tgz")
md5sums=('fa1458aba1ce96c85d7876b35a04af6c')

prepare(){
  cd opencascade-${pkgver}
  #cd occt-${_short_commit_hash}
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
  #flags="$flags -DUSE_TBB=OFF"
  cmake $flags ..

  # this allows USE_VTK=ON to build
  sed -i 's/-lvtkRenderingOpenGL/-lvtkRenderingOpenGL2/g' src/TKIVtk/CMakeFiles/TKIVtk.dir/link.txt
  sed -i 's/-lvtkRenderingOpenGL/-lvtkRenderingOpenGL2/g' src/TKIVtkDraw/CMakeFiles/TKIVtkDraw.dir/link.txt
  sed -i 's/-lvtkRenderingFreeTypeOpenGL/-lvtkRenderingFreeTypeTCL/g' src/TKIVtk/CMakeFiles/TKIVtk.dir/link.txt
  sed -i 's/-lvtkRenderingFreeTypeOpenGL/-lvtkRenderingFreeTypeTCL/g' src/TKIVtkDraw/CMakeFiles/TKIVtkDraw.dir/link.txt
}

build() {
  cd opencascade-${pkgver}/build
  #cd occt-${_short_commit_hash}/build
  make
}

package() {
  cd opencascade-${pkgver}/build
  #cd occt-${_short_commit_hash}/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE_LGPL_21.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 ../OCCT_LGPL_EXCEPTION.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  
  #install -m644 -D "${srcdir}/99_oce.conf" -t "${pkgdir}/etc/ld.so.conf.d"
  #install -m755 -D "${srcdir}/opencascade-${pkgver}/build/env.sh" -t "${pkgdir}/etc/profile.d"
}

# vim:set ts=2 sw=2 et:

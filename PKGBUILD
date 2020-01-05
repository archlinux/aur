# $Id: PKGBUILD 243040 2015-08-05 00:47:34Z svenstaro $
# Maintainer: Philipp Mildenberger <philipp.mildenberger.. __AATT__ .. student.uibk.ac.at>
# Maintainer stable version: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgbase='bullet-git'
pkgname=('bullet-git' 'bullet-docs-git')
pkgver=2.89.r21.gb57557c6c
pkgrel=1
pkgdesc="A 3D Collision Detection and Rigid Body Dynamics Library for games and animation"
arch=('i686' 'x86_64')
url="http://www.bulletphysics.com/Bullet/"
license=('custom:zlib')
makedepends=('cmake' 'doxygen' 'graphviz' 'ttf-dejavu' 'mesa' 'glu')
optdepends=('glu: for the example browser')
source=("git+https://github.com/bulletphysics/bullet3.git")
md5sums=('SKIP')

pkgver() {
  cd bullet3
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd bullet3

  [[ -d build ]] && rm -rf build
  mkdir build && cd build 

  cmake .. \
       -DCMAKE_INSTALL_PREFIX=/usr \
       -DBUILD_SHARED_LIBS=1 \
       -DINSTALL_LIBS=1 \
       -DINSTALL_EXTRA_LIBS=1 \
       -DCMAKE_BUILD_TYPE=Release

  make

  cd ..
  #sed -i 's/GENERATE_HTMLHELP.*//g' Doxyfile
  doxygen
}

package_bullet-git() {
  optdepends=('bullet-docs: documentation')
  provides=('bullet') 
  conflicts=('bullet')

  cd bullet3/build

  # install it
  make DESTDIR=${pkgdir} install

  # install license
  install -Dm644 ../LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE
}

package_bullet-docs-git() {
  pkgdesc="Documentation for bullet"
  provides=('bullet-docs') 
  conflicts=('bullet-docs')
  depends=()

  cd bullet3

  # install docs
  install -Dm644 docs/GPU_rigidbody_using_OpenCL.pdf ${pkgdir}/usr/share/doc/bullet/GPU_rigidbody_using_OpenCL.pdf
  install -Dm644 docs/Bullet_User_Manual.pdf ${pkgdir}/usr/share/doc/bullet/Bullet_User_Manual.pdf
  install -Dm644 docs/BulletQuickstart.pdf ${pkgdir}/usr/share/doc/bullet/BulletQuickstart.pdf
  cp -r html ${pkgdir}/usr/share/doc/bullet/html  
}
# vim: sw=2 ts=2 et:

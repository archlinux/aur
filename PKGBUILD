# Maintainer: Anton T Johansson <anton@tetov.se>
# Contributor: GPereira
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Grey Christoforo <my first name [at] my last name [dot] net>

pkgname=cura-beta-git
pkgver=r18273.14c361a29
pkgrel=1
_sdkver=6.0.0
pkgdesc="A software solution for 3D printing aimed at RepRaps and the Ultimaker."
arch=('any')
url="https://ultimaker.com/en/products/cura-software"
license=('LGPL3')
depends=('curaengine-beta-git'
         'cura-binary-data'
         'cura-resources-materials'
         'libsavitar'
         'python-pyqt5'
         'python-pyserial'
         'python-scipy'
         'python-shapely'
         'qt5-svg'
         'uranium-beta-git' )
optdepends=('python-zeroconf: network printing support')
makedepends=('cmake' 'git' 'qt5-tools')
provides=('cura')
conflicts=('cura')
source=("git+https://github.com/Ultimaker/Cura#branch=4.0")
md5sums=('SKIP')

pkgver(){
  cd Cura
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# Build order
# arcus -> uranium -> curaengine -> libsavitar ->

prepare(){
  cd Cura
  sed -i 's,DESTINATION lib/python${PYTHON_VERSION_MAJOR}/dist-packages,DESTINATION lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages,g' CMakeLists.txt
  sed -i 's,DESTINATION lib/python${PYTHON_VERSION_MAJOR}/dist-packages/cura),DESTINATION lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages/cura),g' CMakeLists.txt
}

build(){
  cd Cura
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DURANIUM_SCRIPTS_DIR=/usr/share/uranium/scripts \
    -DCURA_VERSION=$pkgver \
    -DCURA_SDK_VERSION=$_sdkver

  make
}

package(){
  cd Cura/build
  make DESTDIR="${pkgdir}" install

  # make sure cura can find uranium plugins:
  ln -s /usr/lib/uranium/plugins/* "${pkgdir}/usr/lib/cura/plugins/."

  # don't ever send any user or print info through the internet to Ultimaker
  rm -rf "${pkgdir}/usr/lib/cura/plugins/SliceInfoPlugin"
}

# vim:set ts=2 sw=2 et:

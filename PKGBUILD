# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Grey Christoforo <my first name [at] my last name [dot] net>

pkgname=cura-beta
pkgver=3.5
pkgrel=1
pkgdesc="A software solution for 3D printing aimed at RepRaps and the Ultimaker."
depends=('python-pyqt5' 'qt5-svg' 'python-scipy' 'python-pyserial' 'python-numpy' 'uranium-beta'
         'curaengine-beta' 'cura-binary-data' 'cura-resources-materials' 'libsavitar' 'python-shapely')
makedepends=('qt5-tools' 'cmake')
optdepends=('python-zeroconf: network printing support')
provides=('cura')
url="https://ultimaker.com/en/products/cura-software"
license=('AGPL')
arch=('x86_64')
conflicts=('cura' 'cura-git')
source=("git+https://github.com/Ultimaker/Cura#branch=${pkgver}")
#source=($pkgname-$pkgver.tar.gz::https://github.com/Ultimaker/Cura/archive/${pkgver}.tar.gz)
sha1sums=('SKIP')

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
    -DCURA_VERSION=$pkgver

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

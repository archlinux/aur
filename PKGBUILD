# Maintainer: Grey Christoforo <my first name [at] my last name [dot] net>

pkgname=cura
pkgver=2.4.0
pkgrel=1
pkgdesc="A software solution for 3D printing aimed at RepRaps and the Ultimaker."
depends=('qt5-svg' 'python-scipy' 'python-pyserial' 'python-numpy' 'uranium' 'curaengine' 'cura-binary-data')
makedepends=('qt5-tools' 'cmake')
provides=('cura')
url="https://ultimaker.com/en/products/cura-software"
license=('AGPLv3')
arch=('i686' 'x86_64')
source=(https://github.com/Ultimaker/Cura/archive/${pkgver}.tar.gz)
sha1sums=('8f21748b27ef7e6fd7b07c2c6f81695f073a6840')

install=cura.install

prepare(){
  cd Cura-${pkgver}
  sed -i 's,DESTINATION lib/python${PYTHON_VERSION_MAJOR}/dist-packages,DESTINATION lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages,g' CMakeLists.txt
  sed -i 's,DESTINATION lib/python${PYTHON_VERSION_MAJOR}/dist-packages/cura),DESTINATION lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages/cura),g' CMakeLists.txt

  cat > "${srcdir}/${pkgname}.desktop" <<END
[Desktop Entry]
Type=Application
Name=${pkgname^}
Comment=${pkgdesc}
Exec=${pkgname}
Icon=/usr/share/cura/resources/themes/cura/icons/application.svg
Terminal=false
END
}

build(){
  cd Cura-${pkgver}
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DURANIUM_SCRIPTS_DIR=/usr/share/uranium/scripts

  make
}

package(){
  cd Cura-${pkgver}/build
  make DESTDIR="${pkgdir}" install
  
  # make sure cura can find uranium plugins:
  ln -s /usr/lib/uranium/plugins/* "${pkgdir}/usr/lib/cura/plugins/."

  # don't ever send any user or print info through the internet to Ultimaker
  rm -rf "${pkgdir}/usr/lib/cura/plugins/SliceInfoPlugin"

  # install .desktop file
  install -D -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"

}



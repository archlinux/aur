# Maintainer: Grey Christoforo <my first name [at] my last name [dot] net>

pkgname=cura
pkgver=2.1.3
pkgrel=1
pkgdesc="A software solution for 3D printing aimed at RepRaps and the Ultimaker."
depends=('qt5-svg' 'python-pyserial' 'python-numpy' 'uranium' 'curaengine')
makedepends=('qt5-tools' 'cmake')
provides=('cura')
url="https://ultimaker.com/en/products/cura-software"
license=('AGPLv3')
arch=('i686' 'x86_64')
source=(https://github.com/Ultimaker/Cura/archive/${pkgver}.tar.gz fix-python-dir.patch)
sha1sums=('6318bea1603bbf3e43202f0894780de433c97410'
          '439a5efb8371bbfd1266a6b6434c0584f00baaa9')

install=cura.install

prepare(){
  cd Cura-${pkgver}
  patch -Np1 -i ../fix-python-dir.patch

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



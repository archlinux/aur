# Contributor: Todd Musall 
# Contributor: dront78 (Ivan)
# Contributor: Victor Noel
# Maintainer: ngoonee
pkgname=('heimdall')
pkgver=1.4.1
pkgrel=1
pkgdesc="Heimdall is a cross-platform open-source utility to flash firmware (aka ROMs) onto Samsung Galaxy S devices."
arch=('i686' 'x86_64')
url="http://www.glassechidna.com.au/products/heimdall/"
license=('MIT')
depends=('libusb' 'qt4')
optdepends=('android-udev: Udev rules to connect Android devices to your linux box')
makedepends=('gcc')
source=("heimdall-${pkgver}.tar.gz::https://github.com/Benjamin-Dobell/Heimdall/archive/v${pkgver}.tar.gz"
        'heimdall.desktop')

build() {
  cd ${srcdir}/Heimdall-${pkgver}

  # Build libpit which is needed for compiling heimdall
  cd libpit/
  ./configure --prefix=/usr
  # Default makefile removes libpit.1.4.a which is needed by frontend
  #sed -i '/rm -f libpit-1.4.a/d' Makefile
  make

  # Build heimdall command line tool
  cd ../heimdall/
  
  ./configure --prefix=/usr
  make

  # Build heimdall GUI front end
  cd ../heimdall-frontend/

  env OUTPUTDIR="/usr/bin" qmake-qt4 heimdall-frontend.pro
  make
}

package() {
  cd ${srcdir}/Heimdall-${pkgver}

  # Install license file
  #install -m644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install heimdall command line tool
  cd heimdall/

  # Prevent make install from trying to reload udev
  # We'll do this the Arch way at package install time
  mv Makefile Makefile.orig
  sed -e 's/sudo service udev restart/echo sudo service udev restart/' <Makefile.orig >Makefile

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/lib/"

  # Install heimdall GUI front end
  cd ../heimdall-frontend
  # hack to place heimdall-frontend in /usr/bin
  sed -i 's|local\/||g' Makefile
  make INSTALL_ROOT="${pkgdir}/" install
  install -m644 -D "${srcdir}/heimdall.desktop" "${pkgdir}/usr/share/applications/heimdall.desktop"
}
md5sums=('22c911e9042f5ed8fd90cbeeb9589015'
         '6c4de9e74c0d9e7ab4d50af21303b78a')

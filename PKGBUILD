# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=bus-pirate
pkgver=2.3.8
pkgrel=5
pkgdesc="Software and firmware for an open source hacker multi-tool that talks to electronic stuff"
url="http://dangerousprototypes.com/docs/Bus_Pirate"
arch=('any')
license=('CC-0' 'GPL')
depends=('qt5-base' 'python2')
install=$pkgname.install
source=("https://github.com/greyltc/Bus_Pirate/archive/v${pkgver}.tar.gz" "25_busBirate.rules")

options=(!strip docs libtool emptydirs !zipman staticlibs)
md5sums=('1505bf7377d52a4e459ba3a7373e4fb0'
         'd939da558d713e498afc4343bc75ba47')

prepare() {
  cd "${srcdir}/Bus_Pirate-${pkgver}/scripts/BusPirateGUI"
  qmake
}

build() {
  msg2 "building QT5 GUI"
  cd "${srcdir}/Bus_Pirate-${pkgver}/scripts/BusPirateGUI"
  make
  cp build/BusPirateGui .
  make distclean
  
  msg2 "building firmware flasher"
  cd "${srcdir}/Bus_Pirate-${pkgver}/package/BPv4-firmware/pirate-loader-v4-source"
  bash build-unix.sh

  msg2 "building SPI sniffer"
  cd "${srcdir}/Bus_Pirate-${pkgver}/scripts/powertools/SPISniffer/linux-version"
  make
}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -a Bus_Pirate-${pkgver}/* "${pkgdir}/opt/${pkgname}/."

  mkdir -p "${pkgdir}/etc/udev/rules.d/"
  cp 25_busBirate.rules "${pkgdir}/etc/udev/rules.d/."

  msg2 "packaging pyBusPirateLite"
  cd "${srcdir}/Bus_Pirate-${pkgver}/scripts/pyBusPirateLite"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  #python2 setup.py install --root="$pkgdir/"

  # link exes
  mkdir -p ${pkgdir}/usr/bin
  ln -s /opt/${pkgname}/package/BPv4-firmware/pirate-loader-v4-source/pirate-loader_lnx ${pkgdir}/usr/bin/pirate-loader
  ln -s /opt/${pkgname}/scripts/BusPirateGUI/BusPirateGui ${pkgdir}/usr/bin/bus-pirate-gui
  ln -s /opt/${pkgname}/scripts/powertools/SPISniffer/linux-version/spisniffer ${pkgdir}/usr/bin/spi-sniffer
}

# vim:set ts=2 sw=2 et:


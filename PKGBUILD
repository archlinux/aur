# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=bus-pirate
pkgver=2.3.5
pkgrel=1
pkgdesc="Software and firmware for an open source hacker multi-tool that talks to electronic stuff"
url="http://dangerousprototypes.com/docs/Bus_Pirate"
arch=('any')
license=('CC-0' 'GPL')
depends=('qtchooser')
install=$pkgname.install
source=("https://github.com/greyltc/Bus_Pirate/archive/v${pkgver}.tar.gz" "25_busBirate.rules")

options=(!strip docs libtool emptydirs !zipman staticlibs !upx)
md5sums=('b7a70e3d88d4361cd89d081c89c6f790'
         'd939da558d713e498afc4343bc75ba47')

prepare() {
  cd "${srcdir}/Bus_Pirate-${pkgver}/scripts/BusPirateGUI"
  qmake
}

build() {
  cd "${srcdir}/Bus_Pirate-${pkgver}/scripts/BusPirateGUI"
  make
  cp build/BusPirateGui .
  make distclean
  cd "${srcdir}/Bus_Pirate-${pkgver}/package/BPv4-firmware/pirate-loader-v4-source"
  bash build-unix.sh
}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -a Bus_Pirate-${pkgver}/* "${pkgdir}/opt/${pkgname}/."

  # link exes
  mkdir -p ${pkgdir}/usr/bin
  ln -s /opt/${pkgname}/package/BPv4-firmware/pirate-loader-v4-source/pirate-loader_lnx ${pkgdir}/usr/bin/pirate-loader
  ln -s /opt/${pkgname}/scripts/BusPirateGUI/BusPirateGui ${pkgdir}/usr/bin/bus-pirate-gui
}

# vim:set ts=2 sw=2 et:


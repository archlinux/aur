# Maintainer: Carsten Feuls (DL1CAF) <archlinux@carstenfeuls.de
# Contributer: Amateurfunk Station der Hochschule Niederrhein (DF0FN) <df0fn@hs-niederrhein.de>

pkgname=('svxlink')
pkgver="24.02"
pkgrel=1
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://sourceforge.net/projects/svxlink/"
license=('GPL')
source=("https://github.com/sm0svx/${pkgname}/archive/${pkgver}.tar.gz"
	"svxlink.service"
	"remotetrx.service")
sha256sums=('27095fd0a06e3bf7bd597f0472d568d5a651a7f9deab30f1489a1291f05c5e9c'
            'adc29c81df1794b62bd47202af388397c886cc86a95fa05b3446b3a93a1b3a7c'
            '41adf7f9863f1ea3013b079e628455a22c29d1b369d174bd19905334c9c31543')
depends=('alsa-utils' 'alsa-lib' 'libsigc++' 'gsm' 'libgcrypt' 'popt' 'tcl' 'speex' 'opus')
makedepends=('cmake')
pkgdesc="Echolink Software to provide Ham Radio Voip Operations"
optdepends=('svxlink-sounds-en_us-heather-8k: provides speech sound files in medium quality')
backup=('etc/svxlink/svxlink.conf'
	'etc/svxlink/TclVoiceMail.conf'
	'etc/svxlink/remotetrx.conf'
	'etc/svxlink/svxlink.d/ModuleDtmfRepeater.conf'
	'etc/svxlink/svxlink.d/ModuleEchoLink.conf'
	'etc/svxlink/svxlink.d/ModuleHelp.conf'
	'etc/svxlink/svxlink.d/ModuleMetarInfo.conf'
	'etc/svxlink/svxlink.d/ModuleParrot.conf'
	'etc/svxlink/svxlink.d/ModulePropagationMonitor.conf'
	'etc/svxlink/svxlink.d/ModuleSelCallEnc.conf'
	'etc/svxlink/svxlink.d/ModuleTclVoiceMail.conf')
install=svxlink.install

build(){
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  mkdir -p build 
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONF_INSTALL_DIR=/etc -DLOCAL_STATE_DIR=/var -DUSE_QT=NO -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_LIBEXECDIR:PATH=lib -DSBIN_INSTALL_DIR=/usr/bin ..
  make
  make doc
}

package(){
  make -C ${srcdir}/${pkgname}-${pkgver}/src/build DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  mkdir -p "${pkgdir}/var/spool/svxlink"
  # svxlink systemd service file
  cp ${srcdir}/svxlink.service ${pkgdir}/usr/lib/systemd/system
  cp ${srcdir}/remotetrx.service ${pkgdir}/usr/lib/systemd/system
}

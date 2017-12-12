# Maintainer: Nils Czernia (DL1CAF) <nils@czserver.de>
# Based on the package of Carsten Feuls
# Contributer: Amateurfunk Station der Hochschule Niederrhein (DF0FN) <df0fn@hs-niederrhein.de>

pkgname=('svxlink-git')
_pkgname=('svxlink')
pkgver=14.08.2.766.g380e5333
pkgrel=1
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://sourceforge.net/projects/svxlink/"
license=('GPL')
source=("${_pkgname}::git+https://github.com/sm0svx/svxlink.git"
	"svxlink.service"
	"remotetrx.service")
sha256sums=('SKIP'
            'adc29c81df1794b62bd47202af388397c886cc86a95fa05b3446b3a93a1b3a7c'
            '41adf7f9863f1ea3013b079e628455a22c29d1b369d174bd19905334c9c31543')
depends=('alsa-utils' 'alsa-lib' 'libsigc++' 'gsm' 'libgcrypt' 'popt' 'tcl' 'speex' 'opus')
makedepends=('cmake')
pkgdesc="Echolink Software to provide Ham Radio Voip Operations"
optdepends=('svxlink-sounds-en_us-heather-8k: provides speech sound files in medium quality'
            'svxlink-sounds-en_us-heather-16k: provides speech sound files in high quality')
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

pkgver() {
  cd "$_pkgname"
  git describe --always | sed -e 's|-|.|g'
}

build(){
  cd "${srcdir}/${_pkgname}/src"
  mkdir -p build 
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONF_INSTALL_DIR=/etc -DLOCAL_STATE_DIR=/var -DUSE_QT=NO ..
  make
  make doc
}

package(){
  make -C ${srcdir}/${_pkgname}/src/build DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  mkdir -p "${pkgdir}/var/spool/svxlink"
  # svxlink systemd service file
  cp ${srcdir}/svxlink.service ${pkgdir}/usr/lib/systemd/system
  cp ${srcdir}/remotetrx.service ${pkgdir}/usr/lib/systemd/system
}

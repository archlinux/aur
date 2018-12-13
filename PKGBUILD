# Maintainer: Parker Reed <parker.l.reed@gmail.com>
# Maintainer: Daniel Kamil Kozar <dkk089@gmail.com>

pkgname=vfs495-daemon
_realver=4.5-136.0
pkgver=${_realver//-/_}
pkgrel=3
pkgdesc="Userspace driver for VFS495 fingerprint readers"
arch=('x86_64')
url=""
license=('unknown')
depends=('openssl098' 'libusb-compat')
makedepends=('rpmextract')
install='vfs495-daemon.install'
provides=('vfs495-daemon')
# source comes straight from the HP driver site for this laptop model, which
# includes the VFS495 :
# https://support.hp.com/us-en/drivers/selfservice/hp-probook-470-g0-notebook-pc/5350448
_softpaq='sp84530.tar'
source=("https://ftp.hp.com/pub/softpaq/sp84501-85000/${_softpaq}"
        'vfs495-daemon.service'
        'vfs495-sleep')
noextract=(${_softpaq})
md5sums=('9877c69c4f4b57a00f9e4afbcd9baacc'
         'ebe697d6fac43645191e2fad74bad99f'
         'a2edc66e120d073211f7ded3aeedd7d0')

build() {
  cd "${srcdir}/"

  bsdtar xf "${_softpaq}" --strip-components 1
  rpmextract.sh Validity-Sensor-Setup-${_realver}.x86_64.rpm

  rm -rf usr/lib64/
  rm -rf usr/lib/pm-utils
  mv usr/share/doc/packages/validity usr/share/doc/vfs495-daemon
  rm -fR usr/share/doc/packages
  mv usr/sbin/* usr/bin/
  rmdir usr/sbin/
}

package() {
  cd "${srcdir}/"

  cp -R usr/ "${pkgdir}/"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  cp vfs495-daemon.service "${pkgdir}/usr/lib/systemd/system"
  mkdir -p "${pkgdir}/usr/lib/systemd/system-sleep"
  cp vfs495-sleep "${pkgdir}/usr/lib/systemd/system-sleep"
}

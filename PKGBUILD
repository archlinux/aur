# Maintainer: Parker Reed <parker.l.reed@gmail.com>
# Maintainer: Daniel Kamil Kozar <dkk089@gmail.com>

pkgname=vfs495-daemon
_realver=4.5-136.0
pkgver=${_realver//-/_}
pkgrel=5
pkgdesc="Userspace driver for VFS495 fingerprint readers"
arch=('x86_64')
url=""
license=('unknown')
depends=('openssl098' 'libusb-compat')
makedepends=('rpmextract' 'chrpath')
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

prepare() {
  bsdtar xf "${_softpaq}" --strip-components 1
  rpmextract.sh Validity-Sensor-Setup-${_realver}.x86_64.rpm
}

package() {
  cd "${srcdir}"

  install -m 644 -D -t "${pkgdir}/usr/lib/systemd/system" vfs495-daemon.service
  install -m 644 -D -t "${pkgdir}/usr/share/doc/vfs495-daemon" usr/share/doc/packages/validity/*

  install -D -t "${pkgdir}/usr/lib/systemd/system-sleep" vfs495-sleep

  chrpath -d usr/lib/libvfsFprintWrapper.so usr/bin/vcsFPService
  install -D -t "${pkgdir}/usr/lib" usr/lib/libvfsFprintWrapper.so
  install -D -t "${pkgdir}/usr/bin" usr/bin/vcsFPService

  # the stuff in /sbin doesn't seem used anywhere, although both the
  # vcsFPService and validity-sensor binaries contain strings with paths to
  # /usr/sbin/HPUsbVFS[*].img . however, they have always been installed to
  # /usr/bin via this package and it doesn't seem to have caused any issues, so
  # I'm leaving them off for now.
}

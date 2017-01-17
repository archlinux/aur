# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgbase=razer-drivers-git
pkgname=('python-razer-git' 'razer-daemon-git' 'razer-driver-dkms-git')
pkgver=1.1.7.r0.gfd40ae6
pkgrel=1
pkgdesc="An entirely open source driver and user-space daemon that allows you to manage your Razer peripherals on GNU/Linux."
arch=('any')
url="https://github.com/terrycain/razer-drivers"
license=('GPL2')
makedepends=('git' 'make' 'python' 'python-setuptools')
source=("$pkgbase::git+https://github.com/terrycain/razer_drivers.git")
sha512sums=('SKIP')

pkgver() {
  cd $pkgbase
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_python-razer-git() {
  pkgdesc="A python library for controlling razer-daemon"
  depends=('razer-daemon' 'python' 'python-dbus' 'python-numpy')
  provides=('python-razer')
  conflicts=('python-razer')
  optdepends=('polychromatic: gtk frontend'
              'razercommander-git: gtk frontend')

  cd $srcdir/$pkgbase
  make DESTDIR=$pkgdir python_library_install
}

package_razer-daemon-git() {
  pkgdesc="A daemon for controlling razer-driver"
  depends=('RAZER-DRIVERS-MODULES' 'python-dbus' 'python-gobject' 'python-setproctitle' 'xautomation' 'xdotool' 'libdbus' 'python-notify2' 'python-pyudev' 'gtk3')
  # gtk3 for "gi.require_version('Gdk', '3.0')"
  provides=('razer-daemon')
  conflicts=('razer-daemon')

  cd $srcdir/$pkgbase
  make DESTDIR=$pkgdir daemon_install
}

package_razer-driver-dkms-git() {
  pkgdesc="An entirely open source driver for managing Razer peripherals on Linux. (DKMS)"
  depends=('dkms' 'udev')
  provides=('razer-driver-dkms' 'RAZER-DRIVERS-MODULES')
  conflicts=('razer-driver-dkms' 'RAZER_DRIVERS-MODULES')
  install=razer-driver-dkms-git.install
  
  cd $srcdir/$pkgbase
  make DESTDIR=$pkgdir setup_dkms udev_install
}

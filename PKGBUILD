# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Gabriele Musco <emaildigabry@gmail.com>

pkgbase=razer-drivers-git
pkgname=('python-razer-git' 'razer-daemon-git' 'razer-driver-dkms-git')
pkgver=1.1.3.r45.gcdd5fe4
pkgrel=1
pkgdesc="An entirely open source driver and user-space daemon that allows you to manage your Razer peripherals on GNU/Linux."
arch=('any')
url="https://github.com/terrycain/razer_drivers"
license=('GPL2')
makedepends=('git' 'make' 'python' 'python-setuptools')
optdepends=('polychromatic: gtk frontend'
            'razercommander-git: gtk frontend')
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

  cd $srcdir/$pkgbase
  make DESTDIR=$pkgdir python_library_install
}

package_razer-daemon-git() {
  pkgdesc="A daemon for controlling razer-driver"
  depends=('razer-driver-dkms' 'python-dbus' 'python-gobject' 'python-setproctitle' 'xautomation' 'xdotool' 'libdbus' 'python-notify2' 'python-pyudev')
  provides=('razer-daemon')
  conflicts=('razer-daemon')

  cd $srcdir/$pkgbase
  make DESTDIR=$pkgdir daemon_install
}

package_razer-driver-dkms-git() {
  pkgdesc="An entirely open source driver for managing Razer peripherals on Linux. (DKMS)"
  depends=('dkms' 'udev')
  provides=('razer-driver-dkms')
  conflicts=('razer-driver-dkms')
  install=razer-driver-dkms-git.install
  
  cd $srcdir/$pkgbase
  make DESTDIR=$pkgdir setup_dkms udev_install
}

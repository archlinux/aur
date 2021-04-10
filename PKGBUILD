# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Gabriele Musco <emaildigabry@gmail.com>

pkgbase=openrazer
pkgname=('python-openrazer' 'openrazer-daemon' 'openrazer-driver-dkms' 'openrazer-meta')
pkgver=3.0.1
pkgrel=1
pkgdesc="An entirely open source driver and user-space daemon that allows you to manage your Razer peripherals on GNU/Linux."
arch=('any')
url="https://github.com/openrazer/openrazer"
license=('GPL2')
makedepends=('python-setuptools')
source=("https://github.com/openrazer/openrazer/releases/download/v$pkgver/openrazer-$pkgver.tar.xz")
sha256sums=('b27a7ab459e5290f9fe4d56f49922f97ed83fc92ba2bc0154aff8c4cdd1de73f')

package_python-openrazer() {
  pkgdesc="Python library for accessing the Razer daemon from Python."
  depends=('openrazer-daemon' 'python-numpy')

  cd "$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" python_library_install
}

package_openrazer-daemon() {
  pkgdesc="Userspace daemon that abstracts access to the kernel driver. Provides a DBus service for applications to use."
  depends=('openrazer-driver-dkms' 'gtk3' 'python-dbus' 'python-gobject' 'python-setproctitle' 'python-daemonize' 'python-notify2' 'python-pyudev' 'xautomation')
  install=openrazer-daemon.install

  cd "$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" daemon_install
}

package_openrazer-driver-dkms() {
  pkgdesc="Kernel driver for Razer devices (DKMS-variant)"
  depends=('dkms' 'udev')
  install=openrazer-driver-dkms.install

  cd "$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" setup_dkms udev_install
}

package_openrazer-meta() {
  pkgdesc="Meta package for installing all required openrazer packages."
  depends=('openrazer-driver-dkms' 'openrazer-daemon' 'python-openrazer')
  optdepends=('polychromatic: frontend'
              'razergenie: qt frontend'
              'razercommander: gtk frontend')
}

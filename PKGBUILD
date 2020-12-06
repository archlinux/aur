# Maintainer: Mark Cowan <mark (at) battlesnake.co.uk>

# Hacked PKGBUILD to support Basilisk V2, using malsyned's unmerged branch.

# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Gabriele Musco <emaildigabry@gmail.com>

pkgbase=openrazer-basilisk-v2-git
_pkgbase=openrazer
pkgname=('python-openrazer-basilisk-v2-git' 'openrazer-daemon-basilisk-v2-git' 'openrazer-driver-dkms-basilisk-v2-git' 'openrazer-meta-basilisk-v2-git')
pkgver=2.8.0.r1.g5989555
pkgrel=1
pkgdesc="An entirely open source driver and user-space daemon that allows you to manage your Razer peripherals on GNU/Linux.  Using malsyned's branch for Basilisk V2 support."
arch=('any')
url="https://github.com/malsyned/openrazer"
license=('GPL2')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/malsyned/openrazer.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_python-openrazer-basilisk-v2-git() {
  pkgdesc="Python library for accessing the Razer daemon from Python."
  depends=('openrazer-daemon' 'python-numpy')
  provides=('python-openrazer')
  conflicts=('python-openrazer')

  cd "$_pkgbase"
  make DESTDIR="$pkgdir" python_library_install
}

package_openrazer-daemon-basilisk-v2-git() {
  pkgdesc="Userspace daemon that abstracts access to the kernel driver. Provides a DBus service for applications to use."
  depends=('openrazer-driver-dkms' 'gtk3' 'python-dbus' 'python-gobject' 'python-setproctitle' 'python-daemonize' 'python-notify2' 'python-pyudev' 'xautomation')
  provides=('openrazer-daemon')
  conflicts=('openrazer-daemon')
  install=openrazer-daemon-git.install

  cd "$_pkgbase"
  make DESTDIR="$pkgdir" daemon_install
}

package_openrazer-driver-dkms-basilisk-v2-git() {
  pkgdesc="Kernel driver for Razer devices (DKMS-variant)"
  depends=('dkms' 'udev')
  provides=('openrazer-driver-dkms')
  conflicts=('openrazer-driver-dkms')
  install=openrazer-driver-dkms-git.install

  cd "$_pkgbase"
  make DESTDIR="$pkgdir" setup_dkms udev_install
}

package_openrazer-meta-basilisk-v2-git() {
  pkgdesc="Meta package for installing all required openrazer packages."
  depends=('openrazer-driver-dkms' 'openrazer-daemon' 'python-openrazer')
  optdepends=('polychromatic: frontend'
              'razergenie: qt frontend'
              'razercommander: gtk frontend')
  provides=('openrazer-meta')
  conflicts=('openrazer-meta')
}

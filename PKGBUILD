# Maintainer: tildearrow <tildearrow@protonmail.com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Gabriele Musco <emaildigabry@gmail.com>

pkgbase=openrazer-fxs-git
_pkgbase=openrazer
pkgname=('python-openrazer-fxs-git' 'openrazer-fxs-daemon-git' 'openrazer-fxs-driver-dkms-git' 'openrazer-fxs-meta-git')
pkgver=2.8.0.r117.g0161c8e8
pkgrel=1
pkgdesc="OpenRazer, effect storage/persistence branch."
arch=('any')
url="https://github.com/openrazer/openrazer"
license=('GPL2')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/openrazer/openrazer.git#branch=effect_storage")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_python-openrazer-fxs-git() {
  pkgdesc="Python library for accessing the Razer daemon from Python."
  depends=('openrazer-fxs-daemon-git' 'python-numpy')
  provides=('python-openrazer')
  conflicts=('python-openrazer')

  cd "$_pkgbase"
  make DESTDIR="$pkgdir" python_library_install
}

package_openrazer-fxs-daemon-git() {
  pkgdesc="Userspace daemon that abstracts access to the kernel driver. Provides a DBus service for applications to use."
  depends=('openrazer-fxs-driver-dkms-git' 'gtk3' 'python-dbus' 'python-gobject' 'python-setproctitle' 'python-daemonize' 'python-notify2' 'python-pyudev' 'xautomation')
  provides=('openrazer-daemon')
  conflicts=('openrazer-daemon')
  install=openrazer-fxs-daemon-git.install

  cd "$_pkgbase"
  make DESTDIR="$pkgdir" daemon_install
}

package_openrazer-fxs-driver-dkms-git() {
  pkgdesc="Kernel driver for Razer devices (DKMS-variant)"
  depends=('dkms' 'udev')
  provides=('openrazer-driver-dkms')
  conflicts=('openrazer-driver-dkms')
  install=openrazer-fxs-driver-dkms-git.install

  cd "$_pkgbase"
  make DESTDIR="$pkgdir" setup_dkms udev_install
}

package_openrazer-fxs-meta-git() {
  pkgdesc="Meta package for installing all required openrazer packages."
  depends=('openrazer-fxs-driver-dkms-git' 'openrazer-fxs-daemon-git' 'python-openrazer-fxs-git')
  optdepends=('polychromatic-dev-1.0.0-git: frontend'
              'razergenie: qt frontend (no persistence support)'
              'razercommander: gtk frontend (no persistence support)')
  provides=('openrazer-meta')
  conflicts=('openrazer-meta')
}

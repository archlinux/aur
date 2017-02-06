# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

# This PKGBUILD is configured to only build razer-driver-dkms-git, razer-daemon-git & python-razer-git by default.
# Kernel modules for the stock kernel (package "linux") can be built into a package by setting the variable "build_kernel_modules" to "true".
build_kernel_modules=false

pkgbase=razer-drivers-git
pkgname=('python-razer-git' 'razer-daemon-git' 'razer-driver-dkms-git')
if $build_kernel_modules; then
    # For kernel update: Update the two variables and the .install file!
    _linux_current=4.9
    _linux_next=4.10
    pkgname+=('razer-driver-arch-git')
fi
pkgver=1.1.8.r33.g887b808
pkgrel=1
pkgdesc="An entirely open source driver and user-space daemon that allows you to manage your Razer peripherals on GNU/Linux."
arch=('any')
url="https://github.com/terrycain/razer-drivers"
license=('GPL2')
makedepends=('git' 'make' 'python' 'python-setuptools')
if $build_kernel_modules; then
    makedepends+=("linux-headers>=$_linux_current" "linux-headers<$_linux_next" "linux>=$_linux_current" "linux<$_linux_next")
fi
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

if $build_kernel_modules; then
_extramodules=extramodules-$_linux_current-ARCH

build() {
  cd $srcdir/$pkgbase

  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

  make DESTDIR=$pkgdir KERNELDIR=/usr/lib/modules/$_kernver/build driver
}

package_razer-driver-arch-git() {
  pkgdesc="An entirely open source driver for managing Razer peripherals on Linux. (for stock 'linux' kernel)"
  depends=('udev')
  depends=("linux>=$_linux_current" "linux<$_linux_next")
  provides=('RAZER-DRIVERS-MODULES')
  conflicts=('RAZER-DRIVERS-MODULES')
  install=razer-driver-arch-git.install

  cd $srcdir/$pkgbase
  install -dm755 $pkgdir/usr/lib/modules/$_extramodules/
  make DESTDIR=$pkgdir MODULEDIR=/usr/lib/modules/$_extramodules/ driver_install_packaging udev_install

  # compress each module individually
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}
fi

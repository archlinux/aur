# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

# This PKGBUILD is configured to only build openrazer-driver-dkms-git, openrazer-daemon-git & python-openrazer-git by default.
# Kernel modules for the stock kernel (package "linux") can be built into a package by setting the variable "build_kernel_modules" to "true".
build_kernel_modules=false

pkgbase=openrazer-git
pkgname=('python-openrazer-git' 'openrazer-daemon-git' 'openrazer-driver-dkms-git' 'openrazer-meta-git')
if $build_kernel_modules; then
    # For kernel update: Update the two variables and the .install file!
    _linux_current=4.10
    _linux_next=4.11
    pkgname+=('openrazer-driver-arch-git')
fi
pkgver=2.0.0.r57.g65c5d2d
pkgrel=1
pkgdesc="An entirely open source driver and user-space daemon that allows you to manage your Razer peripherals on GNU/Linux. (Git version)"
arch=('any')
url="https://github.com/openrazer/openrazer"
license=('GPL2')
makedepends=('git' 'make' 'python' 'python-setuptools')
if $build_kernel_modules; then
    makedepends+=("linux-headers>=$_linux_current" "linux-headers<$_linux_next" "linux>=$_linux_current" "linux<$_linux_next")
fi
source=("$pkgbase::git+https://github.com/openrazer/openrazer.git")
sha512sums=('SKIP')

pkgver() {
  cd $pkgbase
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_python-openrazer-git() {
  pkgdesc="Python library for accessing the Razer daemon from Python. (Git version)"
  depends=('openrazer-daemon' 'python' 'python-dbus' 'python-numpy')
  provides=('python-openrazer' 'python-razer')
  conflicts=('python-openrazer' 'python-razer')
  replaces=('python-razer-git')

  cd $srcdir/$pkgbase
  make DESTDIR=$pkgdir python_library_install
}

package_openrazer-daemon-git() {
  pkgdesc="Userspace daemon that abstracts access to the kernel driver. Provides a DBus service for applications to use. (Git version)"
  depends=('openrazer-driver-dkms' 'python-dbus' 'python-gobject' 'python-setproctitle' 'python-daemonize' 'python-notify2' 'python-pyudev' 'xautomation' 'xdotool' 'libdbus' 'gtk3' 'dbus-glib')
  # gtk3 for "gi.require_version('Gdk', '3.0')"
  provides=('openrazer-daemon' 'razer-daemon')
  conflicts=('openrazer-daemon' 'razer-daemon')
  replaces=('razer-daemon-git')

  cd $srcdir/$pkgbase
  make DESTDIR=$pkgdir daemon_install
}

package_openrazer-driver-dkms-git() {
  pkgdesc="Kernel driver for Razer devices (DKMS-variant) (Git version)"
  depends=('dkms' 'udev')
  provides=('openrazer-driver-dkms' 'OPENRAZER-MODULES' 'razer-driver-dkms')
  conflicts=('openrazer-driver-dkms' 'OPENRAZER-MODULES' 'razer-driver-dkms')
  replaces=('razer-driver-dkms')
  install=openrazer-driver-dkms-git.install
  
  cd $srcdir/$pkgbase
  make DESTDIR=$pkgdir setup_dkms udev_install
}

package_openrazer-meta-git() {
  pkgdesc="Meta package for installing all required openrazer packages. (Git version)"
  depends=('openrazer-driver-dkms' 'openrazer-daemon' 'python-openrazer')
  optdepends=('polychromatic: frontend'
              'razergenie: qt frontend'
              'razercommander: gtk frontend')
  provides=('openrazer-meta')
  conflicts=('openrazer-meta')
}

if $build_kernel_modules; then
_extramodules=extramodules-$_linux_current-ARCH

build() {
  cd $srcdir/$pkgbase

  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

  make DESTDIR=$pkgdir KERNELDIR=/usr/lib/modules/$_kernver/build driver
}

package_openrazer-driver-arch-git() {
  pkgdesc="Kernel driver for Razer devices (for stock 'linux' kernel) (Git version)"
  depends=('udev')
  depends=("linux>=$_linux_current" "linux<$_linux_next")
  provides=('OPENRAZER-MODULES' 'openrazer-driver-dkms')
  conflicts=('OPENRAZER-MODULES' 'openrazer-driver-dkms')
  install=openrazer-driver-arch-git.install

  cd $srcdir/$pkgbase
  install -dm755 $pkgdir/usr/lib/modules/$_extramodules/
  make DESTDIR=$pkgdir MODULEDIR=/usr/lib/modules/$_extramodules/ driver_install_packaging udev_install

  # compress each module individually
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}
fi

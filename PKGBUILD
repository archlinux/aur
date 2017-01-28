# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Maintainer: Gabriele Musco <emaildigabry@gmail.com>

# This PKGBUILD is configured to only build razer-driver-dkms, razer-daemon & python-razer by default.
# Kernel modules for the stock kernel (package "linux") can be built into a package by setting the variable "build_kernel_modules" to "true".
build_kernel_modules=false

# Furthermore it is possible to build the package from a specific git commit by uncommenting the variable "_commit" and setting it to a valid commit. pkgrel should be bumped up too then.

pkgbase=razer-drivers
pkgname=('python-razer' 'razer-daemon' 'razer-driver-dkms')
if $build_kernel_modules; then
    # For kernel update: Update the two variables and the .install file!
    _linux_current=4.9
    _linux_next=4.10
    pkgname+=('razer-driver-arch')
fi
pkgver=1.1.8
#_commit=6ae1f7d55bf10cc6b5cb62a5ce99ff22c43e0701
pkgrel=1
pkgdesc="An entirely open source driver and user-space daemon that allows you to manage your Razer peripherals on GNU/Linux."
arch=('any')
url="https://github.com/terrycain/razer-drivers"
license=('GPL2')
makedepends=('make' 'python' 'python-setuptools')
if $build_kernel_modules; then
    makedepends+=("linux-headers>=$_linux_current" "linux-headers<$_linux_next" "linux>=$_linux_current" "linux<$_linux_next")
fi
if [ -z $_commit ]; then
  source=("https://github.com/terrycain/razer-drivers/archive/v$pkgver.tar.gz")
else
  source=("https://github.com/terrycain/razer-drivers/archive/$_commit.tar.gz")
fi
sha256sums=('b79df8ae7c1060c4656d1a70ddb3b2178ed9fd0708dfbc9308b539382891bc6e')

package_python-razer() {
  pkgdesc="A python library for controlling razer-daemon"
  depends=('razer-daemon' 'python' 'python-dbus' 'python-numpy')
  optdepends=('polychromatic: gtk frontend'
              'razercommander-git: gtk frontend')
  if [ -z $_commit ]; then
    cd $srcdir/$pkgbase-$pkgver
  else
    cd $srcdir/$pkgbase-$_commit
  fi
  make DESTDIR=$pkgdir python_library_install
}

package_razer-daemon() {
  pkgdesc="A daemon for controlling razer-driver"
  depends=('RAZER-DRIVERS-MODULES' 'python-dbus' 'python-gobject' 'python-setproctitle' 'xautomation' 'xdotool' 'libdbus' 'python-notify2' 'python-pyudev' 'gtk3')
  # gtk3 for "gi.require_version('Gdk', '3.0')"

  if [ -z $_commit ]; then
    cd $srcdir/$pkgbase-$pkgver
  else
    cd $srcdir/$pkgbase-$_commit
  fi
  make DESTDIR=$pkgdir daemon_install
}

package_razer-driver-dkms() {
  pkgdesc="An entirely open source driver for managing Razer peripherals on Linux. (DKMS)"
  depends=('dkms' 'udev')
  provides=('RAZER-DRIVERS-MODULES')
  conflicts=('RAZER-DRIVERS-MODULES')
  install=razer-driver-dkms.install
  
  if [ -z $_commit ]; then
    cd $srcdir/$pkgbase-$pkgver
  else
    cd $srcdir/$pkgbase-$_commit
  fi
  make DESTDIR=$pkgdir setup_dkms udev_install
}

if $build_kernel_modules; then
_extramodules=extramodules-$_linux_current-ARCH

build() {
  if [ -z $_commit ]; then
    cd $srcdir/$pkgbase-$pkgver
  else
    cd $srcdir/$pkgbase-$_commit
  fi

  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

  make DESTDIR=$pkgdir KERNELDIR=/usr/lib/modules/$_kernver/build driver
}

package_razer-driver-arch() {
  pkgdesc="An entirely open source driver for managing Razer peripherals on Linux. (for stock 'linux' kernel)"
  depends=('udev')
  depends=("linux>=$_linux_current" "linux<$_linux_next")
  provides=('RAZER-DRIVERS-MODULES')
  conflicts=('RAZER-DRIVERS-MODULES')
  install=razer-driver-arch.install

  if [ -z $_commit ]; then
    cd $srcdir/$pkgbase-$pkgver
  else
    cd $srcdir/$pkgbase-$_commit
  fi
  install -dm755 $pkgdir/usr/lib/modules/$_extramodules/
  make DESTDIR=$pkgdir MODULEDIR=/usr/lib/modules/$_extramodules/ driver_install_packaging udev_install

  # compress each module individually
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}
fi

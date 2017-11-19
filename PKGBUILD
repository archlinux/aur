# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Maintainer: Gabriele Musco <emaildigabry@gmail.com>

# This PKGBUILD is configured to only build openrazer-driver-dkms, openrazer-daemon & python-openrazer by default.
# Kernel modules for the stock kernel (package "linux") can be built into a package by setting the variable "build_kernel_modules" to "true".
build_kernel_modules=false

# Furthermore it is possible to build the package from a specific git commit by uncommenting the variable "_commit" and setting it to a valid commit. pkgrel should be bumped up too then.

pkgbase=openrazer
pkgname=('python-openrazer' 'openrazer-daemon' 'openrazer-driver-dkms' 'openrazer-meta')
if $build_kernel_modules; then
    # For kernel update: Update the two variables and the .install file!
    _linux_current=4.12
    _linux_next=4.13
    pkgname+=('openrazer-driver-arch')
fi
pkgver=2.1.1
#_commit=6ae1f7d55bf10cc6b5cb62a5ce99ff22c43e0701
pkgrel=1
pkgdesc="An entirely open source driver and user-space daemon that allows you to manage your Razer peripherals on GNU/Linux."
arch=('any')
url="https://github.com/openrazer/openrazer"
license=('GPL2')
makedepends=('make' 'python' 'python-setuptools')
if $build_kernel_modules; then
    makedepends+=("linux-headers>=$_linux_current" "linux-headers<$_linux_next" "linux>=$_linux_current" "linux<$_linux_next")
fi
if [ -z $_commit ]; then
  source=("https://github.com/openrazer/openrazer/releases/download/v$pkgver/openrazer-$pkgver.tar.xz")
else
  source=("https://github.com/openrazer/openrazer/archive/$_commit.tar.gz")
fi
sha256sums=('7827c2398b695ea002edbd5c7f92fdd722039886f946b35da537ddff9e998f5e')

package_python-openrazer() {
  pkgdesc="Python library for accessing the Razer daemon from Python."
  depends=('openrazer-daemon' 'python' 'python-dbus' 'python-numpy')
  provides=('python-razer')
  conflicts=('python-razer')
  replaces=('python-razer')
  if [ -z $_commit ]; then
    cd $srcdir/$pkgbase-$pkgver
  else
    cd $srcdir/$pkgbase-$_commit
  fi
  make DESTDIR=$pkgdir python_library_install
}

package_openrazer-daemon() {
  pkgdesc="Userspace daemon that abstracts access to the kernel driver. Provides a DBus service for applications to use."
  depends=('openrazer-driver-dkms' 'python-dbus' 'python-gobject' 'python-setproctitle' 'python-daemonize' 'xautomation' 'xdotool' 'libdbus' 'python-notify2' 'python-pyudev' 'gtk3' 'dbus-glib')
  provides=('razer-daemon')
  conflicts=('razer-daemon')
  replaces=('razer-daemon')
  # gtk3 for "gi.require_version('Gdk', '3.0')"
  install=openrazer-daemon.install

  if [ -z $_commit ]; then
    cd $srcdir/$pkgbase-$pkgver
  else
    cd $srcdir/$pkgbase-$_commit
  fi
  make DESTDIR=$pkgdir daemon_install
}

package_openrazer-driver-dkms() {
  pkgdesc="Kernel driver for Razer devices (DKMS-variant)"
  depends=('dkms' 'udev')
  provides=('OPENRAZER-MODULES' 'razer-driver-dkms')
  conflicts=('OPENRAZER-MODULES' 'razer-driver-dkms')
  replaces=('razer-driver-dkms')
  install=openrazer-driver-dkms.install
  
  if [ -z $_commit ]; then
    cd $srcdir/$pkgbase-$pkgver
  else
    cd $srcdir/$pkgbase-$_commit
  fi
  make DESTDIR=$pkgdir setup_dkms udev_install
}

package_openrazer-meta() {
  pkgdesc="Meta package for installing all required openrazer packages."
  depends=('openrazer-driver-dkms' 'openrazer-daemon' 'python-openrazer')
  optdepends=('polychromatic: frontend'
              'razergenie: qt frontend'
              'razercommander: gtk frontend')
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

package_openrazer-driver-arch() {
  pkgdesc="Kernel driver for Razer devices (for stock 'linux' kernel)"
  depends=('udev')
  depends=("linux>=$_linux_current" "linux<$_linux_next")
  provides=('OPENRAZER-MODULES' 'openrazer-driver-dkms')
  conflicts=('OPENRAZER-MODULES' 'openrazer-driver-dkms')
  install=openrazer-driver-arch.install

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

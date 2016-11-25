# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Gabriele Musco <emaildigabry@gmail.com>

pkgbase=razer-drivers-git
pkgname=('python-razer-git' 'razer-daemon-git' 'razer-driver-dkms-git')
pkgver=1.0.17.r24.ga4e2da0
pkgrel=1
pkgdesc="An entirely open source driver and user-space daemon that allows you to manage your Razer peripherals on GNU/Linux."
arch=('any')
url="https://github.com/terrycain/razer_drivers"
license=('GPL2')
makedepends=('git' 'make' 'python')
optdepends=('razercommander-git: gtk frontend for razer-drivers')
source=("$pkgbase::git+https://github.com/terrycain/razer_drivers.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgbase
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_python-razer-git() {
  _srcpkgdir="$srcdir/$pkgbase"
  _pythondir=$(python -c 'import sys; print(sys.path[-1])')
  pkgdesc="A python library for controlling razer-daemon"
  depends=('razer-daemon' 'python' 'python-dbus' 'python-numpy')
  provides=('python-razer')
  conflicts=('python-razer')
  install=$pkgname.install

  mkdir -p $pkgdir/$_pythondir

  cp -r $_srcpkgdir/pylib/razer $pkgdir/$_pythondir/
}

package_razer-daemon-git() {
  _srcpkgdir="$srcdir/$pkgbase"
  _pythondir=$(python -c 'import sys; print(sys.path[-1])')
  pkgdesc="A daemon for controlling razer-driver"
  depends=('razer-driver-dkms' 'python-dbus' 'python-gobject' 'python-setproctitle' 'xautomation' 'xdotool' 'libdbus' 'python-notify2' 'dbus-glib')
  provides=('razer-daemon')
  conflicts=('razer-daemon')
  install=$pkgname.install
  
  # use the make file instead of copying manually? maybe, not now.
  mkdir -p $pkgdir/usr/share/razer-service
  mkdir -p $pkgdir/usr/share/man/man5
  mkdir -p $pkgdir/usr/share/man/man8
  mkdir -p $pkgdir/$_pythondir
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/etc/xdg/autostart

  cp -r $_srcpkgdir/daemon/razer_daemon $pkgdir/$_pythondir/
  cp $_srcpkgdir/daemon/run_razer_daemon.py $pkgdir/usr/bin/razer-service
  cp $_srcpkgdir/daemon/resources/razer.conf $pkgdir/usr/share/razer-service/razer.conf.example

  cp -v $_srcpkgdir/install_files/desktop/razer-service.desktop $pkgdir/etc/xdg/autostart/razer-service.desktop
  
  gzip -c $_srcpkgdir/daemon/resources/man/razer.conf.5 > $pkgdir/usr/share/man/man5/razer.conf.5.gz
  gzip -c $_srcpkgdir/daemon/resources/man/razer-service.8 > $pkgdir/usr/share/man/man8/razer-service.8.gz
}

package_razer-driver-dkms-git() {
  _srcpkgdir="$srcdir/$pkgbase"
  pkgdesc="An entirely open source driver for managing Razer peripherals on Linux. (DKMS)"
  depends=('dkms' 'udev')
  provides=('razer-driver-dkms')
  conflicts=('razer-driver-dkms')
  install=$pkgname.install
  
  #part1: dkms driver
  mkdir -p $pkgdir/usr/src/$pkgbase-$pkgver
  mkdir -p $pkgdir/usr/lib/udev/rules.d

  cp -r $_srcpkgdir/driver $pkgdir/usr/src/$pkgbase-$pkgver
  cp $_srcpkgdir/Makefile $pkgdir/usr/src/$pkgbase-$pkgver
  cp $_srcpkgdir/install_files/dkms/dkms.conf $pkgdir/usr/src/$pkgbase-$pkgver
  
  #part2: udev rules
  cp $_srcpkgdir/install_files/udev/99-razer.rules $pkgdir/usr/lib/udev/rules.d
  cp $_srcpkgdir/install_files/udev/razer_mount $pkgdir/usr/lib/udev
}

# Maintainer:
# COntributor: Felix Golatofski <contact@xdfr.de>
# Contributor: graysky <graysky AT archlinux DOT us>

pkgname=rtl8192su-git
_pkgname=rtl8192su
pkgver=r579.1f09c7a
pkgrel=1
pkgdesc="Kernel module for Realtek RTL8188SU/RTL8191SU/RTL8192SU devices"
arch=('x86_64' 'i686')
# https://wireless.wiki.kernel.org/en/users/Drivers/rtl819x
# pointed to this github repo --> https://github.com/chunkeey/rtl8192su
url="https://github.com/chunkeey/rtl8192su"
license=('GPL')
depends=('dkms')
makedepends=('linux-headers' 'git' 'bc')
source=("git+https://github.com/chunkeey/$_pkgname.git")
sha256sums=('SKIP')
install=${_pkgname}.install

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/$_pkgname"
  make INSTALL_PREFIX=/usr -j`cat /proc/cpuinfo |grep "processor"|wc -l`
  find . -type f -name '*.ko' -print0 | xargs -0 gzip -9
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p $pkgdir/usr/lib/modules/`uname -r`/kernel/drivers/net/wireless
  make DESTDIR=$pkgdir/usr install
}

# vim:set ts=2 sw=2 et:

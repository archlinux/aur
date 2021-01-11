# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

_pkgbasename=util-linux
pkgname=lib32-$_pkgbasename-nosystemd-minimal-git
pkgver=2.36.1
pkgrel=1
pkgdesc="Miscellaneous system utilities for Linux (32-bit)"
url='https://github.com/karelzak/util-linux'
arch=('x86_64')
depends=('lib32-glibc' "$_pkgbasename" 'lib32-libxcrypt')
provides=('lib32-util-linux' 'libuuid.so' 'libblkid.so' 'libfdisk.so' 'libmount.so' 'libsmartcols.so')
conflicts=('lib32-util-linux')
license=('GPL2')
options=('!emptydirs')
#validpgpkeys=('B0C64D14301CC6EFAEDF60E4E4B71D5EEC39C284')  # Karel Zak
source=("git+https://github.com/karelzak/util-linux.git")
sha256sums=('SKIP')

pkgver() {
  cd util-linux
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "$_pkgbasename"

  ./autogen.sh
  ./configure \
      CC="${CC:-cc} -m32" \
      PKG_CONFIG_PATH="/usr/lib32/pkgconfig" \
      --libdir=/usr/lib32 \
      --with-systemdsystemunitdir=no \
      --with-systemd=no \
      --with-selinux=no \
      --with-audit=no

  make lib{uuid,blkid,fdisk,mount,smartcols}.la
}

package() {
  make -C "$_pkgbasename" \
    DESTDIR="$pkgdir" \
    install-usrlib_execLTLIBRARIES \
    install-pkgconfigDATA
}

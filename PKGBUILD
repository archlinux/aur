# Maintainer: Robin Becker <robin@reportlab.com>
# based on the	original https://www.archlinux.org/packages/core/i686/util-linux/
# 				Maintainer: Tom Gundersen <teg@jklm.no>
# 				Maintainer: Dave Reisner <dreisner@archlinux.org>
# 				Contributor: judd <jvinet@zeroflux.org>
#
# simple hack removal of systemd dependencies

pkgbase=util-linux-nosystemd
pkgname=(util-linux-nosystemd libutil-linux-nosystemd)
pkgver=2.26.2
pkgrel=2
pkgdesc="Miscellaneous system utilities for Linux"
url="https://www.kernel.org/pub/linux/utils/util-linux/"
arch=('i686' 'x86_64')
makedepends=('python')
license=('GPL2')
options=('strip' 'debug')
validpgpkeys=('B0C64D14301CC6EFAEDF60E4E4B71D5EEC39C284')  # Karel Zak
source=("https://www.kernel.org/pub/linux/utils/util-linux/v2.26/${pkgname%-nosystemd}-$pkgver.tar."{xz,sign}
        uuidd.tmpfiles
        pam-{login,common,su})
md5sums=('9bdf368c395f1b70325d0eb22c7f48fb'
         'SKIP'
         'a39554bfd65cccfd8254bb46922f4a67'
         '4368b3f98abd8a32662e094c54e7f9b1'
         'a31374fef2cba0ca34dfc7078e2969e4'
         'fa85e5cce5d723275b14365ba71a8aad')

build() {
  cd "${pkgname%-nosystemd}-$pkgver"

  ./configure --prefix=/usr \
              --libdir=/usr/lib \
              --bindir=/usr/bin \
              --localstatedir=/run \
              --enable-fs-paths-extra=/usr/bin \
              --enable-raw \
              --enable-vipw \
              --enable-newgrp \
              --enable-chfn-chsh \
              --enable-write \
              --enable-mesg \
              --enable-libmount-force-mountinfo \
              --with-python=3 \
			  --with-systemd=no
  make
}

package_util-linux-nosystemd() {
  conflicts=('util-linux' 'util-linux-ng' 'eject' 'zramctl')
  provides=("util-linux=$pkgver" "util-linux-ng=$pkgver" 'eject' 'zramctl')
  replaces=('zramctl')
  depends=('pam' 'shadow' 'coreutils' 'libutil-linux')
  optdepends=('python: python bindings to libmount')
  install=util-linux.install
  groups=('base' 'base-devel')
  backup=(etc/pam.d/chfn
          etc/pam.d/chsh
          etc/pam.d/login
          etc/pam.d/su
          etc/pam.d/su-l)

  cd "${pkgname%-nosystemd}-$pkgver"

  make DESTDIR="$pkgdir" install

  # setuid chfn and chsh
  chmod 4755 "$pkgdir"/usr/bin/{newgrp,ch{sh,fn}}

  # install PAM files for login-utils
  install -Dm644 "$srcdir/pam-common" "$pkgdir/etc/pam.d/chfn"
  install -m644 "$srcdir/pam-common" "$pkgdir/etc/pam.d/chsh"
  install -m644 "$srcdir/pam-login" "$pkgdir/etc/pam.d/login"
  install -m644 "$srcdir/pam-su" "$pkgdir/etc/pam.d/su"
  install -m644 "$srcdir/pam-su" "$pkgdir/etc/pam.d/su-l"

  # include tmpfiles fragment for uuidd
  # TODO(dreisner): offer this upstream?
  install -Dm644 "$srcdir/uuidd.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/uuidd.conf"

  # usrmove
  cd "$pkgdir"
  mv {,usr/}sbin/* usr/bin
  rmdir sbin usr/sbin

  ### create libutil-linux split
  rm -rf "$srcdir/_libutil-linux"
  install -dm755 "$srcdir"/_libutil-linux/usr/lib
  cd "$srcdir"/_libutil-linux
  mv "$pkgdir"/usr/lib/lib*.{a,so}* usr/lib
}

package_libutil-linux-nosystemd() {
  pkgdesc="util-linux runtime libraries"
  conflicts=('libutil-linux')
  provides=("libutil-linux=$pkgver" 'libblkid.so' 'libfdisk.so' 'libmount.so' 'libsmartcols.so' 'libuuid.so')

  mv "$srcdir/_libutil-linux"/* "$pkgdir"
}

# $Id$
# Maintainer: Tom Gundersen <teg@jklm.no>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <nicky726@gmail.com>

pkgname=util-linux-selinux
pkgver=2.24
pkgrel=2
pkgdesc="SELinux aware miscellaneous system utilities for Linux"
url="http://www.kernel.org/pub/linux/utils/util-linux/"
arch=('i686' 'x86_64')
groups=('selinux')
depends=('pam-selinux' 'shadow-selinux' 'coreutils' 'glibc' 'libselinux')
optdepends=('python: python bindings to libmount')
makedepends=('systemd' 'python')
# checkdepends=('bc')
conflicts=('util-linux-ng' 'eject'
           "${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("util-linux-ng=$pkgver" 'eject'
          "${pkgname/-selinux}=${pkgver}-${pkrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkrel}")
license=('GPL2')
options=('strip' 'debug')
source=("ftp://ftp.kernel.org/pub/linux/utils/${pkgname/-selinux}/v2.24/${pkgname/-selinux}-$pkgver.tar.xz"
        0001-lsblk-fix-D-segfault.patch
        0001-pylibmount-correctly-import-from-pylibmount.so.patch
        uuidd.tmpfiles
        pam-login
        pam-common
        pam-su)
backup=(etc/pam.d/chfn
        etc/pam.d/chsh
        etc/pam.d/login
        etc/pam.d/su
        etc/pam.d/su-l)
install=util-linux.install
md5sums=('4fac6443427f575fc5f3531a4ad2ca01'
         '1899fe3b853a5835c76cca0501b6b518'
         'a18a1e89ffdfa3bc96ae976646a723ec'
         'a39554bfd65cccfd8254bb46922f4a67'
         '4368b3f98abd8a32662e094c54e7f9b1'
         'a31374fef2cba0ca34dfc7078e2969e4'
         'fa85e5cce5d723275b14365ba71a8aad')

prepare() {
  cd "${pkgname/-selinux}-$pkgver"

  patch -Np1 <"$srcdir"/0001-lsblk-fix-D-segfault.patch
  patch -Np1 <"$srcdir"/0001-pylibmount-correctly-import-from-pylibmount.so.patch
}

build() {
  cd "${pkgname/-selinux}-$pkgver"

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
              --enable-socket-activation \
              --with-selinux \
              --with-python=3

#              --enable-reset \ # part of ncurses
#              --enable-last \ # not compat

  make
}

#check() {
# fails for some reason in chroot, works outside
#  make -C "${pkgname/-selinux}-$pkgver" check
#}

package() {
  cd "${pkgname/-selinux}-$pkgver"

  make DESTDIR="${pkgdir}" install

  # setuid chfn and chsh
  chmod 4755 "$pkgdir"/usr/bin/{newgrp,ch{sh,fn}}

  # install PAM files for login-utils
  install -Dm644 "$srcdir/pam-common" "$pkgdir/etc/pam.d/chfn"
  install -m644 "$srcdir/pam-common" "$pkgdir/etc/pam.d/chsh"
  install -m644 "$srcdir/pam-login" "$pkgdir/etc/pam.d/login"
  install -m644 "$srcdir/pam-su" "${pkgdir}/etc/pam.d/su"
  install -m644 "$srcdir/pam-su" "${pkgdir}/etc/pam.d/su-l"

  # include tmpfiles fragment for uuidd
  # TODO(dreisner): offer this upstream?
  install -Dm644 "$srcdir/uuidd.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/uuidd.conf"

  # usrmove
  cd "$pkgdir"
  mv {,usr/}sbin/* usr/bin
  rmdir sbin usr/sbin
}

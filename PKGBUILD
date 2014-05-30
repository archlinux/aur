# $Id$
# Maintainer: Tom Gundersen <teg@jklm.no>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <nicky726@gmail.com>
# SELinux Contributor: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgbase=util-linux-selinux
pkgname=(util-linux-selinux libutil-linux-selinux)
pkgver=2.24.2
pkgrel=1
pkgdesc="SELinux aware miscellaneous system utilities for Linux"
url="http://www.kernel.org/pub/linux/utils/util-linux/"
arch=('i686' 'x86_64')
groups=('selinux')
# SELinux package maintenance note:
#   ArchLinux base packages have a build-time cyclic dependency because
#   systemd depends on libutil-linux and util-linux depends on libudev
#   provided by libsystemd (FS#39767).  To break this cycle, make
#   util-linux-selinux depend on systemd at build time.
makedepends=('systemd' 'python')
# checkdepends=('bc')
license=('GPL2')
options=('strip' 'debug')
source=("ftp://ftp.kernel.org/pub/linux/utils/${pkgname/-selinux}/v2.24/${pkgname/-selinux}-$pkgver.tar.xz"
        uuidd.tmpfiles
        pam-login
        pam-common
        pam-su)
md5sums=('3f191727a0d28f7204b755cf1b6ea0aa'
         'a39554bfd65cccfd8254bb46922f4a67'
         '4368b3f98abd8a32662e094c54e7f9b1'
         'a31374fef2cba0ca34dfc7078e2969e4'
         'fa85e5cce5d723275b14365ba71a8aad')

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


package_util-linux-selinux() {
  conflicts=('util-linux-ng' 'eject'
             "${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
  provides=("util-linux-ng=$pkgver" 'eject'
            "${pkgname/-selinux}=${pkgver}-${pkrel}"
            "selinux-${pkgname/-selinux}=${pkgver}-${pkrel}")
  depends=('pam-selinux' 'shadow-selinux' 'coreutils-selinux'
           'libsystemd-selinux' 'libutil-linux-selinux')
  optdepends=('python: python bindings to libmount')
  install=util-linux.install
  backup=(etc/pam.d/chfn
          etc/pam.d/chsh
          etc/pam.d/login
          etc/pam.d/su
          etc/pam.d/su-l)

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

  ### create libutil-linux split
  rm -rf "$srcdir/_libutil-linux"
  install -dm755 "$srcdir"/_libutil-linux/usr/lib
  cd "$srcdir"/_libutil-linux
  mv "$pkgdir"/usr/lib/lib*.{a,so}* usr/lib
}

package_libutil-linux-selinux() {
  pkgdesc="util-linux-selinux runtime libraries"
  provides=('libblkid.so' 'libmount.so' 'libuuid.so'
            "${pkgname/-selinux}=${pkgver}-${pkrel}")
  conflicts=("${pkgname/-selinux}")

  mv "$srcdir/_libutil-linux"/* "$pkgdir"
}

workaround_for_the_aur_webinterface='
pkgname="util-linux-selinux"
depends=('pam-selinux' 'shadow-selinux' 'coreutils-selinux' 'glibc' 'libselinux')
'

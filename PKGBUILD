# $Id$
# Maintainer: Tom Gundersen <teg@jklm.no>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <nicky726@gmail.com>

pkgbase=util-linux-selinux
pkgname=(util-linux-selinux libutil-linux-selinux)
_pkgmajor=2.31
pkgver=${_pkgmajor}
pkgrel=2
pkgdesc="SELinux aware miscellaneous system utilities for Linux"
url="https://www.kernel.org/pub/linux/utils/util-linux/"
arch=('i686' 'x86_64')
groups=('selinux')
# SELinux package maintenance note:
#   ArchLinux base packages have a build-time cyclic dependency because
#   systemd depends on libutil-linux and util-linux depends on libudev
#   provided by libsystemd (FS#39767).  To break this cycle, make
#   util-linux-selinux depend on systemd at build time.
makedepends=('systemd' 'python' 'libcap-ng' 'libselinux')
license=('GPL2')
options=('strip' 'debug')
validpgpkeys=('B0C64D14301CC6EFAEDF60E4E4B71D5EEC39C284')  # Karel Zak
source=("https://www.kernel.org/pub/linux/utils/util-linux/v$_pkgmajor/${pkgbase/-selinux}-$pkgver.tar."{xz,sign}
        pam-{login,common,su}
        'util-linux.sysusers'
        '60-rfkill.rules'
        'rfkill-unblock_.service'
        'rfkill-block_.service')
md5sums=('5b6821c403c3cc6e7775f74df1882a20'
         'SKIP'
         '4368b3f98abd8a32662e094c54e7f9b1'
         'a31374fef2cba0ca34dfc7078e2969e4'
         'fa85e5cce5d723275b14365ba71a8aad'
         '095fb3d048d5304cce5719831bdad6dc'
         '63f9bf9264911242e430867a41e8918c'
         '3a87d0d77656f005fbd9c3b003dadc90'
         'a5835e0d5686ad1a12644edc3333d886')

build() {
  cd "${pkgbase/-selinux}-$pkgver"

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
              --with-selinux \
              --with-python=3

  make
}

package_util-linux-selinux() {
  conflicts=('eject' 'zramctl' 'rfkill'
             "${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
  provides=('eject' 'zramctl' 'rfkill'
            "${pkgname/-selinux}=${pkgver}-${pkgrel}"
            "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
  depends=('pam-selinux' 'shadow-selinux' 'coreutils-selinux'
           'libsystemd-selinux' 'libcap-ng' 'libutil-linux-selinux')
  optdepends=('python: python bindings to libmount')
  backup=(etc/pam.d/chfn
          etc/pam.d/chsh
          etc/pam.d/login
          etc/pam.d/su
          etc/pam.d/su-l)

  cd "${pkgbase/-selinux}-$pkgver"

  make DESTDIR="$pkgdir" install

  # setuid chfn and chsh
  chmod 4755 "$pkgdir"/usr/bin/{newgrp,ch{sh,fn}}

  # install PAM files for login-utils
  install -Dm644 "$srcdir/pam-common" "$pkgdir/etc/pam.d/chfn"
  install -m644 "$srcdir/pam-common" "$pkgdir/etc/pam.d/chsh"
  install -m644 "$srcdir/pam-login" "$pkgdir/etc/pam.d/login"
  install -m644 "$srcdir/pam-su" "$pkgdir/etc/pam.d/su"
  install -m644 "$srcdir/pam-su" "$pkgdir/etc/pam.d/su-l"

  # TODO(dreisner): offer this upstream?
  sed -i '/ListenStream/ aRuntimeDirectory=uuidd' "$pkgdir/usr/lib/systemd/system/uuidd.socket"

  # adjust for usrmove
  # TODO(dreisner): fix configure.ac upstream so that this isn't needed
  cd "$pkgdir"
  mv {,usr/}sbin/* usr/bin
  rmdir sbin usr/sbin

  ### runtime libs are shipped as part of libutil-linux
  rm "$pkgdir"/usr/lib/lib*.{a,so}*

  ### install systemd-sysusers
  install -Dm644 "$srcdir/util-linux.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/util-linux.conf"

  install -Dm644 "$srcdir/60-rfkill.rules" \
    "$pkgdir/usr/lib/udev/rules.d/60-rfkill.rules"

  install -Dm644 "$srcdir/rfkill-unblock_.service" \
    "$pkgdir/usr/lib/systemd/system/rfkill-unblock@.service"
  install -Dm644 "$srcdir/rfkill-block_.service" \
    "$pkgdir/usr/lib/systemd/system/rfkill-block@.service"
}

package_libutil-linux-selinux() {
  pkgdesc="util-linux-selinux runtime libraries"
  provides=('libblkid.so' 'libfdisk.so' 'libmount.so' 'libsmartcols.so' 'libuuid.so'
            "${pkgname/-selinux}=${pkgver}-${pkgrel}")
  depends=('libselinux')
  conflicts=("${pkgname/-selinux}")

  make -C "${pkgbase/-selinux}-$pkgver" DESTDIR="$pkgdir" install-usrlib_execLTLIBRARIES
}

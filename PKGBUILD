# $Id$
# Maintainer: Tom Gundersen <teg@jklm.no>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <nicky726@gmail.com>

pkgbase=util-linux-selinux
pkgname=(util-linux-selinux libutil-linux-selinux)
_pkgmajor=2.32
pkgver=${_pkgmajor}
pkgrel=2
pkgdesc="SELinux aware miscellaneous system utilities for Linux"
url="https://www.kernel.org/pub/linux/utils/util-linux/"
arch=('x86_64')
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
        '0001-fstrim-cleanup-uncludes.patch'
        '0002-libmount_include_sys_mount_h_only_if_necessary.patch'
        pam-{login,common,su}
        'util-linux.sysusers'
        '60-rfkill.rules'
        'rfkill-unblock_.service'
        'rfkill-block_.service')
sha256sums=('6c7397abc764e32e8159c2e96042874a190303e77adceb4ac5bd502a272a4734'
            'SKIP'
            'b1c0db069f60c086351f7a6fb7ff1add1c41e9ed7c1b65bd67e6604943fc4c75'
            'c65d8354fc2773035be8ac071541f4709763366d22a8a8f1bc2cb3401dcfdf69'
            '993a3096c2b113e6800f2abbd5d4233ebf1a97eef423990d3187d665d3490b92'
            'fc6807842f92e9d3f792d6b64a0d5aad87995a279153ab228b1b2a64d9f32f20'
            '51eac9c2a2f51ad3982bba35de9aac5510f1eeff432d2d63c6362e45d620afc0'
            '10b0505351263a099163c0d928132706e501dd0a008dac2835b052167b14abe3'
            '7423aaaa09fee7f47baa83df9ea6fef525ff9aec395c8cbd9fe848ceb2643f37'
            '8ccec10a22523f6b9d55e0d6cbf91905a39881446710aa083e935e8073323376'
            'a22e0a037e702170c7d88460cc9c9c2ab1d3e5c54a6985cd4a164ea7beff1b36')

prepare() {
  cd "${pkgbase/-selinux}-$pkgver"

  patch -Np1 -i ../0001-fstrim-cleanup-uncludes.patch
  patch -Np1 -i ../0002-libmount_include_sys_mount_h_only_if_necessary.patch
}

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

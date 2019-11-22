# Maintainer: Tom Gundersen <teg@jklm.no>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgbase=util-linux-selinux
pkgname=(util-linux-selinux libutil-linux-selinux)
_pkgmajor=2.34
pkgver=${_pkgmajor}
pkgrel=6
pkgdesc="SELinux aware miscellaneous system utilities for Linux"
url='https://github.com/karelzak/util-linux'
arch=('x86_64')
groups=('selinux')
# SELinux package maintenance note:
#   ArchLinux base packages have a build-time cyclic dependency because
#   systemd depends on libutil-linux and util-linux depends on libudev
#   provided by libsystemd (FS#39767).  To break this cycle, make
#   util-linux-selinux depend on systemd at build time.
makedepends=('systemd' 'python' 'libcap-ng' 'libselinux')
license=('GPL2')
options=('strip')
validpgpkeys=('B0C64D14301CC6EFAEDF60E4E4B71D5EEC39C284')  # Karel Zak
source=("https://www.kernel.org/pub/linux/utils/util-linux/v$_pkgmajor/${pkgbase/-selinux}-$pkgver.tar."{xz,sign}
        '0001-lsblk-force-to-print-PKNAME-for-partition.patch'
        pam-{login,common,runuser,su}
        'util-linux.sysusers'
        '60-rfkill.rules'
        'rfkill-unblock_.service'
        'rfkill-block_.service')
sha256sums=('743f9d0c7252b6db246b659c1e1ce0bd45d8d4508b4dfa427bbb4a3e9b9f62b5'
            'SKIP'
            'cfadc020011f88c028dc50c4e6790f5bae385b881417d917a8706c6ff78613d9'
            '993a3096c2b113e6800f2abbd5d4233ebf1a97eef423990d3187d665d3490b92'
            'fc6807842f92e9d3f792d6b64a0d5aad87995a279153ab228b1b2a64d9f32f20'
            '95b7cdc4cba17494d7b87f37f8d0937ec54c55de0e3ce9d9ab05ad5cc76bf935'
            '51eac9c2a2f51ad3982bba35de9aac5510f1eeff432d2d63c6362e45d620afc0'
            '10b0505351263a099163c0d928132706e501dd0a008dac2835b052167b14abe3'
            '7423aaaa09fee7f47baa83df9ea6fef525ff9aec395c8cbd9fe848ceb2643f37'
            '8ccec10a22523f6b9d55e0d6cbf91905a39881446710aa083e935e8073323376'
            'a22e0a037e702170c7d88460cc9c9c2ab1d3e5c54a6985cd4a164ea7beff1b36')

prepare() {
  cd "${pkgbase/-selinux}-$pkgver"

  patch -Np1 < ../0001-lsblk-force-to-print-PKNAME-for-partition.patch
}

build() {
  cd "${pkgbase/-selinux}-$pkgver"

  # We ship Debian's hardlink in package 'hardlink', Fedora's hardlink was
  # merged in util-linux. For now we disable the latter, but let's dicuss
  # the details:
  # https://bugs.archlinux.org/task/62896
  # https://github.com/karelzak/util-linux/issues/808

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --bindir=/usr/bin \
    --localstatedir=/var \
    --enable-fs-paths-default=/usr/bin:/usr/local/bin \
    --enable-raw \
    --enable-vipw \
    --enable-newgrp \
    --enable-chfn-chsh \
    --enable-write \
    --enable-mesg \
    --disable-hardlink \
    --with-selinux \
    --with-python=3

  make
}

package_util-linux-selinux() {
  conflicts=('rfkill'
             "${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
  provides=('rfkill'
            "${pkgname/-selinux}=${pkgver}-${pkgrel}"
            "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
  depends=('pam-selinux' 'shadow-selinux' 'coreutils-selinux'
           'systemd-libs-selinux' 'libcap-ng' 'libutil-linux-selinux')
  optdepends=('python: python bindings to libmount'
              'words: default dictionary for look')
  backup=(etc/pam.d/chfn
          etc/pam.d/chsh
          etc/pam.d/login
          etc/pam.d/runuser
          etc/pam.d/runuser-l
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
  install -m644 "$srcdir/pam-runuser" "$pkgdir/etc/pam.d/runuser"
  install -m644 "$srcdir/pam-runuser" "$pkgdir/etc/pam.d/runuser-l"
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

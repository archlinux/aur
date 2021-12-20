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
pkgname=(util-linux-selinux util-linux-libs-selinux)
_pkgmajor=2.37
_realver=${_pkgmajor}.2
pkgver=${_realver/-/}
pkgrel=4
pkgdesc='SELinux aware miscellaneous system utilities for Linux'
url='https://github.com/karelzak/util-linux'
arch=('x86_64' 'aarch64')
groups=('selinux')
# SELinux package maintenance note:
#   ArchLinux base packages have a build-time cyclic dependency because
#   systemd depends on libutil-linux and util-linux depends on libudev
#   provided by libsystemd (FS#39767).  To break this cycle, make
#   util-linux-selinux depend on systemd at build time.
makedepends=('asciidoctor' 'libcap-ng' 'libxcrypt' 'python' 'systemd' 'libselinux')
license=('GPL2')
options=('strip')
validpgpkeys=('B0C64D14301CC6EFAEDF60E4E4B71D5EEC39C284')  # Karel Zak
source=("https://www.kernel.org/pub/linux/utils/util-linux/v${_pkgmajor}/${pkgbase/-selinux}-${_realver}.tar."{xz,sign}
        pam-{login,common,runuser,su}
        'util-linux.sysusers'
        '60-rfkill.rules'
        'rfkill-unblock_.service'
        'rfkill-block_.service')
sha256sums=('6a0764c1aae7fb607ef8a6dd2c0f6c47d5e5fd27aa08820abaad9ec14e28e9d9'
            'SKIP'
            '99cd77f21ee44a0c5e57b0f3670f711a00496f198fc5704d7e44f5d817c81a0f'
            '57e057758944f4557762c6def939410c04ca5803cbdd2bfa2153ce47ffe7a4af'
            '48d6fba767631e3dd3620cf02a71a74c5d65a525d4c4ce4b5a0b7d9f41ebfea1'
            '3f54249ac2db44945d6d12ec728dcd0d69af0735787a8b078eacd2c67e38155b'
            '10b0505351263a099163c0d928132706e501dd0a008dac2835b052167b14abe3'
            '7423aaaa09fee7f47baa83df9ea6fef525ff9aec395c8cbd9fe848ceb2643f37'
            '8ccec10a22523f6b9d55e0d6cbf91905a39881446710aa083e935e8073323376'
            'a22e0a037e702170c7d88460cc9c9c2ab1d3e5c54a6985cd4a164ea7beff1b36')

build() {
  cd "${pkgbase/-selinux}-${_realver}"

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --enable-usrdir-path \
    --enable-fs-paths-default=/usr/bin:/usr/local/bin \
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
  conflicts=('rfkill' 'hardlink'
             "${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
  provides=('rfkill' 'hardlink'
            "${pkgname/-selinux}=${pkgver}-${pkgrel}"
            "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
  depends=('pam-selinux' 'shadow-selinux' 'coreutils-selinux'
           'systemd-libs' 'libsystemd.so' 'libudev.so'
           'libcap-ng' 'libxcrypt' 'libcrypt.so' 'util-linux-libs-selinux'
           'libmagic.so' 'libncursesw.so' 'libreadline.so')
  optdepends=('python: python bindings to libmount'
              'words: default dictionary for look')
  backup=(etc/pam.d/chfn
          etc/pam.d/chsh
          etc/pam.d/login
          etc/pam.d/runuser
          etc/pam.d/runuser-l
          etc/pam.d/su
          etc/pam.d/su-l)

  cd "${pkgbase/-selinux}-${_realver}"

  make DESTDIR="${pkgdir}" install

  # setuid chfn and chsh
  chmod 4755 "${pkgdir}"/usr/bin/{newgrp,ch{sh,fn}}

  # install PAM files for login-utils
  install -Dm0644 "${srcdir}/pam-common" "${pkgdir}/etc/pam.d/chfn"
  install -m0644 "${srcdir}/pam-common" "${pkgdir}/etc/pam.d/chsh"
  install -m0644 "${srcdir}/pam-login" "${pkgdir}/etc/pam.d/login"
  install -m0644 "${srcdir}/pam-runuser" "${pkgdir}/etc/pam.d/runuser"
  install -m0644 "${srcdir}/pam-runuser" "${pkgdir}/etc/pam.d/runuser-l"
  install -m0644 "${srcdir}/pam-su" "${pkgdir}/etc/pam.d/su"
  install -m0644 "${srcdir}/pam-su" "${pkgdir}/etc/pam.d/su-l"

  # TODO(dreisner): offer this upstream?
  sed -i '/ListenStream/ aRuntimeDirectory=uuidd' "${pkgdir}/usr/lib/systemd/system/uuidd.socket"

  # adjust for usrmove
  # TODO(dreisner): fix configure.ac upstream so that this isn't needed
  cd "${pkgdir}"
  mv usr/sbin/* usr/bin
  rmdir usr/sbin

  ### runtime libs are shipped as part of util-linux-libs
  rm "${pkgdir}"/usr/lib/lib*.{a,so}*

  ### install systemd-sysusers
  install -Dm0644 "${srcdir}/util-linux.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/util-linux.conf"

  install -Dm0644 "${srcdir}/60-rfkill.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/60-rfkill.rules"

  install -Dm0644 "${srcdir}/rfkill-unblock_.service" \
    "${pkgdir}/usr/lib/systemd/system/rfkill-unblock@.service"
  install -Dm0644 "${srcdir}/rfkill-block_.service" \
    "${pkgdir}/usr/lib/systemd/system/rfkill-block@.service"
}

package_util-linux-libs-selinux() {
  pkgdesc="util-linux-selinux runtime libraries"
  provides=('libutil-linux' 'libblkid.so' 'libfdisk.so' 'libmount.so' 'libsmartcols.so' 'libuuid.so'
            "${pkgname/-selinux}=${pkgver}-${pkgrel}"
            'libutil-linux-selinux')
  depends=('libselinux')
  conflicts=("${pkgname/-selinux}" 'libutil-linux-selinux')
  replaces=('libutil-linux-selinux')

  make -C "${pkgbase/-selinux}-${_realver}" DESTDIR="${pkgdir}" install-usrlib_execLTLIBRARIES
}

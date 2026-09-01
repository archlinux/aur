# Maintainer: Tom Gundersen <teg@jklm.no>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

# ➡️ Pushing pre-releases to [core-testing] can cause havoc, especially
#   as all [core] packages are built there, and may be moved before.
#   Anyway, pre-release packages may be available in my personal testing
#   repository. Brave souls add it with:
#     [eworm-testing]
#     SigLevel = Required
#     Server = https://pkgbuild.com/~eworm/$repo/$arch/

pkgbase=util-linux-selinux
pkgname=(util-linux-selinux util-linux-libs-selinux)
pkgver=2.42.2
pkgrel=1
pkgdesc='SELinux aware miscellaneous system utilities for Linux'
url='https://github.com/util-linux/util-linux'
arch=('x86_64' 'aarch64')
groups=('selinux')
# SELinux package maintenance note:
#   ArchLinux base packages have a build-time cyclic dependency because
#   systemd depends on libutil-linux and util-linux depends on libudev
#   provided by libsystemd (FS#39767).  To break this cycle, make
#   util-linux-selinux depend on systemd at build time.
makedepends=('asciidoctor'
             'bash-completion'
             'git'
             'libcap-ng'
             'libselinux'
             'libxcrypt'
             'meson'
             'po4a'
             'python'
             'sqlite'
             'systemd')
license=(
  'BSD-2-Clause'
  'BSD-3-Clause'
  'BSD-4-Clause-UC'
  'GPL-2.0-only'
  'GPL-2.0-or-later'
  'GPL-3.0-or-later'
  'ISC'
  'LGPL-2.1-or-later'
  'LicenseRef-PublicDomain'
)
options=('strip')
validpgpkeys=('B0C64D14301CC6EFAEDF60E4E4B71D5EEC39C284')  # Karel Zak
source=("git+https://github.com/util-linux/util-linux?signed#tag=v${pkgver/rc/-rc}"
        ${pkgbase/-selinux}-BSD-2-Clause.txt::https://raw.githubusercontent.com/Cyan4973/xxHash/f035303b8a86c1db9be70cbb638678ef6ef4cb2d/LICENSE
        {login,common,remote,runuser,su}.pam
        'util-linux.sysusers'
        '60-rfkill.rules'
        'rfkill-unblock_.service'
        'rfkill-block_.service')
sha256sums=('b12ee0ba37ccaf6c88f767637a4519d5fdf76ddd1acbf7e6fc29e9eeeea30d8f'
            '6ffedbc0f7878612d2b23589f1ff2ab15633e1df7963a5d9fc750ec5500c7e7a'
            'ee917d55042f78b8bb03f5467e5233e3e2ddc2fe01e302bc53b218003fe22275'
            '57e057758944f4557762c6def939410c04ca5803cbdd2bfa2153ce47ffe7a4af'
            '8bfbee453618ba44d60ba7fb00eced6c62edebfc592f2e75dede08e769ed8931'
            '48d6fba767631e3dd3620cf02a71a74c5d65a525d4c4ce4b5a0b7d9f41ebfea1'
            '3f54249ac2db44945d6d12ec728dcd0d69af0735787a8b078eacd2c67e38155b'
            '4a0b3dd8aa6d34dd29e1d153f396cacf908b0d64f7218276cbcab684587c0a0a'
            '7423aaaa09fee7f47baa83df9ea6fef525ff9aec395c8cbd9fe848ceb2643f37'
            '8ccec10a22523f6b9d55e0d6cbf91905a39881446710aa083e935e8073323376'
            'a22e0a037e702170c7d88460cc9c9c2ab1d3e5c54a6985cd4a164ea7beff1b36')

_backports=(
)

_reverts=(
)

prepare() {
  cd "${pkgbase/-selinux}"

  local _c _l
  for _c in "${_backports[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git cherry-pick --mainline 1 --no-commit "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git revert --mainline 1 --no-commit "${_c}"
  done

  # do not mark dirty
  sed -i '/dirty=/c dirty=' tools/git-version-gen

  # Skip kill/decode, as it adds RT0 in an unexpected way
  sed -i '/ts_skip_qemu_user/ ats_skip "Possible unexpected RT0 in output"' tests/ts/kill/decode
}

build() {
  local _meson_options=(
    -Dfs-search-path=/usr/bin:/usr/local/bin

    -Dlibuser=disabled
    -Dlibutempter=disabled
    -Dncurses=disabled
    -Dncursesw=enabled
    -Deconf=disabled
    -Dselinux=enabled

    -Dbuild-chfn-chsh=enabled
    -Dbuild-line=disabled
    -Dbuild-mesg=enabled
    -Dbuild-newgrp=enabled
    -Dbuild-vipw=enabled
    -Dbuild-write=enabled
  )

  arch-meson "${pkgbase/-selinux}" build "${_meson_options[@]}"

  meson compile -C build
}

check() {
  cd build
  ../util-linux/tests/run.sh --show-diff
}

package_util-linux-selinux() {
  conflicts=('rfkill' 'hardlink'
             "${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
  provides=('rfkill' 'hardlink'
            "${pkgname/-selinux}=${pkgver}-${pkgrel}"
            "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
  depends=("util-linux-libs-selinux=${pkgver}"
           'coreutils-selinux'
           'file' 'libmagic.so'
           'glibc'
           'libcap-ng'
           'libselinux' 'libselinux.so'
           'libxcrypt' 'libcrypt.so'
           'ncurses' 'libncursesw.so'
           'pam-selinux'
           'readline'
           'shadow-selinux'
           'systemd-libs' 'libsystemd.so' 'libudev.so'
           'zlib')
  optdepends=('words: default dictionary for look')
  backup=(etc/pam.d/chfn
          etc/pam.d/chsh
          etc/pam.d/login
          etc/pam.d/remote
          etc/pam.d/runuser
          etc/pam.d/runuser-l
          etc/pam.d/su
          etc/pam.d/su-l)

  _python_stdlib="$(python -c 'import sysconfig; print(sysconfig.get_paths()["stdlib"])')"

  DESTDIR="${pkgdir}" meson install -C build

  # remove static libraries
  rm "${pkgdir}"/usr/lib/lib*.a*

  # setuid chfn and chsh
  chmod 4755 "${pkgdir}"/usr/bin/{newgrp,ch{sh,fn}}

  # install PAM files for login-utils
  install -Dm0644 common.pam "${pkgdir}/etc/pam.d/chfn"
  install -Dm0644 common.pam "${pkgdir}/etc/pam.d/chsh"
  install -Dm0644 login.pam "${pkgdir}/etc/pam.d/login"
  install -Dm0644 remote.pam "${pkgdir}/etc/pam.d/remote"
  install -Dm0644 runuser.pam "${pkgdir}/etc/pam.d/runuser"
  install -Dm0644 runuser.pam "${pkgdir}/etc/pam.d/runuser-l"
  install -Dm0644 su.pam "${pkgdir}/etc/pam.d/su"
  install -Dm0644 su.pam "${pkgdir}/etc/pam.d/su-l"

  # TODO(dreisner): offer this upstream?
  sed -i '/ListenStream/ aRuntimeDirectory=uuidd' "${pkgdir}/usr/lib/systemd/system/uuidd.socket"

  # runtime libs are shipped as part of util-linux-libs
  install -d -m0755 util-linux-libs/lib/
  mv "$pkgdir"/usr/lib/lib*.so* util-linux-libs/lib/
  mv "$pkgdir"/usr/lib/pkgconfig util-linux-libs/lib/pkgconfig
  mv "$pkgdir"/usr/include util-linux-libs/include
  mv "$pkgdir"/"${_python_stdlib}"/site-packages util-linux-libs/site-packages
  rmdir "$pkgdir"/"${_python_stdlib}"
  mv "$pkgdir"/usr/share/man/man3 util-linux-libs/man3

  # install systemd-sysusers
  install -Dm0644 util-linux.sysusers \
    "${pkgdir}/usr/lib/sysusers.d/util-linux.conf"

  install -Dm0644 60-rfkill.rules \
    "${pkgdir}/usr/lib/udev/rules.d/60-rfkill.rules"

  install -Dm0644 rfkill-unblock_.service \
    "${pkgdir}/usr/lib/systemd/system/rfkill-unblock@.service"
  install -Dm0644 rfkill-block_.service \
    "${pkgdir}/usr/lib/systemd/system/rfkill-block@.service"

  install -vDm 644 ${pkgbase/-selinux}/Documentation/licenses/COPYING.{BSD*,ISC} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 ${pkgbase/-selinux}-BSD-2-Clause.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_util-linux-libs-selinux() {
  pkgdesc='util-linux-selinux runtime libraries'
  depends=('glibc'
           'libselinux'
           'sqlite')
  provides=('libutil-linux' 'libblkid.so' 'libfdisk.so' 'libmount.so' 'libsmartcols.so' 'libuuid.so'
            "${pkgname/-selinux}=${pkgver}-${pkgrel}"
            'libutil-linux-selinux')
  conflicts=("${pkgname/-selinux}" 'libutil-linux-selinux')
  replaces=('libutil-linux-selinux')
  optdepends=('python: python bindings to libmount')

  _python_stdlib="$(python -c 'import sysconfig; print(sysconfig.get_paths()["stdlib"])')"

  install -d -m0755 "$pkgdir"/{"${_python_stdlib}",usr/share/man/}
  mv util-linux-libs/lib/* "$pkgdir"/usr/lib/
  mv util-linux-libs/include "$pkgdir"/usr/include
  mv util-linux-libs/site-packages "$pkgdir"/"${_python_stdlib}"/site-packages
  mv util-linux-libs/man3 "$pkgdir"/usr/share/man/man3

  install -vDm 644 ${pkgbase/-selinux}/Documentation/licenses/COPYING.{BSD*,ISC} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 ${pkgbase/-selinux}-BSD-2-Clause.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: xerc <aur[at]xerc.de>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: milomouse <vincent[at]fea.st>
# Contributor: judd <jvinet@zeroflux.org>

_basename=util-linux
pkgbase=util-linux-aes
pkgname=(util-linux-aes util-linux-libs-aes)
_pkgmajor=2.42
_realver=${_pkgmajor}.2
pkgver=${_realver/-/}
pkgrel=1
pkgdesc='Miscellaneous system utilities for Linux, with loop-AES support'
url='https://github.com/util-linux/util-linux'
#url="http://sourceforge.net/projects/loop-aes/"
arch=('x86_64')
makedepends=('asciidoctor'
             'bash-completion'
             'gtk-doc'
             'libcap-ng'
             'libxcrypt'
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
install=${pkgname}.install
validpgpkeys=('B0C64D14301CC6EFAEDF60E4E4B71D5EEC39C284'  # Karel Zak
              '12D64C3ADCDA0AA427BDACDFF0733C808132F189') # Jari Ruusu
source=("https://www.kernel.org/pub/linux/utils/util-linux/v${_pkgmajor}/${_basename}-${_realver}.tar."{xz,sign}
        ${_basename}-BSD-2-Clause.txt::https://raw.githubusercontent.com/Cyan4973/xxHash/f035303b8a86c1db9be70cbb638678ef6ef4cb2d/LICENSE
        "${_basename}-${pkgver}.diff"
        {login,common,remote,runuser,su}.pam
        'util-linux-aes.sysusers'
        '60-rfkill.rules'
        'rfkill-unblock_.service'
        'rfkill-block_.service')
sha256sums=('03a05d3adf9602ef128f2da05b84b3205ce60c351e5737c0370f74000679ce8a'
            'SKIP'
            '6ffedbc0f7878612d2b23589f1ff2ab15633e1df7963a5d9fc750ec5500c7e7a'
            '49c158013141086912c22e8db72cb4a1a0ccb2204b4a8cb80dc3b9d48ef00cc7'
            'ee917d55042f78b8bb03f5467e5233e3e2ddc2fe01e302bc53b218003fe22275'
            '57e057758944f4557762c6def939410c04ca5803cbdd2bfa2153ce47ffe7a4af'
            '8bfbee453618ba44d60ba7fb00eced6c62edebfc592f2e75dede08e769ed8931'
            '48d6fba767631e3dd3620cf02a71a74c5d65a525d4c4ce4b5a0b7d9f41ebfea1'
            '5f4d36be03cc980930ba0a0e109d6b5625201f88a4ae7f913d632f5ab5866b87'
            '10b0505351263a099163c0d928132706e501dd0a008dac2835b052167b14abe3'
            '7423aaaa09fee7f47baa83df9ea6fef525ff9aec395c8cbd9fe848ceb2643f37'
            '8ccec10a22523f6b9d55e0d6cbf91905a39881446710aa083e935e8073323376'
            'a22e0a037e702170c7d88460cc9c9c2ab1d3e5c54a6985cd4a164ea7beff1b36')

_backports=(
)

_reverts=(
)

prepare() {
  cd "${_basename}-${pkgver}"

  # loop-aes patch
  patch -Np1 -i "../${_basename}-${pkgver}.diff"
  autoreconf -i

  # create fully locked system accout
  sed -i '/^u /s|u|u!|' misc-utils/uuidd-sysusers.conf.in

  # do not mark dirty
  sed -i '/dirty=/c dirty=' tools/git-version-gen
}

build() {
  cd "${_basename}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --enable-usrdir-path \
    --enable-fs-paths-default=/usr/bin:/usr/local/bin \
    --enable-vipw \
    --enable-newgrp \
    --enable-chfn-chsh \
    --enable-write \
    --enable-mesg \
    --with-python=3

  make
}

package_util-linux-aes() {
  conflicts=('rfkill' 'hardlink' "${_basename}")
  provides=('rfkill' 'hardlink' "${_basename}=2.42")
  replaces=('rfkill' 'hardlink')
  depends=("util-linux-libs-aes"
           'coreutils'
           'file' 'libmagic.so'
           'glibc'
           'libcap-ng'
           'libgcc' 'libgcc_s.so'
           'libxcrypt' 'libcrypt.so'
           'ncurses' 'libncursesw.so'
           'pam'
           'readline'
           'shadow'
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

  make -C "${_basename}-${pkgver}" DESTDIR="${pkgdir}" usrsbin_execdir=/usr/bin install

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
  install -Dm0644 util-linux-aes.sysusers \
    "${pkgdir}/usr/lib/sysusers.d/util-linux-aes.conf"

  install -Dm0644 60-rfkill.rules \
    "${pkgdir}/usr/lib/udev/rules.d/60-rfkill.rules"

  install -Dm0644 rfkill-unblock_.service \
    "${pkgdir}/usr/lib/systemd/system/rfkill-unblock@.service"
  install -Dm0644 rfkill-block_.service \
    "${pkgdir}/usr/lib/systemd/system/rfkill-block@.service"

  install -vDm 644 ${_basename}-${pkgver}/Documentation/licenses/COPYING.{BSD*,ISC} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 ${_basename}-BSD-2-Clause.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_util-linux-libs-aes() {
  pkgdesc='util-linux runtime libraries updated with loop-aes'
  depends=('glibc'
           'sqlite')
  provides=('libutil-linux' 'libblkid.so' 'libfdisk.so' 'libmount.so' 'libsmartcols.so' 'libuuid.so' "${_basename}-libs=2.42")
  conflicts=('libutil-linux' "${_basename}-libs")
  replaces=('libutil-linux')
  optdepends=('python: python bindings to libmount')

  install -d -m0755 "$pkgdir"/{"${_python_stdlib}",usr/share/man/}
  mv util-linux-libs/lib/* "$pkgdir"/usr/lib/
  mv util-linux-libs/include "$pkgdir"/usr/include
  mv util-linux-libs/site-packages "$pkgdir"/"${_python_stdlib}"/site-packages
  mv util-linux-libs/man3 "$pkgdir"/usr/share/man/man3

  install -vDm 644 ${_basename}-${pkgver}/Documentation/licenses/COPYING.{BSD*,ISC} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 ${_basename}-BSD-2-Clause.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

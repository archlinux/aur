# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: xerc <aur[at]xerc.de>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: milomouse <vincent[at]fea.st>
# Contributor: judd <jvinet@zeroflux.org>

_basename=util-linux
pkgbase=util-linux-aes
pkgname=(util-linux-aes util-linux-libs-aes)
_pkgmajor=2.38
_realver=${_pkgmajor}.1
pkgver=${_realver/-/}
pkgrel=1
pkgdesc='Miscellaneous system utilities for Linux, with loop-AES support'
url='https://github.com/karelzak/util-linux'
#url="http://sourceforge.net/projects/loop-aes/"
arch=('x86_64')
makedepends=('asciidoctor' 'libcap-ng' 'libxcrypt' 'python' 'systemd' 'gtk-doc')
license=('GPL2')
options=('strip')
install=${pkgname}.install
validpgpkeys=('B0C64D14301CC6EFAEDF60E4E4B71D5EEC39C284'  # Karel Zak
              '12D64C3ADCDA0AA427BDACDFF0733C808132F189') # Jari Ruusu
source=("https://www.kernel.org/pub/linux/utils/util-linux/v${_pkgmajor}/${_basename}-${_realver}.tar."{xz,sign}
        "${_basename}-${pkgver}.diff"
        pam-{login,common,runuser,su}
        'util-linux-aes.sysusers'
        '60-rfkill.rules'
        'rfkill-unblock_.service'
        'rfkill-block_.service')
sha256sums=('60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f'
            'SKIP'
            '58238cf5bcacd1a5a0717cd5d1f3fccb74e6192e20b58f8282169bc80d518a8e'
            '99cd77f21ee44a0c5e57b0f3670f711a00496f198fc5704d7e44f5d817c81a0f'
            '57e057758944f4557762c6def939410c04ca5803cbdd2bfa2153ce47ffe7a4af'
            '48d6fba767631e3dd3620cf02a71a74c5d65a525d4c4ce4b5a0b7d9f41ebfea1'
            '3f54249ac2db44945d6d12ec728dcd0d69af0735787a8b078eacd2c67e38155b'
            '10b0505351263a099163c0d928132706e501dd0a008dac2835b052167b14abe3'
            '7423aaaa09fee7f47baa83df9ea6fef525ff9aec395c8cbd9fe848ceb2643f37'
            '8ccec10a22523f6b9d55e0d6cbf91905a39881446710aa083e935e8073323376'
            'a22e0a037e702170c7d88460cc9c9c2ab1d3e5c54a6985cd4a164ea7beff1b36')

prepare() {
  cd "$_basename-$pkgver"

  patch -Np1 -i "../${_basename}-${pkgver}.diff"
  autoreconf -i
}

build() {
  cd "${_basename}-${_realver}"

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
  provides=('rfkill' 'hardlink' "${_basename}=2.38")
  replaces=('rfkill' 'hardlink')
  depends=('pam' 'shadow' 'coreutils' 'systemd-libs' 'libsystemd.so'
           'libudev.so' 'libcap-ng' 'libxcrypt' 'libcrypt.so' 'util-linux-libs-aes'
           'libmagic.so' 'libncursesw.so')
  optdepends=('words: default dictionary for look')
  backup=(etc/pam.d/chfn
          etc/pam.d/chsh
          etc/pam.d/login
          etc/pam.d/runuser
          etc/pam.d/runuser-l
          etc/pam.d/su
          etc/pam.d/su-l)

  make -C "${_basename}-${_realver}" DESTDIR="${pkgdir}" usrsbin_execdir=/usr/bin install

  # remove static libraries
  rm "${pkgdir}"/usr/lib/lib*.a*

  # setuid chfn and chsh
  chmod 4755 "${pkgdir}"/usr/bin/{newgrp,ch{sh,fn}}

  # install PAM files for login-utils
  install -Dm0644 pam-common "${pkgdir}/etc/pam.d/chfn"
  install -m0644 pam-common "${pkgdir}/etc/pam.d/chsh"
  install -m0644 pam-login "${pkgdir}/etc/pam.d/login"
  install -m0644 pam-runuser "${pkgdir}/etc/pam.d/runuser"
  install -m0644 pam-runuser "${pkgdir}/etc/pam.d/runuser-l"
  install -m0644 pam-su "${pkgdir}/etc/pam.d/su"
  install -m0644 pam-su "${pkgdir}/etc/pam.d/su-l"

  # TODO(dreisner): offer this upstream?
  sed -i '/ListenStream/ aRuntimeDirectory=uuidd' "${pkgdir}/usr/lib/systemd/system/uuidd.socket"

  # runtime libs are shipped as part of util-linux-libs
  install -d -m0755 util-linux-libs/lib/
  mv "$pkgdir"/usr/lib/lib*.so* util-linux-libs/lib/
  mv "$pkgdir"/usr/lib/pkgconfig util-linux-libs/lib/pkgconfig
  mv "$pkgdir"/usr/include util-linux-libs/include
  mv "$pkgdir"/usr/lib/python3.10/site-packages util-linux-libs/site-packages
  rmdir "$pkgdir"/usr/lib/python3.10
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
}

package_util-linux-libs-aes() {
  pkgdesc="util-linux runtime libraries"
  depends=('glibc')
  provides=('libutil-linux' 'libblkid.so' 'libfdisk.so' 'libmount.so' 'libsmartcols.so' 'libuuid.so' "${_basename}-libs=2.38")
  conflicts=('libutil-linux' "${_basename}-libs")
  replaces=('libutil-linux')
  optdepends=('python: python bindings to libmount')

  install -d -m0755 "$pkgdir"/usr/{lib/python3.10/,share/man/}
  mv util-linux-libs/lib/* "$pkgdir"/usr/lib/
  mv util-linux-libs/include "$pkgdir"/usr/include
  mv util-linux-libs/site-packages "$pkgdir"/usr/lib/python3.10/site-packages
  mv util-linux-libs/man3 "$pkgdir"/usr/share/man/man3
}

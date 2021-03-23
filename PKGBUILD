# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: xerc <aur[at]xerc.de>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: milomouse <vincent[at]fea.st>
# Contributor: judd <jvinet[at]zeroflux.org>

_basename=util-linux
pkgbase=util-linux-aes
pkgname=(util-linux-aes util-linux-libs-aes)
_pkgmajor=2.36
pkgver=${_pkgmajor}.2
pkgrel=1.4
pkgdesc='Miscellaneous system utilities for Linux, with loop-AES support'
url='https://github.com/karelzak/util-linux'
#url="http://sourceforge.net/projects/loop-aes/"
arch=('x86_64')
makedepends=('systemd' 'python' 'libcap-ng' 'libxcrypt' 'gtk-doc')
license=('GPL2')
options=('strip')
install=${pkgname}.install
validpgpkeys=('B0C64D14301CC6EFAEDF60E4E4B71D5EEC39C284')  # Karel Zak
source=("https://www.kernel.org/pub/linux/utils/util-linux/v$_pkgmajor/${_basename}-$pkgver.tar."{xz,sign}
        "${_basename}-${pkgver}.diff"
        "${pkgname}.modules"
        pam-{login,common,runuser,su}
        'util-linux-aes.sysusers'
        '60-rfkill.rules'
        'rfkill-unblock_.service'
        'rfkill-block_.service')
sha256sums=('f7516ba9d8689343594356f0e5e1a5f0da34adfbc89023437735872bb5024c5f'
            'SKIP'
            '7eb2693de4bb1b11198f3a873f061d69511a5f965f1ecedeeeff98a7d772d995'
            '560ca858961eb997a216ce6b419d900e84688591abf4584ef30c9323ba06fffd'
            '993a3096c2b113e6800f2abbd5d4233ebf1a97eef423990d3187d665d3490b92'
            'fc6807842f92e9d3f792d6b64a0d5aad87995a279153ab228b1b2a64d9f32f20'
            '95b7cdc4cba17494d7b87f37f8d0937ec54c55de0e3ce9d9ab05ad5cc76bf935'
            '51eac9c2a2f51ad3982bba35de9aac5510f1eeff432d2d63c6362e45d620afc0'
            'a3980e33ef3a8d356379b4964c9730fd525d46e5b28cded5d0b50d6dc8a5563c'
            '7423aaaa09fee7f47baa83df9ea6fef525ff9aec395c8cbd9fe848ceb2643f37'
            '8ccec10a22523f6b9d55e0d6cbf91905a39881446710aa083e935e8073323376'
            'a22e0a037e702170c7d88460cc9c9c2ab1d3e5c54a6985cd4a164ea7beff1b36')

prepare() {
  cd "$_basename-$pkgver"
  patch -Np1 -i "../${_basename}-${pkgver}.diff"
  autoreconf -i
}

build() {
  cd "$_basename-$pkgver"

  # We ship Debian's hardlink in package 'hardlink', Fedora's hardlink was
  # merged in util-linux. For now we disable the latter, but let's dicuss
  # the details:
  # https://bugs.archlinux.org/task/62896
  # https://github.com/karelzak/util-linux/issues/808

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
    --disable-hardlink \
    --with-python=3

  make
}

package_util-linux-aes() {
  conflicts=('rfkill' "${_basename}")
  provides=('rfkill' "${_basename}=2.36")
  replaces=('rfkill')
  depends=('pam' 'shadow' 'coreutils' 'systemd-libs' 'libsystemd.so'
           'libudev.so' 'libcap-ng' 'libxcrypt' 'libcrypt.so' 'util-linux-libs-aes'
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

  cd "$_basename-$pkgver"

  make DESTDIR="$pkgdir" install

  # setuid chfn and chsh
  chmod 4755 "$pkgdir"/usr/bin/{newgrp,ch{sh,fn}}

  # install PAM files for login-utils
  install -Dm0644 "$srcdir/pam-common" "$pkgdir/etc/pam.d/chfn"
  install -m0644 "$srcdir/pam-common" "$pkgdir/etc/pam.d/chsh"
  install -m0644 "$srcdir/pam-login" "$pkgdir/etc/pam.d/login"
  install -m0644 "$srcdir/pam-runuser" "$pkgdir/etc/pam.d/runuser"
  install -m0644 "$srcdir/pam-runuser" "$pkgdir/etc/pam.d/runuser-l"
  install -m0644 "$srcdir/pam-su" "$pkgdir/etc/pam.d/su"
  install -m0644 "$srcdir/pam-su" "$pkgdir/etc/pam.d/su-l"

  # TODO(dreisner): offer this upstream?
  sed -i '/ListenStream/ aRuntimeDirectory=uuidd' "$pkgdir/usr/lib/systemd/system/uuidd.socket"

  # adjust for usrmove
  # TODO(dreisner): fix configure.ac upstream so that this isn't needed
  cd "$pkgdir"
  mv usr/sbin/* usr/bin
  rmdir usr/sbin

  ### runtime libs are shipped as part of util-linux-libs
  rm "$pkgdir"/usr/lib/lib*.{a,so}*

  ### install systemd-sysusers
  install -Dm0644 "$srcdir/util-linux-aes.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/util-linux-aes.conf"

  install -Dm0644 "$srcdir/60-rfkill.rules" \
    "$pkgdir/usr/lib/udev/rules.d/60-rfkill.rules"

  install -Dm0644 "$srcdir/rfkill-unblock_.service" \
    "$pkgdir/usr/lib/systemd/system/rfkill-unblock@.service"
  install -Dm0644 "$srcdir/rfkill-block_.service" \
    "$pkgdir/usr/lib/systemd/system/rfkill-block@.service"

  # install modules
  install -Dm644 "${srcdir}/${pkgname}.modules" "${pkgdir}/etc/modules-load.d/${pkgname}.conf"
}

package_util-linux-libs-aes() {
  pkgdesc="util-linux runtime libraries"
  provides=('libutil-linux' 'libblkid.so' 'libfdisk.so' 'libmount.so' 'libsmartcols.so' 'libuuid.so' "${_basename}-libs=2.36")
  conflicts=('libutil-linux' "${_basename}-libs")
  replaces=('libutil-linux')

  make -C "$_basename-$pkgver" DESTDIR="$pkgdir" install-usrlib_execLTLIBRARIES
}

# Maintainer: xerc <aur[at]xerc.de>
# Contributor: judd <jvinet[at]zeroflux.org>
# Contributor: milomouse <vincent[at]fea.st>
# Contributor: falconindy <d[at]falconindy.com>

_basename=util-linux
pkgname=${_basename}-aes
_basever=2.29
pkgver=${_basever}.2
pkgrel=1
aneurysma=${pkgver}

pkgdesc="Miscellaneous system utilities for Linux, with loop-AES support"
url="http://sourceforge.net/projects/loop-aes/"

validpgpkeys=('B0C64D14301CC6EFAEDF60E4E4B71D5EEC39C284') # Karel Zak
license=('GPL2')

arch=('any')
groups=('base')

options=('strip' 'debug' '!libtool')
depends=('pam' 'shadow' 'coreutils' 'libsystemd' 'glibc' 'zlib' 'git')

provides=('eject' 'zramctl' "${_basename}=${pkgver}" "lib${_basename}=${pkgver}" "${_basename}-ng=${pkgver}" 'libblkid.so' 'libfdisk.so' 'libmount.so' 'libsmartcols.so' 'libuuid.so')
replaces=('eject' 'zramctl' "${_basename}" "lib${_basename}" "${_basename}-ng" "${_basename}-ng-aes")
conflicts=(${replaces[*]})

install=${pkgname}.install
makedepends=('systemd' 'python' 'autoconf' 'automake')

source=(
  "https://www.kernel.org/pub/linux/utils/util-linux/v${_basever}/${_basename}-${pkgver}.tar."{xz,sign}
  pam-common::"https://projects.archlinux.org/svntogit/packages.git/plain/trunk/pam-common?h=packages/${_basename}"
  pam-login::"https://projects.archlinux.org/svntogit/packages.git/plain/trunk/pam-login?h=packages/${_basename}"
  pam-su::"https://projects.archlinux.org/svntogit/packages.git/plain/trunk/pam-su?h=packages/${_basename}"
  util-linux.sysusers::"https://git.archlinux.org/svntogit/packages.git/plain/trunk/util-linux.sysusers?h=packages/${_basename}"
  0001-sfdisk-support-empty-label-use-case.patch::"https://git.archlinux.org/svntogit/packages.git/plain/trunk/0001-sfdisk-support-empty-label-use-case.patch?h=packages/${_basename}"
#  "http://loop-aes.sourceforge.net/updates/${_basename}-${aneurysma}.diff.bz2"
#  "http://loop-aes.sourceforge.net/updates/${_basename}-${aneurysma}.diff.bz2"{,.sign}
  ${pkgname}.sysusers
  ${pkgname}.modules
  ${_basename}-${aneurysma}.diff
)

prepare() {
  cd "${srcdir}/${_basename}-${pkgver}"

  msg "Patching ${_basename} (1/1)"
  patch -Np1 -i "${srcdir}/0001-sfdisk-support-empty-label-use-case.patch"
}

build() {
  cd "${srcdir}/${_basename}-${pkgver}"

  msg "Patching with loop-AES"
  patch -Np1 -i "${srcdir}/${_basename}-${aneurysma}.diff"

  msg "Starting autogen"
  ./autogen.sh

  msg "Starting configure"
  ./configure \
    --prefix=/usr \
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
    --enable-partx \
    --disable-tailf \
    --with-python=3

  msg "Starting make"
  make
}

package() {
  cd "${srcdir}/${_basename}-${pkgver}"

  make DESTDIR="$pkgdir" install

  # setuid chfn and chsh
  chmod 4755 "${pkgdir}"/usr/bin/{newgrp,ch{sh,fn}}

  # install modules
  install -Dm644 "${srcdir}/${pkgname}.modules" "${pkgdir}/etc/modules-load.d/${pkgname}.conf"

  # install sysusers
  install -Dm644 "${srcdir}/util-linux.sysusers" "${pkgdir}/usr/lib/sysusers.d/util-linux.conf"install -Dm644 "${srcdir}/${pkgname}.modules" "${pkgdir}/etc/modules-load.d/${pkgname}.conf"

  # install PAM files for login-utils
  install -Dm644 "${srcdir}/pam-common" "${pkgdir}/etc/pam.d/chfn"
  install -m644 "${srcdir}/pam-common" "${pkgdir}/etc/pam.d/chsh"
  install -m644 "${srcdir}/pam-login" "${pkgdir}/etc/pam.d/login"
  install -m644 "${srcdir}/pam-su" "${pkgdir}/etc/pam.d/su"
  install -m644 "${srcdir}/pam-su" "${pkgdir}/etc/pam.d/su-l"

  # TODO(dreisner): offer this upstream?
  sed -i '/ListenStream/ aRuntimeDirectory=uuidd' "$pkgdir/usr/lib/systemd/system/uuidd.socket"

  # adjust for usrmove
  # TODO(dreisner): fix configure.ac upstream so that this isn't needed
  cd "${pkgdir}"
  mv {,usr/}sbin/* usr/bin
  rmdir sbin usr/sbin

  # DO NOT create libutil-linux split : The AUR does not support split packages!
}

md5sums=('63c40c2068fcbb7e1d5c1d281115d973'
         'SKIP'
         'a31374fef2cba0ca34dfc7078e2969e4'
         '4368b3f98abd8a32662e094c54e7f9b1'
         'fa85e5cce5d723275b14365ba71a8aad'
         'dfc9904f67ebc54bb347ca3cc430ef2b'
         '6d2e3915124938577f0ff18ef701c87f'
         'dfc9904f67ebc54bb347ca3cc430ef2b'
         'a10bfcaff767a4cb3066106bfd4ea30b'
         'b78b4fd5d0b4e22724a1df660e0bb4e2')

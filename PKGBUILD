# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Mathias Buren <mathias.buren@gmail.com>
# From core package
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

set -u
_pkgname='mdadm'
pkgname="${_pkgname}-git"
pkgver=3.3.4.r22.gccc93b3
pkgrel=1
pkgdesc='create, manage, and monitor Linux mdraid block device RAID arrays'
arch=('i686' 'x86_64')
license=('GPL')
#url='https://github.com/neilbrown/mdadm'
url='http://neil.brown.name/blog/mdadm'
conflicts=('mkinitcpio<0.7' "${_pkgname}")
provides=("${_pkgname}=${pkgver%.r*}")
makedepends=('git')
depends=('glibc')
#optdepends=('lvm2' 'dm-crypt' 'bcache')
backup=("etc/${_pkgname}.conf")
_verwatch=('ftp://ftp.kernel.org/pub/linux/utils/raid/mdadm/' 'mdadm-\(.*\)\.tar\.xz' 'f')
_archlink="@@@::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/@@@?h=packages/${_pkgname}"
source=(# use either one, but not both. Reset with makepkg -sCf. My comparison shows these are identical, including the tags. Github is faster.
        #"mdadm_gitnb::git://neil.brown.name/${_pkgname}"
        "mdadm_github::git+https://github.com/neilbrown/${_pkgname}.git"
        "${_archlink//@@@/${_pkgname}.conf}"
        "${_archlink//@@@/${_pkgname}_hook}"
        "${_archlink//@@@/${_pkgname}_install}"
        "${_archlink//@@@/${_pkgname}_udev_install}"
        "mdadm_udev_hook")
install="${_pkgname}.install"
replaces=('raidtools')
sha256sums=('SKIP'
            '4ce1e90690282f98e4828e11576fbd61be65e97a2cdae6c7eac7035ea5ee53e5'
            'd297b4fa6213016ec08e4f66d07cf7eb03426e4e17ab31eddfa5c5c1d82ea294'
            '15bc46b9fa663dc204e2168861fabfd26e0dbcbb073792f271e3e4510897fb4e'
            '170b0e5d548416c0adb9df4e6941bea6bc33d843419c997e45ecaf9e36a58f38'
            'd395184617f45849cbbaf5b4ee3665ca6895a1d642e0470e9de703ce944279ca')

pkgver() {
  cd mdadm_git*/
  git describe --long | sed -e 's/^mdadm-//g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}

prepare() {
  set -u
  cd mdadm_git*/
  # NB strives for warning free code so the werror patch should not be necessary. Comment but don't erase it as it may be needed from time to time.
  #sed -i -e 's: -Werror : :g' 'Makefile' # disable-werror.patch
  sed -i -e 's:/usr/sbin/:/usr/bin:g' -e 's:/sbin:/usr/bin:g' 'Makefile' 'test' 'mkinitramfs' 'mdadm.conf.5'
  set +u
}

build() {
  set -u
  cd mdadm_git*/
  msg2 'Build mdadm'
  make -s -j $(nproc) CXFLAGS="${CFLAGS}" BINDIR='/usr/bin' UDEVDIR='/usr/lib/udev'
  # build static mdassemble for Arch's initramfs for use with mkinitcpio hook mdadm. Hook mdadm_udev does not use mdassemble.
  msg2 'Build mdassemble'
  make -s -j $(nproc) CXFLAGS="${CFLAGS}" MDASSEMBLE_AUTO=1 mdassemble
  set +u
}

check() {
  set -u
  cd mdadm_git*/
  make -s -j $(nproc) CXFLAGS="${CFLAGS}" test
  #sudo ./test # can't do sudo in a PKGBUILD
  set +u
}

package() {
  set -u
  cd mdadm_git*/
  make -s INSTALL='/usr/bin/install' BINDIR='/usr/bin' DESTDIR="${pkgdir}" UDEVDIR='/usr/lib/udev' install
  make -s SYSTEMD_DIR="${pkgdir}/usr/lib/systemd/system" install-systemd # does not honor silent -s
  install -Dpm755 'mdassemble' -t "${pkgdir}/usr/bin/"
  install -Dpm644 "${srcdir}/mdadm.conf" -t "${pkgdir}/etc/"
  sed -i -e 's:/usr/sbin/:/usr/bin:g' "${pkgdir}/etc/mdadm.conf"
  install -Dpm644 "${srcdir}/mdadm_install" "${pkgdir}/usr/lib/initcpio/install/mdadm"
  ## 2015-08-04 mdadm is required even when using mdassemble. This eliminates the need for adding mdadm to BINARIES="" in mkinitcpio.conf
  #if ! grep -q '/usr/bin/mdadm' "${pkgdir}/usr/lib/initcpio/install/mdadm"; then
  #  sed -i -e 's:^\(\s\+\)\(add_binary \):\1\2"/usr/bin/mdadm"\n&:g' "${pkgdir}/usr/lib/initcpio/install/mdadm"
  #fi
  install -Dpm644 "${srcdir}/mdadm_hook" "${pkgdir}/usr/lib/initcpio/hooks/mdadm"
  sed -i -e 's:/usr/bin/ash:/usr/bin/bash:g' "${pkgdir}/usr/lib/initcpio/hooks/mdadm"
  install -Dpm644 "${srcdir}/mdadm_udev_install" "${pkgdir}/usr/lib/initcpio/install/mdadm_udev"
  if ! grep -q 'add_runscript' "${pkgdir}/usr/lib/initcpio/install/mdadm_udev"; then
    sed -i -e 's:^\(\s\+\)add_binary:\1add_runscript\n&:g' "${pkgdir}/usr/lib/initcpio/install/mdadm_udev"
  fi
  install -Dpm644 "${srcdir}/mdadm_udev_hook" "${pkgdir}/usr/lib/initcpio/hooks/mdadm_udev"
  sed -i -e 's:#!/bin/bash:#!/usr/bin/bash:g' "${pkgdir}/usr/lib/initcpio/install"/{mdadm,mdadm_udev}
  sed -i -e 's:#!/bin/sh:#!/usr/bin/sh:g' "${pkgdir}/usr/lib/systemd/system-shutdown/mdadm.shutdown"
  #ln -sf 'mdadm' "${pkgdir}/usr/lib/initcpio/hooks/raid" # symlink for backward compatibility
  set +u
  # Ensure there are no forbidden paths. Place at the end of package() and comment out as you find or need exceptions. (git-aurcheck)
  ! test -d "${pkgdir}/bin" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
  ! test -d "${pkgdir}/sbin" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! test -d "${pkgdir}/lib" || { echo "Line ${LINENO} Forbidden: /lib"; false; }
  ! test -d "${pkgdir}/share" || { echo "Line ${LINENO} Forbidden: /share"; false; }
  ! test -d "${pkgdir}/usr/sbin" || { echo "Line ${LINENO} Forbidden: /usr/sbin"; false; }
  ! test -d "${pkgdir}/usr/local" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  ! grep -lr "/sbin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! grep -lr "/usr/tmp" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/tmp"; false; }
  ! grep -lr "/usr/local" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  ! pcre2grep -Ilr "(?<!/usr)/bin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
}
set +u

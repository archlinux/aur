# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Mathias Buren <mathias.buren@gmail.com>
# From core package
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

set -u
_pkgname='mdadm'
pkgname="${_pkgname}-git"
pkgver=mdadm.3.3.3.r16.g53a087b
pkgrel=1
pkgdesc='create, manage, and monitor Linux md block device RAID arrays'
arch=('i686' 'x86_64')
license=('GPL')
url='http://neil.brown.name/blog/mdadm'
conflicts=('mkinitcpio<0.7' 'mdadm')
makedepends=('git')
depends=('linux' 'glibc')
backup=("etc/${_pkgname}.conf")
_archlink="@@@::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/@@@?h=packages/${_pkgname}"
source=(# use either one, but not both. Reset with makepkg -sCf. My comparison shows these are identical, including the tags. Github is faster.
        #"mdadm_gitnb::git://neil.brown.name/${_pkgname}"
        "mdadm_github::git+https://github.com/neilbrown/${_pkgname}.git"
        "${_archlink//@@@/${_pkgname}.conf}"
        "${_archlink//@@@/${_pkgname}_install}"
        "${_archlink//@@@/${_pkgname}_udev_install}"
        "${_archlink//@@@/${_pkgname}_hook}")
install="${_pkgname}.install"
replaces=('raidtools')

sha256sums=('SKIP'
            '4ce1e90690282f98e4828e11576fbd61be65e97a2cdae6c7eac7035ea5ee53e5'
            '15bc46b9fa663dc204e2168861fabfd26e0dbcbb073792f271e3e4510897fb4e'
            '170b0e5d548416c0adb9df4e6941bea6bc33d843419c997e45ecaf9e36a58f38'
            'd297b4fa6213016ec08e4f66d07cf7eb03426e4e17ab31eddfa5c5c1d82ea294')

pkgver() {
  cd mdadm_git*/
  git describe --long | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}

prepare() {
  set -u
  cd mdadm_git*/
  sed -i -e 's: -Werror : :g' 'Makefile' # disable-werror.patch. NB strives for warning free code so this patch should not be necessary.
  sed -i -e 's:/usr/sbin/:/usr/bin:g' -e 's:/sbin:/usr/bin:g' 'Makefile' 'test' 'mkinitramfs' 'mdadm.conf.5'
  set +u
}

build() {
  set -u
  cd mdadm_git*/
  local _XFlags='-O' # -Wno-maybe-uninitialized' # uninitalized warnings are too dangerous to be hidden
  CPPFLAGS+=" ${_XFlags}" # warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Wcpp]
  CXXFLAGS+=" ${_XFlags}" # Despite claims in the Makefile, make CXFLAGS='-O' doesn't work.
  make -s -j $(nproc) BINDIR='/usr/bin' UDEVDIR='/usr/lib/udev'
  # build static mdassemble for Arch's initramfs for use with (deprecated) mkinitcpio hook mdadm
  make -s MDASSEMBLE_AUTO=1 mdassemble
  # https://github.com/neilbrown/mdadm/issues/10
  # mdassemble used by hook mdadm does not update the map file
  set +u
}

check() {
  set -u
  cd mdadm_git*/
  make -s test
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
  install -Dpm644 "${srcdir}/mdadm_hook" "${pkgdir}/usr/lib/initcpio/hooks/mdadm"
  install -Dpm644 "${srcdir}/mdadm_udev_install" "${pkgdir}/usr/lib/initcpio/install/mdadm_udev"
  sed -i -e 's:#!/bin/bash:#!/usr/bin/bash:g' "${pkgdir}/usr/lib/initcpio/install"/{mdadm,mdadm_udev}
  sed -i -e 's:#!/bin/sh:#!/usr/bin/sh:g' "${pkgdir}/usr/lib/systemd/system-shutdown/mdadm.shutdown"
  #ln -sf 'mdadm' "${pkgdir}/usr/lib/initcpio/hooks/raid" # symlink for backward compatibility
  set +u
  # Ensure there are no forbidden paths. Place at the end of package() and comment out as you find or need exceptions. (git-aurcheck)
  ! test -d "${pkgdir}/bin" || { echo "Line ${LINENO} Forbidden: /bin"; echo "${}"; }
  ! test -d "${pkgdir}/sbin" || { echo "Line ${LINENO} Forbidden: /sbin"; echo "${}"; }
  ! test -d "${pkgdir}/lib" || { echo "Line ${LINENO} Forbidden: /lib"; echo "${}"; }
  ! test -d "${pkgdir}/share" || { echo "Line ${LINENO} Forbidden: /share"; echo "${}"; }
  ! test -d "${pkgdir}/usr/sbin" || { echo "Line ${LINENO} Forbidden: /usr/sbin"; echo "${}"; }
  ! test -d "${pkgdir}/usr/local" || { echo "Line ${LINENO} Forbidden: /usr/local"; echo "${}"; }
  ! grep -lr "/sbin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /sbin"; echo "${}"; }
  ! grep -lr "/usr/tmp" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/tmp"; echo "${}"; }
  ! grep -lr "/usr/local" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/local"; echo "${}"; }
  ! pcre2grep -Ilr "(?<!/usr)/bin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /bin"; echo "${}"; }
}
set +u

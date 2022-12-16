# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Mathias Buren <mathias.buren@gmail.com>
# From core package
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

set -u
_pkgname='mdadm'
pkgname="${_pkgname}-git"
pkgver=4.2.r61.g8b668d4a
pkgrel=1
pkgdesc='A tool for managing/monitoring Linux md device arrays, also known as Software RAID'
arch=('i686' 'x86_64')
#url='https://github.com/neilbrown/mdadm'
#url='http://neil.brown.name/blog/mdadm'
license=('GPL')
url='https://git.kernel.org/pub/scm/utils/mdadm'
makedepends=('git')
depends=('glibc' 'systemd')
#depends+=('mkinitcpio>=0.7')
optdepends=('bash: mdcheck')
#optdepends+=('lvm2' 'dm-crypt' 'bcache')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
replaces=('raidtools')
backup=("etc/${_pkgname}.conf")
install="${_pkgname}.install"
#validpgpkeys=('6A86B80E1D22F21D0B26BA75397D82E0531A9C91') # Jes Sorensen
_verwatch=('https://mirrors.edge.kernel.org/pub/linux/utils/raid/mdadm/' 'mdadm-\(.*\)\.tar\.xz' 't')
_archlink="@@@::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/@@@?h=packages/${_pkgname}"
source=(
  # choose whichever repo is newest.
  #"mdadm_gitnb::git://neil.brown.name/${_pkgname}"
  #"mdadm_github::git+https://github.com/neilbrown/${_pkgname}.git"
  "mdadm_gitkr::git://git.kernel.org/pub/scm/utils/mdadm/mdadm.git"
  '0000-mdadm-no-build-on-install-test.patch'
  "${_archlink//@@@/${_pkgname}.conf}"
  #"${_archlink//@@@/${_pkgname}_hook}"
  #"${_archlink//@@@/${_pkgname}_install}"
  "${_archlink//@@@/${_pkgname}_udev_install}"
  "${_pkgname}_udev_hook"
)
md5sums=('SKIP'
         '074f72ac0367088920379c7e6b7e2a32'
         '5a37c112aa07dccdde62f9fa5b888607'
         'b6b0bfd6487c99264578630616dfe5eb'
         '910398cd21e16c1da33f2d7449497245')
sha256sums=('SKIP'
            '18f4ab16e9f4aed84d40456f6125fbb54447d0d0679d9b290355ff3acf8319a8'
            '4ce1e90690282f98e4828e11576fbd61be65e97a2cdae6c7eac7035ea5ee53e5'
            '170b0e5d548416c0adb9df4e6941bea6bc33d843419c997e45ecaf9e36a58f38'
            'd395184617f45849cbbaf5b4ee3665ca6895a1d642e0470e9de703ce944279ca')

pkgver() {
  set -u
  cd mdadm_git*/
  git describe --long | sed -e 's/^mdadm-//g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}

prepare() {
  set -u
  cd mdadm_git*/
  # NB and the mdadm team strive for warning free code. Disable the warning only when necessary.
  sed -e 's: -Werror : :g' -i 'Makefile' # disable-werror.patch
  sed -e 's:/usr/sbin/:/usr/bin:g' -e 's:/sbin:/usr/bin:g' -i $(grep -lrce '/sbin/' .)

  # make install test must not compile anything
  #f="${PWD##*/}"; cd ..; ln -sr "${f}" 'b'; cp -pr "${f}" a/; false
  #diff -pNaru5 'a' 'b' > '0000-mdadm-no-build-on-install-test.patch'
  patch -Nup1 -i "${srcdir}/0000-mdadm-no-build-on-install-test.patch"

  set +u
}

build() {
  set -u
  cd mdadm_git*/
  nice make -s CXFLAGS="${CFLAGS}" BINDIR='/usr/bin' UDEVDIR='/usr/lib/udev'
  set +u
}

check() {
  set -u
  cd mdadm_git*/
  #make -s -j1 CXFLAGS="${CFLAGS}" test
  # check must be run on a machine *NOT* running mdraid, think laptop!
  # Watch for gksu prompts.
  if ! :; then
    #sudo ./test
    echo "passed, but you can't deliver a PKGBUILD with sudo in it"
    set +u
    false
  fi
  set +u
}

package() {
  set -u
  cd mdadm_git*/
  make -s -j1 INSTALL='/usr/bin/install' BINDIR='/usr/bin' DESTDIR="${pkgdir}" UDEVDIR='/usr/lib/udev' install

  # systemd addon
  make -s -j1 SYSTEMD_DIR="${pkgdir}/usr/lib/systemd/system" install-systemd # does not honor silent -s
  sed -e 's:#!/bin/sh:#!/usr/bin/sh:g' -i "${pkgdir}/usr/lib/systemd/system-shutdown/mdadm.shutdown"

  # configuration
  install -Dpm644 "${srcdir}/mdadm.conf" -t "${pkgdir}/etc/"
  sed -e 's:/usr/sbin/:/usr/bin/:g' -i "${pkgdir}/etc/mdadm.conf"

  # hook mdadm_udev
  install -Dpm644 "${srcdir}/mdadm_udev_install" "${pkgdir}/usr/lib/initcpio/install/mdadm_udev"
  if ! grep -q 'add_runscript' "${pkgdir}/usr/lib/initcpio/install/mdadm_udev"; then
    sed -e 's:^\(\s\+\)add_binary:\1add_runscript\n&:g' -i "${pkgdir}/usr/lib/initcpio/install/mdadm_udev"
  fi
  sed -e 's:#!/bin/bash:#!/usr/bin/bash:g' -i "${pkgdir}/usr/lib/initcpio/install/mdadm_udev"
  bash -n "${pkgdir}/usr/lib/initcpio/install/mdadm_udev" || echo "${}"
  ln -s '/usr/lib/initcpio/install/mdadm_udev' "${pkgdir}/usr/lib/initcpio/install/mdadm"

  # Custom display hook
  install -Dpm644 "${srcdir}/mdadm_udev_hook" "${pkgdir}/usr/lib/initcpio/hooks/mdadm_udev"
  bash -n "${pkgdir}/usr/lib/initcpio/hooks/mdadm_udev" || echo "${}"
  #ln -sf 'mdadm' "${pkgdir}/usr/lib/initcpio/hooks/raid" # symlink for backward compatibility

  # Ensure all udev rules files are present in the initcpio install hooks
  shopt -s failglob
  local _lf=$'\n'
  local _missing=''
  pushd "${pkgdir}" > /dev/null
  local _mks=(usr/lib/initcpio/install/*)
  cd "${pkgdir}/usr/lib/udev/rules.d/"
  local _mk _mkd _ud _udp
  for _mk in "${_mks[@]}"; do
    for _ud in *.rules; do
      _udp="/usr/lib/udev/rules.d/${_ud}"
      if ! grep -qe "add_file.*${_udp}" "${pkgdir}/${_mk}"; then
        _missing+="${_lf}Missing ${_mk}: ${_udp}"
      fi
    done
  done
  popd > /dev/null
  if [ ! -z "${_missing}" ]; then
    echo "${_missing}"
    set +u
    # Disable for now.
    : false
  fi
  shopt -u failglob

  # Ensure files are clean
  ! grep -alqr "mdassemble" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: mdassemble"; false; }
  ! grep -alqr "/sbin" "${pkgdir}" || echo "${}"
  set +u
}
set +u

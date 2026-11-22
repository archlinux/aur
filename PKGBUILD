# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

# https://gitlab.archlinux.org/archlinux/packaging/packages/pcsclite/-/commits/main
# https://salsa.debian.org/rousseau/PCSC/blob/master/ChangeLog

set -u
pkgname=pcsclite
pkgver=2.5.4
pkgrel=1
pkgdesc="PC/SC Architecture smartcard middleware library"
pkgdesc+=" (32-bit)"
arch=('x86_64')
url='https://pcsclite.apdu.fr/'
# https://salsa.debian.org/rousseau/PCSC/-/blob/2.0.3/COPYING
license=(
  'BSD-3-Clause'        # Most of it
  'GPL-3.0-or-later'    # doc/example/pcsc_demo.c, src/spy/, UnitaryTests/
  'BSD-2-Clause'        # src/auth.c, src/auth.h
  '0BSD'                # src/simclist.c, src/simclist.h
)
depends=(
  'libsystemd.so'
  'libudev.so'
  'libpolkit-gobject-1.so'
  "${pkgname}>=${pkgver}"
)
makedepends=(
  'git'
  'meson'
  'lib32-polkit'
  'lib32-systemd'
)
provides=(
  'libpcsclite.so'
  'libpcsclite_real.so'
  'libpcscspy.so'
)
validpgpkeys=('F5E11B9FFE911146F41D953D78A1B4DFE8F9C57E') # Ludovic Rousseau <rousseau@debian.org>
source=(
  "git+https://github.com/LudovicRousseau/PCSC.git?signed#tag=${pkgver}"
  "program-suffix.patch"
  "systemd-unit-conflicts.diff"
  "0001-Allow-to-run-32-bit-pcscd-on-64-bit-systems.patch"
)
sha256sums=('ca20712dfd41f1384a2a933c34b00f69001ed2a7271e93398c5906fa557301ec'
            'f174b131908f6e8104e7a07654bba5a7b038f2cee97eed19389fbca85f922946'
            '30c1c2bdf57d8d27bd0b717d0804cbfba549d6507f74450a7924fc5b998a3067'
            '6623cfd64ce75c3c8a4274210a437f3d192908bd3b5505f5c529c2aebd581581')

pkgname="lib32-${pkgname}"

prepare() {
  local -; set -u
  cd PCSC

  local _patches=()
  _patches+=('program-suffix.patch')
  # Seems pcscd-32 needs exclusive access to devices
  _patches+=('systemd-unit-conflicts.diff')
  _patches+=('0001-Allow-to-run-32-bit-pcscd-on-64-bit-systems.patch')

  local _pt _ptf=() _pts=()
  for _pt in "${_patches[@]}"; do
    set +u; msg2 "Patch ${_pt}"; set -u
    if patch -Nup1 --no-backup-if-mismatch -i "${srcdir}/${_pt}"; then
      _pts+=("${_pt}")
    else
      _ptf+=("${_pt}")
    fi
  done
  if [ "${#_ptf[@]}" -gt 0 ]; then
     if [ "${#_pts[@]}" -gt 0 ]; then
       printf 'Patch success %s\n' "${_pts[@]}"
       printf 'Warning: Some old patches may need to be removed even if they are successful\n'
     fi
     printf 'Patch failed %s\n' "${_ptf[@]}"
     set +x
     false
  fi
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > "0000-$RANDOM.patch"
}

build() {
  local _meson_options=(
    --cross-file lib32
    -D program_suffix="-32"
    -D libsystemd=true
    -D libudev=true
    -D polkit=true
    -D serial=true
    -D systemdunit=system
    -D usbdropdir=/usr/lib32/pcsc/drivers
  )
  arch-meson PCSC build "${_meson_options[@]}"
  meson compile -C build

  # namcap requires separate files for each "uncommon" license (ex: BSD* ones), so splitting the upstream COPYING file
  awk '/David Corcoran/{flag=1} /GNU GPL v3/ {flag=0} flag' PCSC/COPYING > LICENSE.BSD-3-Clause
  awk '/GNU GPL v3/    {flag=1} /auth.c/     {flag=0} flag' PCSC/COPYING > LICENSE.GPL-3.0-or-later
  awk '/auth.c/        {flag=1} /simclist.c/ {flag=0} flag' PCSC/COPYING > LICENSE.BSD-2-Clause
  awk '/simclist.c/    {flag=1} flag'                       PCSC/COPYING > LICENSE.0BSD
}

package() {
  meson install -C build --destdir "${pkgdir}"

  # Remove files shared with pcsclite
  rm -rv "$pkgdir"/{etc,usr/{include,lib/sysusers.d,share}}
  # pcsc-spy is just a Python script, and thus the one from 64-bit pcsclite works with this package
  rm -v "$pkgdir"/usr/bin/pcsc-spy
  # Keep pcscd-32 as it's useful for using with 32-bit only drivers

  install -D -m0644 LICENSE.* -t "${pkgdir}"/usr/share/licenses/$pkgname
  install -d "${pkgdir}"/usr/lib32/pcsc/drivers
}
set +u

# vim:set sw=2 sts=-1 et:

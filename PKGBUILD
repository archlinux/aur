# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

_pkgname=pcsclite
pkgname=lib32-$_pkgname
# https://gitlab.archlinux.org/archlinux/packaging/packages/pcsclite/-/commits/main
# https://salsa.debian.org/rousseau/PCSC/blob/master/ChangeLog
pkgver=2.3.1
pkgrel=1
pkgdesc="PC/SC Architecture smartcard middleware library (32-bit)"
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
  $_pkgname
)
makedepends=(
  'git'
  'meson'
  'lib32-systemd'
  'lib32-polkit'
)
provides=(
  'libpcsclite.so'
  'libpcsclite_real.so'
  'libpcscspy.so'
)
validpgpkeys=('F5E11B9FFE911146F41D953D78A1B4DFE8F9C57E') # Ludovic Rousseau <rousseau@debian.org>
source=(
  "git+https://github.com/LudovicRousseau/PCSC.git#tag=${pkgver}?signed"
  "program-suffix.patch"
  "systemd-unit-conflicts.diff"
)
sha256sums=('6c2af5bcd2da0418d712dadd091d386ef01acdc14f112f327f9498f09d89eca1'
            '0ce813943722e17b7c830bc914a33dbf377cbde691a4aac386b0062e85b5f8b3'
            '2e6a50707a62f6b476e392ae4157565c45725d00ee86c29cf248adad71e01fe7')

prepare() {
  cd PCSC
  patch -Np1 -i ../program-suffix.patch
  # Seems pcscd-32 needs exclusive access to devices
  patch -Np1 -i ../systemd-unit-conflicts.diff
}

build() {
  local meson_options=(
    --cross-file lib32
    -D program_suffix="-32"
    -D libudev=true
    -D polkit=true
    -D serial=true
    -D systemdunit=system
    -D usbdropdir=/usr/lib32/pcsc/drivers
  )
  arch-meson PCSC build "${meson_options[@]}"
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
  rm -rv "$pkgdir"/{etc,usr/{include,share}}
  # pcsc-spy is just a Python script, and thus the one from 64-bit pcsclite works with this package
  rm -v "$pkgdir"/usr/bin/pcsc-spy
  # Keep pcscd-32 as it's useful for using with 32-bit only drivers

  install -D -m0644 LICENSE.* -t "$pkgdir/usr/share/licenses/$pkgname"
  install -d "$pkgdir/usr/lib32/pcsc/drivers"
}

# vim:set sw=2 sts=-1 et:

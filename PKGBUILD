# Maintainer: Adam Hirst <adam@aphirst.karoo.co.uk>
# Maintainer: Zuyi Hu <hzy0668808@gmail.com>
# Maintainer: mrfaber <mrfaber@example.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: mortzu <me@mortzu.de>
# Contributor: fnord0 <fnord0@riseup.net>


pkgbase=acpi_call-ck
pkgname=(acpi_call-ck)
# replace -ck with your appropriate optimized ck version
         # acpi_call-ck-generic
         # acpi_call-ck-atom
         # acpi_call-ck-silvermont
         # acpi_call-ck-core2
         # acpi_call-ck-nehalem
         # acpi_call-ck-sandybridge
         # acpi_call-ck-ivybridge
         # acpi_call-ck-haswell
         # acpi_call-ck-broadwell
         # acpi_call-ck-skylake
         # acpi_call-ck-p4
         # acpi_call-ck-pentm
         # acpi_call-ck-kx
         # acpi_call-ck-k10
         # acpi_call-ck-bobcat
         # acpi_call-ck-bulldozer
         # acpi_call-ck-piledriver
         # acpi_call-ck-zen
pkgver=1.1.0
pkgrel=11
pkgdesc='A linux-ck kernel module that enables calls to ACPI methods through /proc/acpi/call'
url='https://github.com/mkottman/acpi_call'
arch=('x86_64')
license=('GPL')
depends=("linux-${pkgname#acpi_call-}>=4.18" "linux-${pkgname#acpi_call-}<4.19")
makedepends=("linux-${pkgname#acpi_call-}-headers>=4.18"
             "linux-${pkgname#acpi_call-}-headers<4.19")
provides=('acpi_call')
_extramodules=extramodules-${pkgname#acpi_call-}
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mkottman/acpi_call/archive/v${pkgver}.tar.gz")
sha256sums=('d0d14b42944282724fca76f57d598eed794ef97448f387d1c489d85ad813f2f0')

prepare() {
  cd ${pkgname%%-*}-${pkgver}

  # Fix build with Linux >= 3.17
  sed -i 's|acpi/acpi.h|linux/acpi.h|' acpi_call.c

  # Fix build with Linux >= 4.12
  sed -i 's|asm/uaccess.h|linux/uaccess.h|' acpi_call.c
}

build() {
  cd ${pkgname%%-*}-${pkgver}
  make KVERSION="$(cat /usr/lib/modules/$_extramodules/version)"
}

package() {
  cd ${pkgname%%-*}-${pkgver}
  install -Dt "$pkgdir/usr/lib/modules/$_extramodules" -m644 *.ko
  find "$pkgdir" -name '*.ko' -exec xz {} +

  echo ${pkgname%%-*} | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/${pkgname}.conf"

  mkdir -p "$pkgdir/usr/share/${pkgname}"
  cp -t "$pkgdir/usr/share/${pkgname}" -dr --no-preserve=ownership examples support
}


# vim:set ts=2 sw=2 et:

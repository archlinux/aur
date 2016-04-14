# Maintainer: Thore Bödecker <me@foxxx0.de>
# 
# based on the acpi_call PKGBUILD (repo)
#
# Thanks to:
# Maxime Gauduin <alucryd@archlinux.org>
# mortzu <me@mortzu.de>
# fnord0 <fnord0@riseup.net>

pkgname=acpi_call-grsec
_pkgname="${pkgname/-grsec}"
pkgver=1.1.0
pkgrel=1
_extramodules=extramodules-4.4.6-grsec
pkgdesc='A linux-grsec kernel module that enables calls to ACPI methods through /proc/acpi/call'
arch=('i686' 'x86_64')
url='http://github.com/mkottman/acpi_call'
license=('GPL')
depends=('linux-grsec>=4.4.6' 'linux-grsec<4.5')
makedepends=('linux-grsec-headers>=4.4.6' 'linux-grsec-headers<4.5')
install='acpi_call-grsec.install'
source=("${_pkgname}-$pkgver.tar.gz::http://github.com/mkottman/acpi_call/archive/v${pkgver}.tar.gz")
sha256sums=('d0d14b42944282724fca76f57d598eed794ef97448f387d1c489d85ad813f2f0')

prepare() {
  cd acpi_call-${pkgver}

  # Fix build with Linux >= 3.17
  sed -i 's|acpi/acpi.h|linux/acpi.h|' acpi_call.c

  # notify user about gcc restrictions with grsec
  echo -en "\n\n--------------------------------------------------------\n"
  echo -en "|                   ! ATTENTION !                      |\n"
  echo -en "|                                                      |\n"
  echo -en "| Please note that building this module will only      |\n"
  echo -en "| succeed using the same gcc version used to build     |\n"
  echo -en "| linux-grsec!                                         |\n"
  echo -en "|                                                      |\n"
  echo -en "| See link below for detailed information.             |\n"
  echo -en "|                                                      |\n"
  echo -en "--------------------------------------------------------\n\n\n"
  echo -en "https://wiki.archlinux.org/index.php/Grsecurity#Out-of-tree_kernel_module_compilation_failure\n\n\n"
}

build() {
  cd acpi_call-${pkgver}

  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

  make KVERSION="${_kernver}"
}

package() {
  cd acpi_call-${pkgver}

  install -dm 755 "${pkgdir}"/usr/lib/{modules/${_extramodules},modules-load.d}
  install -m 644 acpi_call.ko "${pkgdir}"/usr/lib/modules/${_extramodules}
  gzip "${pkgdir}"/usr/lib/modules/${_extramodules}/acpi_call.ko
  echo acpi_call > "${pkgdir}"/usr/lib/modules-load.d/acpi_call.conf

  install -dm 755 "${pkgdir}"/usr/share/acpi_call
  cp -dr --no-preserve='ownership' {examples,support} "${pkgdir}"/usr/share/acpi_call/
}

# vim: ts=2 sw=2 et:

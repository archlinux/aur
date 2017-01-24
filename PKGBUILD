# $Id$
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: mortzu <me@mortzu.de>
# Contributor: fnord0 <fnord0@riseup.net>

pkgname=acpi_call-ck-fbcondecor
pkgver=1.1.0
pkgrel=11
_extramodules=extramodules-$(uname -r |cut -c1,2,3)-ck-fbcondecor
pkgdesc='A linux kernel module that enables calls to ACPI methods through /proc/acpi/call'
arch=('i686' 'x86_64')
url='https://github.com/mkottman/acpi_call'
license=('GPL')
depends=('linux-ck-fbcondecor')
makedepends=('linux-ck-fbcondecor-headers')
install='acpi_call-ck-fbcondecor.install'
source=("acpi_call-${pkgver}.tar.gz::https://github.com/mkottman/acpi_call/archive/v${pkgver}.tar.gz")
sha256sums=('d0d14b42944282724fca76f57d598eed794ef97448f387d1c489d85ad813f2f0')

prepare() {
  cd ${pkgname%-*-*}-${pkgver}

  # Fix build with Linux >= 3.17
  sed -i 's|acpi/acpi.h|linux/acpi.h|' acpi_call.c
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

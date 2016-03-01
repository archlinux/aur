# Maintainer: Lev Lybin <aur@devtrue.net>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: mortzu <me@mortzu.de>
# Contributor: fnord0 <fnord0@riseup.net>

pkgname=acpi_call-mainline
pkgver=1.1.0
pkgrel=39
_extramodules=extramodules-4.5-mainline
pkgdesc='A linux kernel module that enables calls to ACPI methods through /proc/acpi/call'
arch=('i686' 'x86_64')
url='http://github.com/mkottman/acpi_call'
license=('GPL')
depends=('linux-mainline>=4.5rc1' 'linux-mainline<4.6rc1')
makedepends=('linux-mainline-headers>=4.5rc1' 'linux-mainline-headers<4.6rc1')
install='acpi_call-mainline.install'
source=("$pkgname-$pkgver.tar.gz::http://github.com/mkottman/acpi_call/archive/v${pkgver}.tar.gz")
sha256sums=('d0d14b42944282724fca76f57d598eed794ef97448f387d1c489d85ad813f2f0')

prepare() {
  cd acpi_call-${pkgver}

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
  echo acpi_call > "${pkgdir}"/usr/lib/modules-load.d/${pkgname}.conf

  install -dm 755 "${pkgdir}"/usr/share/${pkgname}
  cp -dr --no-preserve='ownership' {examples,support} "${pkgdir}"/usr/share/${pkgname}/
}

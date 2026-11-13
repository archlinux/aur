# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgbase=pappl-retrofit
pkgname=($pkgbase 'legacy-printer-app')
pkgver=1.0b3
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/OpenPrinting/pappl-retrofit"
license=('Apache-2.0')
makedepends=('git' 'libcups' 'libcupsfilters' 'libppd' 'pappl')
source=("${url}/releases/download/${pkgver}/${pkgbase}-${pkgver}.tar.gz")
b2sums=('59cb24c305e3d60bf060b077d40db293e484e7c6f4d9c90deea53ab44797f27722880e95c32afc7a29f06b28c80bf16dd6179cdfc7c2a8a7b18aee85b2b4216d')

prepare() {
  cd ${pkgbase}-${pkgver}
  ./autogen.sh
  ./configure --enable-year2038 --prefix=/usr --sbindir=/usr/bin --localstatedir=/var --enable-legacy-printer-app-as-daemon
}

build() {
  cd ${pkgbase}-${pkgver}
  make
}

check() {
  cd ${pkgbase}-${pkgver}
  make check
}

package_pappl-retrofit() {
  pkgdesc="PPD/Classic CUPS driver retro-fit Printer Application Library"
  depends=('libcups' 'libcupsfilters' 'libppd' 'pappl')

  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -R "${pkgdir}"/{usr/{bin,lib/{legacy-printer-app,systemd},share/{legacy-printer-app,man}},var}
}

package_legacy-printer-app() {
  pkgdesc="Printer Application providing access to legacy printer drivers"
  depends=('pappl-retrofit')
  optdepends=('avahi: announce printers handled by the Printer Application')

  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -R "${pkgdir}"/usr/{include,lib/{pkgconfig,libpappl*},share/{doc,man/man1}}
}

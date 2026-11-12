# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgbase=pappl-retrofit
pkgname=($pkgbase 'legacy-printer-app')
pkgver=1.0b2
pkgrel=1
arch=('x86_64')
url="https://github.com/OpenPrinting/pappl-retrofit"
license=('Apache-2.0')
makedepends=('git' 'libcups' 'libcupsfilters' 'libppd' 'pappl')
# the latest release doesn't build against recent CUPS anymore, so pick a commit close to it for the time being
_commit=eebb36724a6296d1e6491440f954e8fd8b816839
source=("${pkgname}-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz")
#source=("${url}/releases/download/${pkgver}/${pkgbase}-${pkgver}.tar.xz")
b2sums=('5095b908b13988b04a46cb0bca696051018982d9400cde186dc5cb28bf99cdcb04b6f3c910af3225c2b3cc5cb249af6a163a618aaab2cbd7b416b770359fa30e')

prepare() {
  mv ${pkgbase}-{${_commit},${pkgver}}
  cd ${pkgbase}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin --localstatedir=/var --enable-legacy-printer-app-as-daemon
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

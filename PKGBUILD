# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgbase=pappl-retrofit
pkgbase=$_pkgbase-git
pkgname=("$pkgbase" 'legacy-printer-app-git')
pkgver=1.0b2.r10.gb959712
pkgrel=1
arch=('x86_64')
url="https://github.com/OpenPrinting/pappl-retrofit"
license=('Apache-2.0')
makedepends=('git' 'libcups' 'libcupsfilters' 'libppd' 'pappl')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgbase
  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin --localstatedir=/var --enable-legacy-printer-app-as-daemon
}

build() {
  cd $_pkgbase
  make
}

check() {
  cd $_pkgbase
  make check
}

package_pappl-retrofit-git() {
  pkgdesc="PPD/Classic CUPS driver retro-fit Printer Application Library"
  depends=('libcups' 'libcupsfilters' 'libppd' 'pappl')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd $_pkgbase
  make DESTDIR="$pkgdir/" install
  rm -R "${pkgdir}"/{usr/{bin,lib/legacy-printer-app,share/{legacy-printer-app,man}},var}
  # systemd's service unit ends up in '/' if compiled in a clean chroot
  rm -Rf "${pkgdir}"/{usr/lib/systemd,legacy-printer-app.service}
}

package_legacy-printer-app-git() {
  pkgdesc="Printer Application providing access to legacy printer drivers"
  depends=('pappl-retrofit-git')
  optdepends=('avahi: announce printers handled by the Printer Application')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd $_pkgbase
  make DESTDIR="$pkgdir/" install
  rm -R "${pkgdir}"/usr/{include,lib/{pkgconfig,libpappl*},share/{doc,man/man1}}
  # see package_pappl-retrofit-git()
  if [ -f "${pkgdir}"/legacy-printer-app.service ] ; then
      install -d "${pkgdir}"/usr/lib/systemd/system
      mv "${pkgdir}"/legacy-printer-app.service "${pkgdir}"/usr/lib/systemd/system
  fi
}

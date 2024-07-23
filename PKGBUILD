# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgbase=pappl-retrofit
pkgname=("$pkgbase" 'legacy-printer-app')
pkgver=1.0b2
pkgrel=1
arch=('x86_64')
url="https://github.com/OpenPrinting/pappl-retrofit"
license=('Apache-2.0')
makedepends=('git' 'libcups' 'libcupsfilters' 'libppd' 'pappl')
# the latest release doesn't build against recent CUPS anymore, so pick a commit close to it for the time being
#source=("${url}/releases/download/$pkgver/$pkgbase-$pkgver.tar.xz")
_commit=eebb36724a6296d1e6491440f954e8fd8b816839
source=("${url}/archive/$_commit.tar.gz")
sha256sums=('8d2bc98a711359ca2f1d1d30e5dd8bef9afd8613ca13abb6048c2181e2fd6910')

prepare() {
  mv $pkgbase-{$_commit,$pkgver}
  cd $pkgbase-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin --localstatedir=/var --enable-legacy-printer-app-as-daemon
}

build() {
  cd $pkgbase-$pkgver
  make
}

check() {
  cd $pkgbase-$pkgver
  make check
}

package_pappl-retrofit() {
  pkgdesc="PPD/Classic CUPS driver retro-fit Printer Application Library"
  depends=('libcups' 'libcupsfilters' 'libppd' 'pappl')

  cd $pkgbase-$pkgver
  make DESTDIR="$pkgdir/" install
  rm -R "${pkgdir}"/{usr/{bin,lib/legacy-printer-app,share/{legacy-printer-app,man}},var}
  # systemd's service unit ends up in '/' if compiled in a clean chroot
  rm -Rf "${pkgdir}"/{usr/lib/systemd,legacy-printer-app.service}
}

package_legacy-printer-app() {
  pkgdesc="Printer Application providing access to legacy printer drivers"
  depends=('pappl-retrofit')
  optdepends=('avahi: announce printers handled by the Printer Application')

  cd $pkgbase-$pkgver
  make DESTDIR="$pkgdir/" install
  rm -R "${pkgdir}"/usr/{include,lib/{pkgconfig,libpappl*},share/{doc,man/man1}}
  # see package_pappl-retrofit-git()
  if [ -f "${pkgdir}"/legacy-printer-app.service ] ; then
      install -d "${pkgdir}"/usr/lib/systemd/system
      mv "${pkgdir}"/legacy-printer-app.service "${pkgdir}"/usr/lib/systemd/system
  fi
}

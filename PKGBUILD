# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=liblcf-git
pkgver=0.1.2.r107.gd31af5c
pkgrel=1
pkgdesc="Library to handle RPG Maker 2000/2003 and EasyRPG projects (development version)"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('MIT')
conflicts=('liblcf')
provides=('liblcf')
makedepends=('boost' 'git' 'expat')
source=(liblcf::"git+https://github.com/EasyRPG/liblcf.git")
md5sums=('SKIP')
options=(staticlibs)

pkgver() {
  cd liblcf
  git describe --long | sed 's/-/.r/;s/-/./'
}

build () {
  cd liblcf

  autoreconf -i
  ./configure --prefix=/usr
  make
}

check() {
  cd liblcf

  # disable as-needed (problems with library order)
  make check LDFLAGS="$LDFLAGS -Wl,--no-as-needed"
}

package () {
  cd liblcf

  make DESTDIR="$pkgdir/" install
  # move files to right location, if needed (temporary fix)
  install -d "$pkgdir"/usr/include/liblcf
  mv "$pkgdir"/usr/include/*.h "$pkgdir"/usr/include/liblcf
  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

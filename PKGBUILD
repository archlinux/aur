# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=liblcf-git
pkgver=0.4.1.r7.g8031cb7
pkgrel=1
pkgdesc="Library to handle RPG Maker 2000/2003 and EasyRPG projects (development version)"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('MIT')
conflicts=('liblcf')
provides=("liblcf=${pkgver%.r*}")
depends=('gcc-libs' 'expat' 'icu')
makedepends=('git')
source=(liblcf::"git+https://github.com/EasyRPG/liblcf.git")
md5sums=('SKIP')

prepare() {
  # fix an error
  sed -i 's|^time_stamp_CXXFLAGS =|& -std=c++11|' liblcf/Makefile.{in,am}
}

pkgver() {
  cd liblcf
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build () {
  cd liblcf

  autoreconf -i
  ./configure --prefix=/usr --enable-shared --disable-static
  make
}

check() {
  make -C liblcf check
}

package () {
  cd liblcf

  make DESTDIR="$pkgdir/" install
  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

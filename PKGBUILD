# Maintainer: Jose Riha < jose 1711 gmail com >

pkgname=gpmd85emulator
pkgver=0.11.1912_beta
pkgrel=2
pkgdesc="Multiplatform GNU/GPL Tesla PMD 85 Emulator"
arch=('x86_64')
url="https://github.com/mborik/GPMD85Emulator"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'sdl2')
makedepends=('gendesk')
conflicts=('gpmd85emulator-git')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/mborik/GPMD85Emulator/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('deae6a6967981960fb188e201c089e3caff0aafc09423087b592dae6e2457c24')

prepare() {
  cd "$srcdir"
  gendesk -f -n --pkgname "GPMD85Emulator" \
             --exec "GPMD85emu" \
             --pkgdesc "$pkgdesc" \
             --categories 'Game;System;Emulator'

  cd "GPMD85Emulator-$pkgver"
  # respect system CFLAGS/CXXFLAGS/LDFLAGS and don't strip the binary
  sed -i -e 's/^\tCXXFLAGS="-Os -Wall"/\tCXXFLAGS="$CXXFLAGS -Wall"/' \
         -e 's/^\tCFLAGS="-Os -Wall"/\tCFLAGS="$CFLAGS -Wall"/' \
         -e 's/^\t\tLDFLAGS="-s"/\t\t:/' configure.ac
  autoreconf -fi
}

build() {
  cd "$srcdir/GPMD85Emulator-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/GPMD85Emulator-$pkgver"
  mkdir -p "$pkgdir/usr/share/gpmd85emu"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/GPMD85Emulator.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# Maintainer: Vincent B. <vb at luminar dot eu dot org>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Peter Baldwin <bald_pete@hotmail.com>
# Contributor: Matěj Týč <matej.tyc@gmail.com>

pkgname=pnm2ppa
pkgver=1.13
pkgrel=2
pkgdesc="Ghostscript print filter for owners of HP DeskJet 710C, 712C, 720C, 722C, 820Cse, 820Cxi, 1000Cse, or 1000Cxi printers."
arch=('armv6' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="http://pnm2ppa.sourceforge.net/"
license=('GPL')
depends=(ghostscript cups glibc cups-filters)
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        HP-DeskJet_710C-pnm2ppa.ppd
        HP-DeskJet_712C-pnm2ppa.ppd
        HP-DeskJet_720C-pnm2ppa.ppd
        HP-DeskJet_722C-pnm2ppa.ppd
        HP-DeskJet_820C-pnm2ppa.ppd
        HP-DeskJet_1000C-pnm2ppa.ppd
        missing-static.patch)
sha256sums=('1c50ea2c97b232f5bee6ac3fab408d64b6f1380f1e289ac278778a7e368e7379'
            'c84a1764967267be639344834376fffa84943f2aa17c13cd988c9a29f1c012f7'
            '2af636a6650492e2ffc183d345b89870d2f20609a5bc72ae6438e325c368b752'
            'b6f28b053040a60c36be7f67f730275a238dc56f9d8348074d3d2d9d523361dc'
            'ce264686783ab6d1431c6cd03286e59382288b7a910ab18ee2242baa876a6435'
            'bd96f78c9827d77c164af5d5fb5f049f6dbf63e6d6b178022f2424cb2571eb23'
            '68cdaad4d2a70bcc948c72d93514f158487b06b8866084f551f54202940236f6'
            'cbce5bea61890b5a293f7c55181ab1e25b0b504597445be5870a6b0add1198ab')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --enable-syslog --disable-debug --enable-vlink --with-language=EN
  patch < ../../missing-static.patch
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  mkdir -p $pkgdir/usr/share/cups/model/
  cd "$startdir"
  cp HP-DeskJet_{1000C,710C,712C,720C,722C,820C}-pnm2ppa.ppd $pkgdir/usr/share/cups/model/
}

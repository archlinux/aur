# Maintainer: Edmund Lodewijks <edmund@proteamail.com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Stefan Clarke <fm0nk3y@yahoo.co.uk>

# This is the gtk3 build, separated from the gnubg package so that
# we don't need to install gtk2 dependencies to build the gtk3 version.

pkgname=gnubg-gtk3
pkgver=1.08.003
pkgrel=2
pkgdesc="GNU Backgammon (GTK3 GUI)"
arch=('x86_64')
url="https://gnu.org"
license=('GPL-3.0-or-later')
depends=('glibc' 'glib2' 'gtk3' 'libcanberra' 'python' 'curl' 'sqlite' 'gmp' 'readline')
makedepends=('gtk3' 'libcanberra' 'python' 'curl' 'glib2' 'sqlite' 'gmp' 'readline')
conflicts=('gnubg')
provides=('gnubg')
source=(https://ftp.gnu.org/gnu/gnubg/gnubg-release-${pkgver}-sources.tar.gz{,.sig}
        "gnubg.desktop"
        "gnubg-wrapper"
        )
validpgpkeys=('39FC530C20B9B8C627E71BAC973B63D4ECB3B8BD')
b2sums=('6cb9ddcfbc71dbb4461daebb191046f02986a116e45acf09f219598fea6b066c38080c3a2b051de424eadcbe3a6c8a6e30794381d9edfb03dcc36102ed641e05'
        'SKIP'
        '1ac02096bee6ad37e27611b903aac9fe0181821b16cd3153f846f91b6a6c554dbce3425a03550f079c5a3aae9b92c75046bcb551ce018bb162088b6c0f2505bd'
        'd6966b1442cfe64e0da9a1be00997692a92f29cd70788cda7f7793a2e174c6b10545720596d32cf71a46dbd6204034290d372429409b9e886e65edc4d2ccf340')

prepare() {
  cd "gnubg-$pkgver"
  sed -i 's/-f/-fn/' doc/Makefile.in doc/Makefile.am
  ./autogen.sh
}

build() {
  cd "gnubg-$pkgver"
  ./configure \
          --prefix=/usr \
          --bindir=/usr/bin \
          --sysconfdir=/etc \
          --mandir=/usr/share/man \
          --with-gtk3 \
          --without-board3d
  make
}

package() {
  cd "gnubg-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/gnubg.desktop \
    "$pkgdir"/usr/share/applications/gnubg.desktop

  install -Dm755 "$srcdir"/gnubg-wrapper \
    "$pkgdir"/usr/bin/gnubg-wrapper
}


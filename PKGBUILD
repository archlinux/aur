# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Stefan Clarke <fm0nk3y@yahoo.co.uk>

pkgname=gnubg
pkgver=1.08.002
pkgrel=1
pkgdesc="World class backgammon application"
arch=('x86_64')
url="https://www.gnu.org/software/gnubg/"
license=('GPL3')
depends=('python' 'gtkglext' 'curl')
source=(https://ftp.gnu.org/gnu/gnubg/gnubg-release-$pkgver-sources.tar.gz
        $pkgname.desktop)
sha256sums=('3ed7e5290d71698dd535c47df602f48db8c9f9cadd7f5be935d5596765e2bc4f'
            'e9b40a2ce5e0b4f3c517913189abc138fe3377d86ca0baafa2b220c962caf7f1')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/-f/-fn/' doc/Makefile.in doc/Makefile.am
}

build() {
  cd $pkgname-$pkgver

  ./autogen.sh

  PYTHONWARNINGS=ignore ./configure --prefix=/usr --bindir=/usr/bin --sysconfdir=/etc \
    --mandir=/usr/share/man --enable-simd=sse2

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/$pkgname.desktop \
    "$pkgdir"/usr/share/applications/$pkgname.desktop
}

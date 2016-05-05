# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Stefan Clarke <fm0nk3y@yahoo.co.uk>

pkgname=gnubg
pkgver=1.05.000
pkgrel=2
pkgdesc="World class backgammon application"
arch=('i686' 'x86_64')
url="http://www.gnubg.org"
license=('GPL3')
depends=('python2' 'gtkglext' 'curl')
source=($url/media/sources/$pkgname-release-$pkgver-sources.tar.gz
        glib-gettext.patch
        $pkgname.desktop)
md5sums=('2c2d291deedcb72d1fcbbd8faf90d55c'
         'bad5a86bebc1c16aad4cfbdf9444f8a0'
         '965f5c7c25f60b27d06cc6fef7befd30')

prepare() {
  cd $pkgname-$pkgver

  patch -Np0 -i "$srcdir"/glib-gettext.patch
}

build() {
  cd $pkgname-$pkgver

  ./autogen.sh

  CPPFLAGS="$CPPFLAGS -D_FORTIFY_SOURCE=0" \
  ./configure --prefix=/usr --bindir=/usr/bin --sysconfdir=/etc \
    --mandir=/usr/share/man --enable-simd=sse2

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/$pkgname.desktop \
    "$pkgdir"/usr/share/applications/$pkgname.desktop
}

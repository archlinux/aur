# Contributor: bender02 at gmx dot com
pkgname=ninit
pkgver=0.14
pkgrel=4
pkgdesc="A small replacement of init"
arch=('i686' 'x86_64')
url="http://riemann.fmi.uni-sofia.bg/ninit/"
license=('GPL2')
depends=()
#makedepends=('dietlibc')
install=ninit.install
source=(http://riemann.fmi.uni-sofia.bg/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('3c70d673d2107afcabe97805b2aed407')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # preparations
  export PATH=$PATH:/opt/diet/bin
  _CARCH=$CARCH
  [ "$CARCH" = "i686" ] && _CARCH=i386
  make clean

  # build: - statically against dietlibc -> 'make withdiet'
  #        - dynamically against glibc -> 'make'
  #        - statically, better than dietlibc -> 'make $CARCH'
  make $_CARCH

  # this is needed if *not* building against dietlibc:
  [ -d bin-$_CARCH ] && cp bin-$_CARCH/* .
}

package() {
  cd $srcdir/$pkgname-$pkgver
  # fix a problem with make install
  install -d $pkgdir/usr/share/man

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install_other

  #don't clutter /etc/ninit with the suggested bin folder containing utilities
  #instead, place them in /opt/ninit so /etc/ninit can be dedicated to services

  msg "Moving /etc/ninit/bin to /usr/lib/ninit/bin to reduce clutter"
  mkdir -p "${pkgdir}/usr/lib/ninit/"
  mv "${pkgdir}/etc/ninit/bin"  "${pkgdir}/usr/lib/ninit/bin"

  msg "Moving /etc/ninit/sys to /usr/lib/ninit/sys to reduce clutter"
  mv "${pkgdir}/etc/ninit/sys" "${pkgdir}/usr/lib/ninit/sys"
}

# vim:set ts=2 sw=2 et:

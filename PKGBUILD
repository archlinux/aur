# $Id: PKGBUILD 114519 2014-07-01 18:51:48Z seblu $
# Maintainer: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Malte Rabenseifer <malte@zearan.de>
# Contributor: urist <9362773@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Troy Phillips <9362773@gmail.com>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=rxvt
pkgver=2.7.10
pkgrel=9
pkgdesc='A colour vt102 terminal emulator'
arch=('i686' 'x86_64')
url='http://rxvt.sourceforge.net/'
license=('GPL')
depends=('glibc' 'libx11' 'libxau' 'libxcb' 'libxdmcp')
makedepends=('libxt')
source=(
  "http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
   rxvt-2.7.10-no-i-push.patch
)
md5sums=('302c5c455e64047b02d1ef19ff749141'
         '8200902ba1ca359da15bee1baa2c3c86')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "${srcdir}/rxvt-2.7.10-no-i-push.patch"
}

build() {
  cd $pkgname-$pkgver
  CFLAGS="" ./configure --prefix=/usr \
    --with-terminfo=/usr/share/terminfo \
    --enable-mousewheel \
    --enable-256-color \
    --enable-linespace \
    --enable-smart-resize \
    --enable-transparency \
    --enable-utmp \
    --enable-wtmp \
    --enable-lastlog
    # --enable-xim (no Xlocale)
    # --enable-slipwheeling (crash)

  # set location of utmp and wtmp manually, configure doesn't detect them
  sed -i 's|.*RXVT_UTMP_FILE.*|#define RXVT_UTMP_FILE "/var/run/utmp"|' config.h
  sed -i 's|.*RXVT_WTMP_FILE.*|#define RXVT_WTMP_FILE "/var/log/wtmp"|' config.h

  # configure thinks we have openpty, this is wrong
  sed -i 's|.*PTYS_ARE_PTMX.*|#define PTYS_ARE_PTMX 1|' config.h
  sed -i 's|.*HAVE_OPENPTY.*|/* #undef HAVE_OPENPTY */|' config.h
  sed -i 's|.*PTYS_ARE_OPENPTY.*|/* #undef PTYS_ARE_OPENPTY */|' config.h

  make
}

package() {
  cd $pkgname-$pkgver
  make prefix="$pkgdir/usr" mandir="$pkgdir/usr/share/man/man1" install
  rm "$pkgdir/usr/bin/$pkgname-$pkgver"
  rmdir "$pkgdir/usr/include" "$pkgdir/usr/lib"
}

# vim:set ts=2 sw=2 et:

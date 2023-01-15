# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>
pkgname=xlockmore-blank
_pkgname=xlockmore
pkgver=5.71
pkgrel=1
pkgdesc="screen saver / locker for the X Window System - blank only"
arch=(x86_64 i686)
license=('BSD')
depends=(freetype2 gtk2 libxpm pam libxmu glu)
optdepends=('fortune-mod')
makedepends=(mesa)
url="http://sillycycle.com/xlockmore.html"
options=('!makeflags')
install=xlockmore.install
validpgpkeys=('1B79C8478F236DCDADC0D6ACCF159707377919AE')
DLAGENTS=('http::/usr/bin/curl --user-agent Firefox -fLC - --retry 3 --retry-delay 3 -o %o %u')
source=(http://sillycycle.com/xlock/xlockmore-$pkgver.tar.xz{,.asc}
	LICENSE)
sha256sums=('0118b2d4b28303c335426cd6ca844b4776e4b71adb1d344f2ec087b57616c21a'
            'SKIP'
            'f9f41a5590c5c3ee9780f6013d9f03c229674e8d72e086b22f07c399be0f5b39')
provides=("$_pkgname=$pkgver-$pkgrel")
conflicts=("$_pkgname" "${_pkgname}-nomotif")

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  ./configure --prefix=/usr --disable-setuid \
	      --enable-appdefaultdir=/usr/share/X11/app-defaults \
	      --enable-pam --with-gtk2 --without-esound --without-ftgl \
	      --without-motif --without-magick --without-rplay \
	      --without-gtk --without-gtk2 --enable-blank-only
  make
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver

  make xapploaddir="$pkgdir"/usr/share/X11/app-defaults \
       mandir="$pkgdir"/usr/man/man1 \
       prefix="$pkgdir"/usr install
  install -Dm0644 etc/xlock.pamd "${pkgdir}"/etc/pam.d/xlock
  install -Dm0644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  mv "$pkgdir"/usr/man "$pkgdir"/usr/share/
}

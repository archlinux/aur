# Maintainer: Maxime Tréca <maxime.treca@gmail.com>

_pkgname=rxvt-unicode
pkgname=rxvt-unicode-minimal
pkgver=9.22
pkgrel=11
pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt) witout resize hints and perl support'
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
depends=('libxft' 'perl' 'startup-notification' 'rxvt-unicode-terminfo')
provides=(rxvt-unicode)
conflicts=(rxvt-unicode)
source=(http://dist.schmorp.de/rxvt-unicode/$_pkgname-$pkgver.tar.bz2
        'noinc.diff'
        )
sha1sums=('e575b869782fbfed955f84f48b204ec888d91ba1'
          'e9fbc2c35c4de3f04d9c9843d133f6efbce50565')

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 -i ../noinc.diff
}

build() {
  cd $_pkgname-$pkgver

  # do not specify --with-terminfo (FS#46424)
  ./configure \
    --prefix=/usr \
    --enable-256-color \
    --enable-combining \
    --enable-iso14755 \
    --enable-lastlog \
    --disable-perl \
    --disable-rxvt-scroll \
    --disable-next-scroll \
    --disable-xterm-scroll \
    --disable-smart-resize \
    --enable-frills \
    --disable-slipwheeling \
    --disable-startup-notification \
    --disable-transparency \
    --disable-utmp \
    --disable-wtmp \
    --enable-xft
  make
}

package() {

  # # install freedesktop menu
  # for _f in urxvt urxvtc; do
  #   install -Dm644 $_f.desktop "$pkgdir/usr/share/applications/$_f.desktop"
  # done

  cd $_pkgname-$pkgver

  # workaround terminfo installation
  export TERMINFO="$srcdir/terminfo"
  install -d "$TERMINFO"
  make DESTDIR="$pkgdir" install
}


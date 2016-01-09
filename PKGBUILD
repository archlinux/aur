# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>

_pkgname=rxvt-unicode
pkgname=rxvt-unicode-intensityfix
pkgver=9.21
pkgrel=1
pkgdesc='A unicode enabled rxvt-clone terminal emulator (urxvt), patched to avoid intense colors on 256 color escape codes'
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
depends=('rxvt-unicode-terminfo' 'libxft' 'perl' 'startup-notification')
optdepends=('gtk2-perl: to use the urxvt-tabbed')
provides=('rxvt-unicode')
conflicts=('rxvt-unicode')
source=(
  "http://dist.schmorp.de/rxvt-unicode/$_pkgname-$pkgver.tar.bz2"
  'urxvt.desktop'
  'urxvtc.desktop'
  'urxvt-tabbed.desktop'
  'intensity.patch'
)
md5sums=('a9a06c608258c5fd247c3725d8f44582'
         'fec94dc986fa37ec380079d81de3e0b2'
         'fac55f0a8404c86dad3e702146762332'
         '8a5599197568c63720e282b9722a7990'
         '9e10a3a8b2caebb9d9ff21a5610bb2bb')

build() {
  cd $_pkgname-$pkgver

  patch -Np0 -i ../intensity.patch

  # we disable smart-resize (FS#34807)
  # do not specify --with-terminfo (FS#46424)
  ./configure \
    --prefix=/usr \
    --enable-256-color \
    --enable-combining \
    --enable-fading \
    --enable-font-styles \
    --enable-iso14755 \
    --enable-keepscrolling \
    --enable-lastlog \
    --enable-mousewheel \
    --enable-next-scroll \
    --enable-perl \
    --enable-pointer-blank \
    --enable-rxvt-scroll \
    --enable-selectionscrolling \
    --enable-slipwheeling \
    --disable-smart-resize \
    --enable-startup-notification \
    --enable-transparency \
    --enable-unicode3 \
    --enable-utmp \
    --enable-wtmp \
    --enable-xft \
    --enable-xim \
    --enable-xterm-scroll \
    --disable-pixbuf \
    --disable-frills
  make
}

package() {
  # install freedesktop menu
  for _f in urxvt urxvtc urxvt-tabbed; do
    install -Dm644 $_f.desktop "$pkgdir/usr/share/applications/$_f.desktop"
  done
  cd $_pkgname-$pkgver
  # workaround terminfo installation
  export TERMINFO="$srcdir/terminfo"
  install -d "$TERMINFO"
  make DESTDIR="$pkgdir" install
  # install the tabbing wrapper ( requires gtk2-perl! )
  sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
  install -Dm 755 doc/rxvt-tabbed "$pkgdir/usr/bin/urxvt-tabbed"
}

# vim:set ts=2 sw=2 et:

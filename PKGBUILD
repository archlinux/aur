# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>

_pkgname=rxvt-unicode
pkgname=rxvt-unicode-intensityfix
pkgver=9.22
pkgrel=5
pkgdesc='A unicode enabled rxvt-clone terminal emulator (urxvt), patched to avoid intense colors on 256 color escape codes and to fix font spacing'
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
  'font-width-fix.patch'
  'line-spacing-fix.patch'
  '256color.patch'
)
md5sums=('93782dec27494eb079467dacf6e48185'
         'fec94dc986fa37ec380079d81de3e0b2'
         'fac55f0a8404c86dad3e702146762332'
         '8a5599197568c63720e282b9722a7990'
         '9e2ccfa07aafa6aeaf1dbdd005437af7'
         'fef588d6bfe52304bf80e8f1771577b6'
         '9f3248bc397ee76b008375f2ab0f201a'
         'fb78c2ecf87626962734320cc2bb7ab1')

prepare() {
  cd $_pkgname-$pkgver

  patch -p0 -i ../intensity.patch

  # From https://aur.archlinux.org/packages/rxvt-unicode-patched/
  patch -p0 -i ../font-width-fix.patch
  patch -p0 -i ../line-spacing-fix.patch

  # From https://aur.archlinux.org/packages/rxvt-unicode-256xresources/
  patch -p0 -i ../256color.patch
}

build() {
  cd $_pkgname-$pkgver

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
    --enable-frills
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

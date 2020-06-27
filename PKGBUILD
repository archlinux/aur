# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>

_pkgname=rxvt-unicode
pkgname=rxvt-unicode-intensityfix
pkgver=9.22
pkgrel=14
pkgdesc='A unicode enabled rxvt-clone terminal emulator (urxvt) (opinionated build)'
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
depends=('libxft' 'perl' 'startup-notification' 'gdk-pixbuf2')
provides=('rxvt-unicode' 'rxvt-unicode-terminfo')
conflicts=('rxvt-unicode' 'rxvt-unicode-terminfo')
source=(
  "http://dist.schmorp.de/rxvt-unicode/$_pkgname-$pkgver.tar.bz2"
  'intensity.patch'
  'background-img-use-color.patch'
  'font-width-fix.patch'
  'line-spacing-fix.patch'
  'sgr-mouse-mode.patch'
  '256color.patch'
  'enable-wide-glyphs.patch'
)
md5sums=('93782dec27494eb079467dacf6e48185'
         '9e2ccfa07aafa6aeaf1dbdd005437af7'
         'd8377a6ec47a7913636fbc368aded94b'
         'fef588d6bfe52304bf80e8f1771577b6'
         '9f3248bc397ee76b008375f2ab0f201a'
         'f8325b0a33999db4d5d1eeac4f320156'
         'fb78c2ecf87626962734320cc2bb7ab1'
         'fa7e51d6a521605ff1b18470510156b0')

prepare() {
  cd $_pkgname-$pkgver

  patch -p0 -i ../intensity.patch
  patch -p0 -i ../background-img-use-color.patch

  # From https://aur.archlinux.org/packages/rxvt-unicode-patched/
  patch -p0 -i ../font-width-fix.patch
  patch -p0 -i ../line-spacing-fix.patch
  patch -p0 -i ../sgr-mouse-mode.patch

  # From https://aur.archlinux.org/packages/rxvt-unicode-256xresources/
  patch -p0 -i ../256color.patch

  # from https://aur.archlinux.org/packages/rxvt-unicode-cvs-patched-wideglyphs/
  patch -p1 -i ../enable-wide-glyphs.patch
}

build() {
  cd $_pkgname-$pkgver

  # we disable smart-resize (FS#34807)
  # do not specify --with-terminfo (FS#46424)
  ./configure \
    --prefix=/usr \
    --enable-256-color \
    --enable-combining \
    --disable-fading \
    --enable-font-styles \
    --disable-iso14755 \
    --disable-keepscrolling \
    --enable-lastlog \
    --enable-mousewheel \
    --disable-next-scroll \
    --enable-perl \
    --enable-pointer-blank \
    --disable-rxvt-scroll \
    --enable-selectionscrolling \
    --disable-slipwheeling \
    --disable-smart-resize \
    --enable-startup-notification \
    --disable-transparency \
    --enable-unicode3 \
    --enable-utmp \
    --enable-wide-glyphs \
    --enable-wtmp \
    --enable-xft \
    --disable-xim \
    --disable-xterm-scroll \
    --enable-pixbuf \
    --enable-frills
  make
}

package() {
  # install terminfo
  cd $_pkgname-$pkgver
  export TERMINFO="$pkgdir/usr/share/terminfo"
  install -dm 755 "$TERMINFO"
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/usr/bin/urxvt{c,d}
}

# vim:set ts=2 sw=2 et:

# Maintainer: Brate Z <brate kann karate at gmail dot com>
# This is a fork of rxvt-unicode-patched. Added pixbuf and some patches.

_pkgname=rxvt-unicode
pkgname=rxvt-unicode-pixbuf-patched
pkgver=9.31
pkgrel=1
pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt), with pixbuf, fixed font spacing, fixed line spacing, vi-bindings for matcher and fixed opacity.'
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
depends=('libxft' 'perl' 'startup-notification' 'rxvt-unicode-terminfo' 'gdk-pixbuf2' 'libptytty')
optdepends=('gtk2-perl: to use the urxvt-tabbed')
provides=(rxvt-unicode)
conflicts=(rxvt-unicode)
source=(http://dist.schmorp.de/rxvt-unicode/$_pkgname-$pkgver.tar.bz2
        'urxvt.desktop'
        'urxvtc.desktop'
        'urxvt-tabbed.desktop'
        'font-width-fix.patch'
        'line-spacing-fix.patch'
        'background-opacity.patch'
        'matcher-vi-bindings.patch')
sha256sums=(
          'aaa13fcbc149fe0f3f391f933279580f74a96fd312d6ed06b8ff03c2d46672e8'
          '13b3ce60ef607b5c94c9e0e2aa5236781e7a4c1c69da2c0ea9ef30c52728ac69'
          '9c1964776a1f7fe0ccfff937355e7dedca812c328e38970598bf2f62633ee121'
          '1841d774887c4402f9fd431abc54776a914ac7f9d19cb1903035fb2afd6a79c4'
          '686770fe4e8d6bb0ba497ad2e1f217d17515f2544d80abe76496c63ead2bfaa4'
          '546a388d0595404a59c71c3eaeba331031032a75f96c57e9a860f27bbd7ebfcc'
          '903f58e948b8726724494e37002151a0a749d8aeb7b633f1bd98896b0ecc57bf'
          'b4fa4d694c6238f61ce61c38315c64ec95df45a5fca6b950660d37fbdbbc19ca'
          )

prepare() {
  cd $_pkgname-$pkgver

  patch -p0 -i ../font-width-fix.patch
  patch -p0 -i ../line-spacing-fix.patch
  patch -p0 -i ../background-opacity.patch
  patch -p0 -i ../matcher-vi-bindings.patch
}

build() {
  cd $_pkgname-$pkgver

  # do not specify --with-terminfo (FS#46424)

  #We use the rxvt-unicode-terminfo package from extra, silently do nothing:
  export TIC="/usr/bin/true"

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
    --enable-smart-resize \
    --enable-startup-notification \
    --enable-transparency \
    --enable-unicode3 \
    --enable-utmp \
    --enable-wtmp \
    --enable-xft \
    --enable-xim \
    --enable-xterm-scroll \
    --enable-pixbuf \
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

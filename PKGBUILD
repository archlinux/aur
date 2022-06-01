# Maintainer: Brate Z <brate kann karate at gmail dot com>
# This is a fork of rxvt-unicode-patched. Added pixbuf and some patches.

_pkgname=rxvt-unicode
pkgname=rxvt-unicode-pixbuf-patched
pkgver=9.30
pkgrel=0
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
sha1sums=('700265a255eedf0f553cadfe5484bf71f8fb74c2'
          'b5a4507f85ebb7bac589db2e07d9bc40106720d9'
          '62c4ffecfce6967def394dd4d418b68652372ea2'
          'cd204d608d114d39c80331efe0af0231ad6b7e18'
          '01ee8f212add79a158dcd4ed78d0ea1324bdc59b'
          'b7fde1c46af45e831828738874f14b092b1e795f'
          '786f1d4159ca4d644e34bf22e8a24ac483e719d6'
          'eb11ce847839d9764b7883d45d59c5fbdcae5962')

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
    --enable-pixbuf
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

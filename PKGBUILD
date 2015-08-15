# Maintainer: Lukas Tobler <luk4s.tobler@gmail.com>
pkgname=rxvt-unicode-256xresources
_pkgname=rxvt-unicode
pkgver=9.21
pkgrel=1
pkgdesc="urxvt with support for 256 Xresource colors and patches for line/font spacing"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://software.schmorp.de/pkg/rxvt-unicode.html"
license=('GPL')
depends=('gcc-libs' 'libxft' 'gdk-pixbuf2')
optdepends=('perl: lots of utilities' 'gtk2-perl: to use the urxvt-tabbed')
source=(http://dist.schmorp.de/rxvt-unicode/$_pkgname-$pkgver.tar.bz2
        font-width-fix.patch
        line-spacing-fix.patch
        256color.patch
        urxvt.desktop
        urxvtc.desktop)
provides=(rxvt-unicode)
conflicts=(rxvt-unicode)
md5sums=('a9a06c608258c5fd247c3725d8f44582'
         'df0c3a8b6bb0578d1b91e4081c47881c'
         'd4e03127a0d3bbf2e173850770651b08'
         'fb78c2ecf87626962734320cc2bb7ab1'
         '88d8786d74b819450adf722180db09fd'
         'bebf5b6b399b74b557fcedbdb47cc387')
build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p0 -i ../256color.patch
  patch -p0 -i ../font-width-fix.patch
  patch -p0 -i ../line-spacing-fix.patch
  ./configure  \
    --prefix=/usr \
    --with-terminfo=/usr/share/terminfo \
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
    --disable-pixbuf \
    --disable-frills
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -d "$pkgdir/usr/share/terminfo"
  export TERMINFO="$pkgdir/usr/share/terminfo"
  make DESTDIR="$pkgdir" install

  #install the tabbing wrapper ( requires gtk2-perl! )
  sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
  install -Dm 755 doc/rxvt-tabbed "$pkgdir/usr/bin/urxvt-tabbed"

  #install freedesktop menu
  install -Dm644 ../urxvt.desktop \
    "$pkgdir/usr/share/applications/$urxvt.desktop"
  install -Dm644 ../urxvtc.desktop \
    "$pkgdir/usr/share/applications/$urxvtc.desktop"
}

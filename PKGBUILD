# Maintainer: George Ornbo <george@shapeshed.com>

pkgname=st-solarized-light
appname='st'
pkgver=0.7
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X. Patched for solarized light and Inconsolata font.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxext' 'libxft')
makedepends=('ncurses')
url="http://st.suckless.org"
source=(http://dl.suckless.org/st/$appname-$pkgver.tar.gz
        http://st.suckless.org/patches/st-no_bold_colors-20160727-308bfbf.diff
        http://st.suckless.org/patches/st-solarized-light-20160727-308bfbf.diff)

sha256sums=('f7870d906ccc988926eef2cc98950a99cc78725b685e934c422c03c1234e6000'
        '2e8cdbeaaa79ed067ffcfdcf4c5f09fb5c8c984906cde97226d4dd219dda39dc'
        'd3f28d2a78647e52e64ff2a41df96802787ea15deb168a585c09a9f5cf2ba066')

prepare() {
  cd "$srcdir/$appname-$pkgver"
  patch -i "$srcdir/st-no_bold_colors-20160727-308bfbf.diff"
  patch -i "$srcdir/st-solarized-light-20160727-308bfbf.diff"
  cp config.def.h config.h
  sed -i 's/Liberation Mono:pixelsize=12:antialias=true:autohint=true/Inconsolata:pixelsize=16:antialias=true:autohint=true/' config.h 
}

build() {
  cd "$srcdir/$appname-$pkgver"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/$appname-$pkgver"
  # Avoid conflict with ncurses package
  rm "$pkgdir/usr/share/terminfo/s/st"
  rm "$pkgdir/usr/share/terminfo/s/st-256color"
  make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

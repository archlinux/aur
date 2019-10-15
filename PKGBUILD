# Maintainer: John Morris <2e0byo gmail com>
# Contributor: Christoph Vigano <mail@cvigano.de>
# Contributor: Mikhail Burakov <mikhail.burakov gmail com>
# Contributor: Patrick Jackson <PatrickSJackson gmail com>

# Based on st-solarized, with scrollback patches and accessible config.h added

pkgname=st-solarized-scrollback
_appname='st'
conflicts=(${_appname} ${_appname}-solarized)
provides=(${_appname})
pkgver=0.8.1
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X. Patched for solarized colorscheme and scrollback.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft')
makedepends=('ncurses')
url="http://st.suckless.org"

source=(http://dl.suckless.org/st/$_appname-$pkgver.tar.gz
        http://st.suckless.org/patches/solarized/st-no_bold_colors-$pkgver.diff
        http://st.suckless.org/patches/solarized/st-solarized-both-$pkgver.diff
	https://st.suckless.org/patches/scrollback/st-scrollback-$pkgver.diff
	https://st.suckless.org/patches/scrollback/st-scrollback-mouse-0.8.diff
	https://st.suckless.org/patches/scrollback/st-scrollback-mouse-altscreen-0.8.diff
	config.h)

sha256sums=('c4fb0fe2b8d2d3bd5e72763e80a8ae05b7d44dbac8f8e3bb18ef0161c7266926'
            '5a6e2b745c7746228e0ee4e84214e3ac7054e6d451bc5843364e878bb2011e3b'
            '698e7ee411cf80ae31e11d41daf2713b6ed8f3f533281efb9a8c200f458a03bf'
	    'ddc26e8e6dcce1a51f8aa8ed33072afcf4ff2d20f64ea24d96409479e86e8750'
	    '3fb38940cc3bad3f9cd1e2a0796ebd0e48950a07860ecf8523a5afd0cd1b5a44'
	    'bcfc106089d9eb75aa014d4915ed3e6842f1df54edd8b75597154096333df6fa'
	    'SKIP')

prepare() {
  # one should maintain config.h oneself.  This is a bit crude: it's
  # simply the patched config.def.h with two changes: 1. font and
  # 2. toggling with Shift-Ctrl-F6 But it works for now until I think
  # of a better way.
  cp "$srcdir/config.h" "$srcdir/$_appname-$pkgver/config.h"
}

build() {
  cd "$srcdir/$_appname-$pkgver"
  patch -i "$srcdir/st-no_bold_colors-$pkgver.diff"
  patch -i "$srcdir/st-solarized-both-$pkgver.diff"
  patch -i "$srcdir/st-scrollback-$pkgver.diff" --fuzz=3
  patch -i "$srcdir/st-scrollback-mouse-0.8.diff"
  patch -i "$srcdir/st-scrollback-mouse-altscreen-0.8.diff"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/$_appname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install

  # Avoid conflict with ncurses package
  rm "$pkgdir/usr/share/terminfo/s/st"
  rm "$pkgdir/usr/share/terminfo/s/st-256color"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_appname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$_appname/README"
}

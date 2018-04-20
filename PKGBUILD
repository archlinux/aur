# Contributor: Patrick Jackson <PatrickSJackson gmail com>
# Maintainer: Christoph Vigano <mail@cvigano.de>
# Maintainer: Mikhail Burakov <mikhail.burakov gmail com>

pkgname=st-solarized
appname='st'
conflicts=(${appname})
provides=(${appname})
pkgver=0.8.1
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X. Patched for solarized colorscheme.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxext' 'libxft')
makedepends=('ncurses')
url="http://st.suckless.org"

source=(http://dl.suckless.org/st/$appname-$pkgver.tar.gz
        http://st.suckless.org/patches/solarized/st-no_bold_colors-$pkgver.diff
        http://st.suckless.org/patches/solarized/st-solarized-both-$pkgver.diff)

sha256sums=('c4fb0fe2b8d2d3bd5e72763e80a8ae05b7d44dbac8f8e3bb18ef0161c7266926'
            '5a6e2b745c7746228e0ee4e84214e3ac7054e6d451bc5843364e878bb2011e3b'
            '698e7ee411cf80ae31e11d41daf2713b6ed8f3f533281efb9a8c200f458a03bf')

build() {
  cd "$srcdir/$appname-$pkgver"
  patch -i "$srcdir/st-no_bold_colors-$pkgver.diff"
  patch -i "$srcdir/st-solarized-both-$pkgver.diff"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/$appname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install

  # Avoid conflict with ncurses package
  rm "$pkgdir/usr/share/terminfo/s/st"
  rm "$pkgdir/usr/share/terminfo/s/st-256color"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$appname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$appname/README"
}

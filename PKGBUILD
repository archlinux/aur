# Maintainer: Ainola
# Contributor: Patrick Jackson
# Contributor: Christoph Vigano
# Contributor: Mikhail Burakov

pkgname=st-jellybeans
conflicts=('st' 'st-solarized' 'st-solarized-dark' 'st-solarized-light' 'st-solarized-powerline' 'st-white')
provides=('st')
pkgver=0.6
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X. Patched for a Jellybeans-inspired colorscheme.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxext' 'libxft')
makedepends=('ncurses')
url="http://st.suckless.org"

source=("http://dl.suckless.org/st/st-$pkgver.tar.gz"
        "st-0.6-jellybeans.diff")

sha256sums=('85310c08c3814e099b5e45888f8ac7548640e69e9973e934d4fba38b03737a2b'
            '253636a453cd5fb7b2f273e6e5943c627dae2845aea157382bd0b919e54d62f2')

build() {
  cd "$srcdir/st-$pkgver"
  patch -i "$srcdir"/st-0.6-jellybeans.diff
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/st-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install

  # Avoid conflict with ncurses package
  rm "$pkgdir/usr/share/terminfo/s/st"
  rm "$pkgdir/usr/share/terminfo/s/st-256color"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/st/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/st/README"
}


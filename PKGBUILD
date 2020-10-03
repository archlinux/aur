# Maintainer: aksr <aksr at t-com dot me>
pkgname=mlterm-git
pkgver=r3130.0e58dd2b
pkgrel=2
pkgdesc="Multi Lingual TERMinal emulator on X"
arch=('i686' 'x86_64')
url="https://github.com/arakiken/mlterm"
url="http://mlterm.sourceforge.net/"
license=('custom:BSD')
depends=('gtk2' 'gtk3' 'm17n-lib' 'libutempter')
makedepends=('git' 'intltool' 'librsvg' 'ncurses')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=(!libtool)
source=("$pkgname::git+https://github.com/arakiken/mlterm"
        'mlterm.desktop')
options=(!strip)
md5sums=('SKIP'
         'd019c571f28c7b765610e219d9e52e35')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --libexecdir=/usr/lib/mlterm --sysconfdir=/etc --mandir=/usr/share/man \
              --enable-fribidi \
              --enable-optimize-redrawing \
              --enable-utmp \
              --enable-m17nlib \
              --disable-static \
              --with-type-engines=xft,cairo,xcore \
              --with-gtk=2.0,3.0 \
              --with-scrollbars \
              --with-tools=mlconfig,mlterm-zoom,mlterm-menu,mlclient,mlcc,mlfc \
              --with-imagelib=gdk-pixbuf
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
  echo 'conf_menu_path_2 = mlterm-zoom' >> "$pkgdir/etc/mlterm/main"
  install -D -m644 "$srcdir/mlterm.desktop" "$pkgdir/usr/share/applications/mlterm.desktop"
  sed -e 's:mlterm:mlclient:' < "$pkgdir/usr/share/applications/mlterm.desktop" > "$pkgdir/usr/share/applications/mlclient.desktop"
  install -D -m644 "contrib/icon/mlterm-icon.svg" "$pkgdir/usr/share/pixmaps/mlterm.svg"
  install -D -m644 "contrib/icon/mlterm-icon-trans.svg" "$pkgdir/usr/share/pixmaps/mlclient.svg"
  install -D -m644 LICENCE "$pkgdir/usr/share/licenses/${pkgname%-*}/LICENCE"
  cd "$pkgdir/usr/share/pixmaps"
  rsvg-convert -w 48 -h 38 -f png -o mlterm.png mlterm.svg
  rsvg-convert -w 48 -h 38 -f png -o mlclient.png mlclient.svg
}

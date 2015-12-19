# Contributor: Kohei Suzuki <eagletmt@gmail.com>
# Contributor: Daniel Wallace < danielwallace at gtmanfred dot com >
# Contributor: Yoel Lion <yoel3ster at gmail dot com>
# Contributor: Netanel Shine <Netanelshine@gmail.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Gatekeeper <cool_work@yahoo.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=mlterm
pkgver=3.6.1
pkgrel=1
pkgdesc="Multi Lingual TERMinal emulator on X"
url="http://mlterm.sourceforge.net/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('gtk2' 'gtk3' 'm17n-lib' 'libutempter')
makedepends=('intltool' 'librsvg' 'ncurses')
options=(!libtool)
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz $pkgname.desktop)
md5sums=('1fd1ea0ed3ba2b28552e9cf0f132fbce'
         'd019c571f28c7b765610e219d9e52e35')
sha1sums=('53ae7f9e41696102adc0b797b9cd28a875ae4e79'
          '6a2c46265b0751ccf016e7521fdf48d1f9ac459f')
sha256sums=('798e048afdf499c1a4d19dc5b46ca5b990ebc93b4c6e311c0fe334059654a078'
            'b254755e320a94a05d3d745cd582a5b91f5ed33fd69396feca0511cf5c6b3ce0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --libexecdir=/usr/lib/mlterm --sysconfdir=/etc --mandir=/usr/share/man \
              --enable-fribidi \
              --enable-optimize-redrawing \
              --enable-utmp \
              --enable-m17nlib \
              --disable-static \
              --with-type-engines=xft,cairo,xcore \
              --with-gtk=2.0,3.0 \
              --with-scrollbars \
              --with-tools=mlconfig,mlterm-zoom,mlterm-menu,mlclient,mlcc \
              --with-imagelib=gdk-pixbuf
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  echo 'conf_menu_path_2 = mlterm-zoom' >> "$pkgdir/etc/mlterm/main"

  # install some freedesktop.org compatibility
  install -D -m644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -e 's:mlterm:mlclient:' \
   < "$pkgdir/usr/share/applications/$pkgname.desktop" \
   > "$pkgdir/usr/share/applications/mlclient.desktop"
  install -D -m644 "contrib/icon/$pkgname-icon.svg" \
    "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -D -m644 "contrib/icon/$pkgname-icon-trans.svg" \
    "$pkgdir/usr/share/pixmaps/mlclient.svg"

  # finally we render a png as fallback for not svg aware menu applications
  # Attention: always make sure you check the dimensions of the source-svg,
  # you can read the dimensions via inkscapes export funktion
  cd "$pkgdir/usr/share/pixmaps"
  rsvg-convert -w 48 -h 38 -f png -o mlterm.png mlterm.svg
  rsvg-convert -w 48 -h 38 -f png -o mlclient.png mlclient.svg
}


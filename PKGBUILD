# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: dorphell <dorphell@archlinux.org>

pkgname=ripperx
pkgver=2.8.0
pkgrel=2
pkgdesc="GTK program to rip and encode mp3 files"
arch=(x86_64)
url="http://ripperx.sourceforge.net/"
depends=('gtk2' 'taglib')
license=('GPL')
source=(http://downloads.sourceforge.net/project/ripperx/ripperx/$pkgver/ripperx-$pkgver.tar.bz2)
md5sums=('51ac9ec0fddef9d2e951232a60d23bcd')

prepare() {
  cd "$srcdir"/ripperx-$pkgver
  sed -i 's|Icon=.*|Icon=ripperX.xpm|g' ripperX.desktop
  echo "Categories=GTK;GNOME;AudioVideo;DiscBurning;" >>ripperX.desktop
  patch ripperX.pc.in <<EOF
diff -r ripperX-2.7.3/ripperX.pc.in ripperX-2.7.3.y/ripperX.pc.in
3a4
> includedir=@includedir@
EOF
  sed -i 's/.*gtk_cpp_workaround.h.*//g' \
    src/config_window_handler.c \
    src/select_frame_handler.c \
    src/status_frame_handler.c
}

build() {
  cd "$srcdir"/ripperx-$pkgver
  CFLAGS="-fpermissive" ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/ripperx-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm0644 ripperX.desktop "$pkgdir"/usr/share/applications/ripperX.desktop
  install -Dm0644 src/xpms/ripperX-icon.xpm "$pkgdir"/usr/share/icons/ripperX.xpm
}

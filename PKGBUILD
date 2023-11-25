# Maintainer:  dreieck
# Contributor: Stefan Husmann (https://aur.archlinux.org/account/haawda)
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartholian (https://aur.archlinux.org/account/Barthalion)

pkgname=ripperx
pkgver=2.8.0
pkgrel=5
pkgdesc="GTK2 program to rip Audio CDs and encode to FLAC, OGG and MP3."
arch=(
  'x86_64'
  'i686'
)
url="http://ripperx.sourceforge.net/"
depends=(
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk2'
  'taglib'
)
license=('GPL')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('51ac9ec0fddef9d2e951232a60d23bcd')

prepare() {
  cd "$pkgname-$pkgver"
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
  cd "$pkgname-$pkgver"
  CFLAGS+=" -fpermissive"
  export CFLAGS

  ./configure \
    --prefix=/usr \
    --enable-nls

  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm0644 ripperX.desktop "$pkgdir"/usr/share/applications/ripperX.desktop
  install -Dm0644 src/xpms/ripperX-icon.xpm "$pkgdir"/usr/share/icons/ripperX.xpm
}

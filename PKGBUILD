# Maintainer: bud
# Contributor: bud

pkgname=thunar-gtk2-static-libs
pkgver=1.6.17
pkgrel=4
pkgdesc='GTK+2 version of Thunar with old xfce dependencies statically linked'
arch=('x86_64')
url="http://thunar.xfce.org"
license=('GPL2' 'LGPL2.1')
depends=('desktop-file-utils' 'libexif' 'hicolor-icon-theme' 'libnotify'
         'libgudev' 'gtk2' 'libpng')
makedepends=('intltool')
optdepends=('gvfs: for trash support, mounting with udisk and remote filesystems'
            'tumbler: for thumbnail previews'
            'thunar-volman: manages removable devices'
            )
conflicts=(thunar)
provides=(thunar)
source=("https://archive.xfce.org/src/xfce/thunar/1.6/Thunar-1.6.17.tar.bz2"
        "https://archive.xfce.org/src/xfce/libxfce4util/4.10/libxfce4util-4.10.1.tar.bz2"
        "https://archive.xfce.org/src/xfce/libxfce4ui/4.10/libxfce4ui-4.10.0.tar.bz2"
        "https://archive.xfce.org/src/xfce/exo/0.10/exo-0.10.6.tar.bz2"
        "https://archive.xfce.org/src/xfce/xfconf/4.10/xfconf-4.10.0.tar.bz2" )

sha256sums=('ced9f64db447f24e1a5a5376f413648b35da376c3fa1a471a0d7f680d792338d'
            'e82cd1ad715c02a385b3cf6646cb89aa3c4724446dac1d7e424971df12f6cfbb'
            'a2b9fa288ccb5f16fa13264e507ba3f7b8da0176da259a11239f21538c0ea3e2'
            '1cc0e5a432e050a5e5aa64d126b988f4440da4f27474aaf42a4d8e13651d0752'
            '175219a441cc7d0f210bbd1a3b0abba41598627cd9db27235811400c3e100576')

prepare() {
  mkdir -p "$srcdir/tmp-env"
  for dep in "libxfce4util-4.10.1" "libxfce4ui-4.10.0" "exo-0.10.6" "xfconf-4.10.0" ; do
    cd "$srcdir/$dep"
    ./configure \
      PKG_CONFIG_PATH="$srcdir/tmp-env/lib/pkgconfig" \
      --disable-debug  --disable-shared \
      --prefix "$srcdir/tmp-env"
    make
    make install
  done
}

build() {
  cd "$srcdir/Thunar-$pkgver"

  ./configure \
    --prefix=/usr \
    PKG_CONFIG_PATH="$srcdir/tmp-env/lib/pkgconfig" \
    --enable-static --disable-shared \
    --sysconfdir=/etc \
    --enable-gio-unix \
    --enable-dbus \
    --enable-gudev \
    --enable-notifications \
    --enable-exif \
    --enable-pcre \
    --disable-debug
  make

}

package() {
  cd "$srcdir/Thunar-$pkgver"
  make DESTDIR="$pkgdir" install
}

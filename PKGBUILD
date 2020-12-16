# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-gdk-pixbuf2-git
pkgver=2.39.2+1+g3249c681f
pkgrel=1
pkgdesc="An image loading library (32-bit)"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/GdkPixbuf"
license=(LGPL2.1)
provides=(lib32-gdk-pixbuf2)
conflicts=(lib32-gdk-pixbuf2)
depends=(lib32-glib2 lib32-libpng lib32-libtiff lib32-libjpeg lib32-libx11 gdk-pixbuf2)
makedepends=(gobject-introspection git meson)
install=lib32-gdk-pixbuf2.install
source=("git+https://gitlab.gnome.org/GNOME/gdk-pixbuf.git"
        gdk-pixbuf-query-loaders-32.hook)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd gdk-pixbuf
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gdk-pixbuf
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"
  export CFLAGS="-I/usr/include/libtiff32 $CFLAGS"

  arch-meson gdk-pixbuf build \
    --libdir /usr/lib32 \
    -D installed_tests=false \
    -D man=false \
    -D gir=false \
    -D gtk_doc=false \
    -D introspection=disabled
  ninja $NINJAFLAGS -C build
}

#check() {
#  cd build
  # pixbuf-randomly-modified fails randomly
#  meson test -t 3 || :
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
  rm -rf "$pkgdir"/usr/{include,lib,share}
  find "$pkgdir/usr/bin" -type f -not -name gdk-pixbuf-query-loaders -delete
  mv "$pkgdir"/usr/bin/gdk-pixbuf-query-loaders{,-32}
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
}

# vim:set ts=2 sw=2 et:

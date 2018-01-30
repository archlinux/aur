# Maintainer: piernov <piernov@piernov.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=synfigstudio-git
pkgver=r8165.bd7d8b2cc
pkgrel=4
pkgdesc="Professional vector animation program (GUI)"
arch=(i686 x86_64)
url="http://synfig.org"
license=('GPL2')
depends=('gtkmm3' 'synfig-git' 'sdl_image')
makedepends=('openexr' 'imagemagick' 'xorg-fonts-100dpi' 'xorg-fonts-75dpi'
	     'xorg-fonts-misc' 'xorg-fonts-type1' 'intltool' 'etl')
conflicts=('synfigstudio')
provides=('synfigstudio')
source=(git+https://github.com/synfig/synfig)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/synfig/synfig-core
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/synfig/synfig-studio
  export PKG_CONFIG_PATH=/usr/lib/ffmpeg0.10/pkgconfig:/usr/lib/imagemagick6/pkgconfig:$PKG_CONFIG_PATH
  LDFLAGS="$LDFLAGS -Wl,-rpath -Wl,/usr/lib/ffmpeg0.10"
  CFLAGS="$CFLAGS -D__STDC_CONSTANT_MACROS"
  CXXFLAGS="$CXXFLAGS -D__STDC_CONSTANT_MACROS -std=gnu++11"
  [ -f configure ] || { libtoolize --ltdl --copy --force && autoreconf --install --force; }
  intltoolize --force
  [ -f Makefile ] || ./configure --prefix=/usr --sysconfdir=/etc --with-libavcodec --with-libdv
  sed -i 's#Gtk::IconSize::IconSize#Gtk::IconSize#' src/gui/dialogs/dialog_color.cpp
  # please pay attention to your number of cores and ram amount for avoid oom errors
  # this number its fine for and amd fx 8350 with 16gb ram
  # you need 2gb per core  for avoid surprises, OR dont do anything while it compiles  
  make -j8
}

package() {
  cd "$srcdir"/synfig/synfig-studio
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/usr/share/pixmaps/synfigstudio/*.mng
  install -m644 images/*.png -t "$pkgdir"/usr/share/pixmaps/synfigstudio/
  rm -f "$pkgdir"/usr/share/mime/XMLnamespaces
  rm -f "$pkgdir"/usr/share/mime/aliases
  rm -f "$pkgdir"/usr/share/mime/generic-icons
  rm -f "$pkgdir"/usr/share/mime/globs
  rm -f "$pkgdir"/usr/share/mime/globs2
  rm -f "$pkgdir"/usr/share/mime/icons
  rm -f "$pkgdir"/usr/share/mime/magic
  rm -f "$pkgdir"/usr/share/mime/mime.cache
  rm -f "$pkgdir"/usr/share/mime/subclasses
  rm -f "$pkgdir"/usr/share/mime/treemagic
  rm -f "$pkgdir"/usr/share/mime/types
  rm -f "$pkgdir"/usr/share/mime/version
}

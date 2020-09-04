# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Piernov <piernov@piernov.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=synfigstudio-dev
pkgver=1.3.16
pkgrel=1
pkgdesc="Professional vector animation program (GUI)"
arch=(i686 x86_64 armv7 armv8)
url="https://synfig.org"
license=('GPL3')
depends=('gtkmm3' 'synfig-dev' 'sdl_image')
makedepends=('openexr' 'imagemagick' 'xorg-fonts-100dpi' 'xorg-fonts-75dpi'
         'xorg-fonts-misc' 'xorg-fonts-type1' 'intltool' 'etl-dev')
conflicts=('synfigstudio')
provides=('synfigstudio-dev')
source=("https://github.com/synfig/synfig/archive/v$pkgver.tar.gz")
sha512sums=('6cf5be662cc5bc26ad27bdc6ea3baae14ce6a100d214c38e873a88c6ad8acf7f7009ac3b09e2ed13c79650e75af5eb8e5d893ad9fd3f57ef1dce339799871381')

build() {
  cd "$srcdir"/synfig-$pkgver/synfig-studio
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
  cd "$srcdir"/synfig-$pkgver/synfig-studio
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

# Maintainer: Julian Orth <ju.orth at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gtk4-without-subpixel-hinting
provides=(gtk4 libgtk-4.so)
conflicts=(gtk4)
pkgver=4.2.1
pkgrel=2
pkgdesc="GObject-based multi-platform GUI toolkit (without subpixel hinting)"
arch=(x86_64)
url="https://www.gtk.org/"
depends=(glib2 cairo pango fribidi gdk-pixbuf2 libepoxy libgl libegl harfbuzz
         libxkbcommon graphene iso-codes tracker3 libcolord wayland
         wayland-protocols libxrandr libx11 libxrender libxi libxext libxcursor
         libxdamage libxfixes libxcomposite fontconfig libxinerama
         vulkan-icd-loader vulkan-headers libcloudproviders libcups rest
         json-glib ffmpeg gst-plugins-bad-libs librsvg dconf shared-mime-info
         desktop-file-utils adwaita-icon-theme cantarell-fonts
         gtk-update-icon-cache)
makedepends=(git meson gi-docgen shaderc sassc gobject-introspection
             docbook-xsl)
license=(LGPL)
_commit=ba44668478b7184bec02609f292691b85a2c6cdd  # tags/4.2.1^0
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
        '0001-Re-enable-non-subpixel-hinting.patch'
        gtk4-querymodules.hook)
sha256sums=('SKIP'
            '5774eaa73ab2393f95dc50e3c5dac42f2859b5668624e6a5b9dd431ccd601ffb'
            'cd8e607eddd9941f279084e1d15309941423d26cca1897f43524a02e58e48816')

pkgver() {
  cd gtk
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gtk
  patch -Np1 -i ../0001-Re-enable-non-subpixel-hinting.patch
}

build() {
  CFLAGS+=" -DG_ENABLE_DEBUG -DG_DISABLE_CAST_CHECKS"
  local meson_options=(
    -D broadway-backend=true
    -D cloudproviders=enabled
    -D tracker=enabled
    -D colord=enabled
    -D gtk_doc=false
    -D demos=false
    -D build-examples=false
    -D build-tests=false
    -D man-pages=true
  )

  arch-meson gtk build "${meson_options[@]}"
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  install -Dm644 /dev/stdin "$pkgdir/usr/share/gtk-4.0/settings.ini" <<END
[Settings]
gtk-icon-theme-name = Adwaita
gtk-theme-name = Adwaita
gtk-font-name = Cantarell 11
END

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk4-querymodules.hook

  cd "$pkgdir"

  rm usr/bin/gtk4-update-icon-cache
  rm usr/share/man/man1/gtk4-update-icon-cache.1
}

# vim:set ts=2 sw=2 et:

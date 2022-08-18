# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gtk4-telegrand
pkgver=4.6.7
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (Version required by Telegrand)"
url="https://www.gtk.org/"
arch=(x86_64)
license=(LGPL)
depends=(glib2 cairo pango fribidi gdk-pixbuf2 libpng libtiff libjpeg libepoxy
         libgl libegl harfbuzz libxkbcommon graphene iso-codes tracker3
         libcolord wayland libxrandr libx11 libxrender libxi libxext libxcursor
         libxdamage libxfixes fontconfig libxinerama libcloudproviders libcups
         gst-plugins-bad-libs librsvg dconf shared-mime-info desktop-file-utils
         adwaita-icon-theme cantarell-fonts gtk-update-icon-cache)
optdepends=('evince: Default print preview command')
conflicts=(gtk4)
provides=(gtk4 libgtk-4.so)
makedepends=(git meson shaderc sassc gobject-introspection
             wayland-protocols python-gobject python-docutils)
checkdepends=(weston)
_commit=42b14ce5f20fc81b85aa3e3e0036fbb2d1476137  # tags/4.6.7^0
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
        'https://raw.githubusercontent.com/melix99/telegrand/main/build-aux/gtk-reversed-list.patch'
        gtk4-querymodules.hook)
sha256sums=('SKIP'
            '376dd807f472939eff8fc8b8fdc576a7b0cdb1438093342536bf5e34b9d0dcb7'
            'cd8e607eddd9941f279084e1d15309941423d26cca1897f43524a02e58e48816')

pkgver() {
  cd gtk
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gtk

  patch --forward --strip=1 --input="$srcdir/gtk-reversed-list.patch"
}

build() {
  CFLAGS+=" -DG_DISABLE_CAST_CHECKS"
  local meson_options=(
    -D broadway-backend=true
    -D cloudproviders=enabled
    -D tracker=enabled
    -D colord=enabled
    -D gtk_doc=false
    -D man-pages=true
    -D build-tests=false
    -D demos=false
  )

  arch-meson gtk build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  rm "$pkgdir/usr/bin/gtk4-update-icon-cache"
  rm "$pkgdir/usr/share/man/man1/gtk4-update-icon-cache.1"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/gtk-4.0/settings.ini" <<END
[Settings]
gtk-icon-theme-name = Adwaita
gtk-theme-name = Adwaita
gtk-font-name = Cantarell 11
END

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk4-querymodules.hook
}

# vim:set sw=2 et:

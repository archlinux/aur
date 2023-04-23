# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gtk4-telegrand
pkgver=4.10.3
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (Version required by Telegrand)"
url="https://www.gtk.org/"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=(LGPL)
depends=(
  adwaita-icon-theme
  cairo
  cantarell-fonts
  dconf
  desktop-file-utils
  fontconfig
  fribidi
  gdk-pixbuf2
  glib2
  graphene
  gst-plugins-bad-libs
  gtk-update-icon-cache
  harfbuzz
  iso-codes
  libcloudproviders
  libcolord
  libcups
  libegl
  libepoxy
  libgl
  libjpeg
  libpng
  librsvg
  libtiff
  libx11
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxi
  libxinerama
  libxkbcommon
  libxrandr
  libxrender
  pango
  shared-mime-info
  tracker3
  wayland
)
makedepends=(
  git
  gobject-introspection
  meson
  python-docutils
  python-gobject
  sassc
  shaderc
  wayland-protocols
)
optdepends=('evince: Default print preview command')
conflicts=(gtk4)
provides=(gtk4=$pkgver libgtk-4.so)
checkdepends=(weston)
_commit=06b3ced8e7fc936caed43379b120d75be09713ca  # tags/4.10.3^0
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
        gtk-reversed-list-${pkgver}.patch::'https://raw.githubusercontent.com/melix99/telegrand/main/build-aux/gtk-reversed-list.patch'
        gtk4-querymodules.{hook,script})
sha256sums=('SKIP'
            'a6ec54e8c7c082d6ca0bef0feb9da785044e6cde5dfda24959e6697a28763d5f'
            'a5074ffc057a3041a4f851b4b4674cfc21f3cb9cc90c5414c3e91816a5d205e9'
            '92d08db5aa30bda276bc3d718e7ff9dd01dc40dcab45b359182dcc290054e24e')

pkgver() {
  cd gtk
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gtk

  patch --forward --strip=1 --input="$srcdir/gtk-reversed-list-${pkgver}.patch"
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
    -D tracker=enabled
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
  install -D gtk4-querymodules.script "$pkgdir/usr/share/libalpm/scripts/gtk4-querymodules"
}

# vim:set sw=2 et:

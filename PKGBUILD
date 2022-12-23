# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gtk4-telegrand
pkgver=4.8.3
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
_commit=793831af8a224545495f0c56a184f4ee28e5cc55  # tags/4.8.3^0
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
        gtk-reversed-list-${pkgver}.patch::'https://raw.githubusercontent.com/melix99/telegrand/main/build-aux/gtk-reversed-list.patch'
        gtk4-querymodules.hook)
sha256sums=('SKIP'
            '4bf149a0f547747f13ffcd97f3160b6170dbfc4473d7d56d4f4c80eada4893c2'
            'cd8e607eddd9941f279084e1d15309941423d26cca1897f43524a02e58e48816')

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
}

# vim:set sw=2 et:

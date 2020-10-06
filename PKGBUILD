# Maintainer: dudemanguy <random342@airmail.cc>
# Contributer: Wolfgang Frisch (wfr) <wfrisch@riseup.net>
# Contributer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gtk3-patched-filechooser-icon-view
pkgver=3.24.23
pkgrel=4
epoch=1
pkgdesc="GTK3 patched with dudemanguy's fork of wfr's filechooser-icon-view patch."
arch=(x86_64)
url="https://github.com/Dudemanguy/gtk"
provides=(gtk3=$pkgver gtk3-print-backends libgtk-3.so libgdk-3.so libgailutil-3.so)
conflicts=(gtk3 gtk3-print-backends)
replaces=('gtk3-print-backends<=3.22.26-1')
depends=(atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2 dconf
         libxcomposite libxdamage pango shared-mime-info at-spi2-atk wayland libxkbcommon
         adwaita-icon-theme json-glib librsvg wayland-protocols desktop-file-utils mesa
         cantarell-fonts colord rest libcups libcanberra fribidi iso-codes tracker3
         libcloudproviders gtk-update-icon-cache)
optdepends=('glib2-patched-thumbnailer: Thumbnail generation in upload dialog')
makedepends=(gobject-introspection gtk-doc git glib2-docs sassc meson)

license=(LGPL)
install=gtk3.install
_commit=016e8c55ab924c9ef4d32c8cb06253b1dc1be60d  # tags/3.24.23^0
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
        0001-gtkplacessidebar-Disconnect-and-unref-cloud_manager-.patch
        settings.ini
        gtk-query-immodules-3.0.hook
        gtk3-filechooser-icon-view.patch)        

sha256sums=('SKIP'
            'd6f6bf347482553bc20a1640c1619f674520b853a5b2ade9fd56bb77bfdfe170'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'a0319b6795410f06d38de1e8695a9bf9636ff2169f40701671580e60a108e229'
            '37d8d594ee3ef4528b8066992999c39746f3506078083a7d21c19bbceae87b2b')
pkgver() {
  cd gtk
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gtk

  # https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/2669
  git apply -3 ../0001-gtkplacessidebar-Disconnect-and-unref-cloud_manager-.patch

  # apply icon-view patch
  git apply -3 ../gtk3-filechooser-icon-view.patch
}

build() {
  CFLAGS+=" -DG_ENABLE_DEBUG -DG_DISABLE_CAST_CHECKS"
  arch-meson gtk build \
    -D broadway_backend=true \
    -D cloudproviders=true \
    -D colord=yes \
    -D gtk_doc=true \
    -D man=true
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  install -Dt "$pkgdir/usr/share/gtk-3.0" -m644 settings.ini
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-query-immodules-3.0.hook

  # avoid file conflict with gtk-update-icon-cache
  rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}


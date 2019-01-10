# Maintainer: Ricardo Liang (rliang) <ricardoliang@gmail.com>

pkgname=gtk3-adwaita-3-32-git
pkgver=3.24.2+98+g78d2b673b4
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (with new Adwaita theme)"
arch=(x86_64)
url="https://www.gtk.org/"
provides=(gtk3 gtk3-print-backends)
conflicts=(gtk3 gtk3-print-backends)
replaces=("gtk3-print-backends<=3.22.26-1")
depends=(atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2 dconf
         libxcomposite libxdamage pango shared-mime-info at-spi2-atk wayland libxkbcommon
         adwaita-icon-theme json-glib librsvg wayland-protocols desktop-file-utils mesa
         cantarell-fonts colord rest libcups libcanberra gtk-update-icon-cache)
makedepends=(gobject-introspection gtk-doc git glib2-docs sassc)
install=gtk3.install
license=(LGPL)
_branch=wip/jimmac/adwaita-3-32
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#branch=$_branch"
        settings.ini
        gtk-query-immodules-3.0.hook)
sha256sums=('SKIP'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845')

pkgver() {
  cd gtk
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gtk
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd gtk

  CXX=/bin/false ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-schemas-compile \
    --enable-x11-backend \
    --enable-broadway-backend \
    --enable-wayland-backend \
    --enable-gtk-doc

  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {

  DESTDIR="$pkgdir" make -C gtk install

  install -Dt "$pkgdir/usr/share/gtk-3.0" -m644 settings.ini
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-query-immodules-3.0.hook

  rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}

# vim:set ts=2 sw=2 et:

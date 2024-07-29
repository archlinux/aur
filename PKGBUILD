# Maintainer: Piroro-hs

pkgname=gsettings-desktop-schemas-nofont
pkgver=46.1
pkgrel=2
pkgdesc='Shared GSettings schemas for the desktop, patched to drop font dependencies'
arch=('any')
url="https://gitlab.gnome.org/GNOME/${pkgname%-nofont}"
license=('LGPL-2.1-or-later')
groups=()
depends=('dconf'
         'gsettings-system-schemas')
makedepends=('git'
             'glib2-devel'
             'gobject-introspection'
             'meson')
provides=("${pkgname%-nofont}")
conflicts=("${pkgname%-nofont}")
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+$url.git#tag=$pkgver"
        '0001-Revert-default-font.patch')
noextract=()
sha256sums=('4a31bfb3cb4fbea5584330c322d3326bfa31243c2391413e8a47bf318795752a'
            '70823e18b0b35f698890cee555afee794e805750e798e0c76a1f0d456aaf587d')

prepare() {
  patch -d "$srcdir/$pkgname" -p1 -i "$srcdir/0001-Revert-default-font.patch"
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  # These schemas belong to gsettings-system-schemas
  rm "$pkgdir/usr/share/glib-2.0/schemas/org.gnome.desktop.enums.xml"
  rm "$pkgdir/usr/share/glib-2.0/schemas/org.gnome.system.locale.gschema.xml"
  rm "$pkgdir/usr/share/glib-2.0/schemas/org.gnome.system.location.gschema.xml"
  rm "$pkgdir/usr/share/glib-2.0/schemas/org.gnome.system.proxy.gschema.xml"
}

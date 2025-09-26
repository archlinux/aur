# Maintainer: Piroro-hs

pkgname=gsettings-desktop-schemas-nofont
pkgver=49.0
pkgrel=1
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
sha256sums=('21b149cddf6492bd10682daca6f1dab9bcc372c0d7dcdb5e981219af3faf89a5'
            '25972f235f5e47c9e8208370bdbefeb3a53409a0ad33ffd3f27ac4d8766d2f1f')

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

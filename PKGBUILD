# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-connections-git
_pkgname=connections
pkgver=42.beta.r0.g98d9c13
pkgrel=1
pkgdesc="Remote desktop client for the GNOME desktop environment"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/connections"
license=('GPL3')
depends=('gtk3' 'glib2' 'libhandy'  'gtk-vnc' 'libusb' 'freerdp' 'libxml2' 'gtk-frdp')
makedepends=('git' 'gobject-introspection' 'itstool' 'meson' 'vala')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname%-git}
  # Don't use legacy path for metainfo file
  sed -i "s/datadir'), 'appdata/datadir'), 'metainfo/" data/meson.build
  # Add categories to desktop file
  sed -i 's/Categories=GTK;/Categories=GNOME;GTK;Utility;RemoteAccess;Network;/' \
    data/org.gnome.Connections.desktop.in

}

build() {
  arch-meson ${_pkgname%-git} build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  # Remove unneeded development files
  rm -r "$pkgdir"/usr/include/gnome-connections/gtk-frdp \
        "$pkgdir"/usr/lib/gnome-connections/{girepository-1.0,pkgconfig} \
        "$pkgdir"/usr/share/gnome-connections/{gir-1.0,vapi}
}

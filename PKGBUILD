# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>

pkgname=gnome-bluetooth
pkgver=3.34.5
pkgrel=4
pkgdesc="GNOME Bluetooth Subsystem (legacy)"
url="https://wiki.gnome.org/Projects/GnomeBluetooth"
arch=(x86_64)
license=(GPL LGPL)
depends=(gtk3 libnotify bluez libcanberra systemd pulseaudio-bluetooth)
makedepends=(gobject-introspection gtk-doc docbook-xsl git meson)
checkdepends=(python-dbusmock)
provides=(libgnome-bluetooth.so)
_commit=736eadbfb693d9594371470ad83370d327df6f74  # tags/3.34.5^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-bluetooth.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd gnome-bluetooth
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gnome-bluetooth

  # Remove bluetooth-sendto, shipped in gnome-bluetooth-3.0
  sed -i "/'sendto'/d" meson.build
}

build() {
  arch-meson gnome-bluetooth build -D gtk_doc=true -D icon_update=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 et:

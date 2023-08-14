# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>

pkgname=gnome-bluetooth
pkgver=3.34.5
pkgrel=4
pkgdesc="GNOME Bluetooth Subsystem (legacy)"
url="https://wiki.gnome.org/Projects/GnomeBluetooth"
arch=(x86_64)
license=(
  GPL
  LGPL
)
depends=(
  bluez
  gtk3
  libcanberra
  libnotify
  pulseaudio-bluetooth
  systemd
)
makedepends=(
  docbook-xsl
  git
  gobject-introspection
  gtk-doc
  meson
)
checkdepends=(python-dbusmock)
provides=(libgnome-bluetooth.so)
_commit=736eadbfb693d9594371470ad83370d327df6f74  # tags/3.34.5^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-bluetooth.git#commit=$_commit")
b2sums=('SKIP')

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
  local meson_options=(
    -D gtk_doc=true
    -D icon_update=false
  )

  arch-meson gnome-bluetooth build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:

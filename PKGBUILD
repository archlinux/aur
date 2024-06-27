# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>

pkgname=gnome-bluetooth
pkgver=3.34.5+r16+g61cfff1c
pkgrel=2
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
  systemd
)
makedepends=(
  docbook-xsl
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
)
checkdepends=(python-dbusmock)
provides=(libgnome-bluetooth.so)
_commit=61cfff1cf33e195c254a9a80abee7b377a6d8d36  # gnome-3-34
source=("git+https://gitlab.gnome.org/GNOME/gnome-bluetooth.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd gnome-bluetooth
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gnome-bluetooth

  # Fix build with newer Meson
  git cherry-pick -n f02378b9d587b8b3295e4d0e0b477c850535df22
}

build() {
  local meson_options=(
    -D gtk_doc=true
    -D icon_update=false
    -D sendto=false
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

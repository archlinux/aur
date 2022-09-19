# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>

# shellcheck disable=SC2034
_pkgname="gnome-bluetooth"
pkgname="${_pkgname}-git"
pkgver=42.4+2+gc95fe4ad
pkgrel=1
pkgdesc="The GNOME Bluetooth Subsystem"
url="https://wiki.gnome.org/Projects/GnomeBluetooth"
arch=('x86_64' 'i686' 'pentium4')
license=(GPL LGPL)
depends=(gtk3
         libadwaita-git
         libnotify
         bluez
         libcanberra
         systemd-libs
         pipewire-pulse-git)
makedepends=(gobject-introspection
             gtk-doc
             docbook-xsl
             git
             systemd
             meson)
provides=(libgnome-bluetooth.so "${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || exit
  git describe --tags | sed 's/^GNOMEBT_V_//;s/_fixed//;s/_/./g;s/-/+/g'
}

build() {
  arch-meson "${_pkgname}" build -D gtk_doc=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

# shellcheck disable=SC2154
package() {
  DESTDIR="${pkgdir}" meson install -C build
}

# vim:set sw=2 et:

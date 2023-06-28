# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_pkgname=gnome-initial-setup
pkgname="${_pkgname}-git"
pkgver=44.0+31+g30e898d9
pkgrel=1
pkgdesc="Helps you to set up your OS when you boot for the first time"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/${_pkgname}"
license=('GPL')
depends=(
  accountsservice
  cairo
  fontconfig
  gcc-libs
  gdk-pixbuf2
  gdm
  geoclue
  geocode-glib-2
  glib2
  glibc
  gnome-desktop-4
  gnome-control-center
  gnome-keyring
  gnome-online-accounts
  gsettings-desktop-schemas
  gtk3
  gtk4
  json-glib
  krb5
  libadwaita
  libgdm
  libgnomekbd
  libgoa
  libgweather-4
  libibus
  libmalcontent
  libnma
  libnma-gtk4
  libpwquality
  librest
  libsecret
  malcontent
  pango
  polkit
  webkitgtk-6.0
)
makedepends=(
  git
  meson
)
optdepends=(
  'gnome-getting-started-docs: GNOME Welcome Tour'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
groups=(gnome gnome-git)
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"

  # Setup system user and group
  echo 'u gnome-initial-setup - "GNOME Initial Setup" /run/gnome-initial-setup' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"
  echo 'd /run/gnome-initial-setup 0700 gnome-initial-setup gnome-initial-setup -' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"
}

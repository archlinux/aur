# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_pkgname=gnome-settings-daemon
pkgname="${_pkgname}-git"
pkgver=44.1+28+gebdb3305
pkgrel=1
pkgdesc="GNOME Settings Daemon"
_gnome_git="https://gitlab.gnome.org/GNOME"
url="${_gnome_git}/${_pkgname}"
arch=(
  x86_64
  i686
  pentium4
  aarch64
  armv7h)
license=(GPL)
depends=(
  dconf
  gcr-4
  geoclue
  geocode-glib-2
  gnome-desktop
  gsettings-desktop-schemas
  gtk3
  libcanberra-pulse
  libgudev
  libgweather-4
  libnm
  libnotify
  librsvg
  libwacom
  nss
  pulseaudio
  pulseaudio-alsa
  systemd
  upower
)
makedepends=(
  docbook-xsl
  git
  libxslt
  meson
  python
  usbguard)
checkdepends=(
  python-dbusmock
  python-gobject
)
optdepends=('usbguard: USB protection support')
groups=(gnome gnome-git)
backup=(etc/xdg/Xwayland-session.d/00-xrdb)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}"
        "git+${_gnome_git}/libgnome-volume-control.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | \
    sed 's/^GNOME_SETTINGS_DAEMON_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd "${_pkgname}"

  git submodule init
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git -c protocol.file.allow=always submodule update
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
}

# vim:set sw=2 sts=-1 et:

# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gnome-settings-daemon-338
pkgver=3.38.2
pkgrel=3
pkgdesc="GNOME Settings Daemon"
url="https://gitlab.gnome.org/GNOME/gnome-settings-daemon"
conflicts=("gnome-settings-daemon")
provides=("gnome-settings-daemon=$pkgver")
replaces=("gnome-settings-daemon")
arch=(x86_64)
license=(GPL)
depends=(dconf gnome-desktop gsettings-desktop-schemas-338 libcanberra-pulse libnotify systemd-libs
         libwacom1 libwacom pulseaudio pulseaudio-alsa upower librsvg libgweather geocode-glib geoclue nss
         libgudev gtk3 libnm gcr)
makedepends=(xf86-input-wacom libxslt docbook-xsl python git meson usbguard)
checkdepends=(python-gobject python-dbusmock)
optdepends=('usbguard: USB protection support')
groups=(gnome-338)
backup=(etc/xdg/Xwayland-session.d/00-xrdb)
_commit=e9c5057315d5e3fbb90482bb054e250773aad9ab  # tags/GNOME_SETTINGS_DAEMON_3_38_2^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-settings-daemon.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
        "meson.patch")
sha256sums=('SKIP'
            'SKIP'
            '2de4a9e1673f85f70417927902eb4a01ddb403eac26515b4881e35978c2f980d')

pkgver() {
  cd gnome-settings-daemon
  git describe --tags | sed 's/^GNOME_SETTINGS_DAEMON_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd gnome-settings-daemon

  git submodule init
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git submodule update
  
  patch meson.build ../../meson.patch
}

build() {
  arch-meson gnome-settings-daemon build
  meson compile -C build
}

check() {
  # Check might fail without clean build env. Continue building in any case.
  meson test -C build --print-errorlogs || true
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gnome-settings-daemon-oldstable
pkgver=40.0.1
pkgrel=1
pkgdesc="GNOME Settings Daemon (oldstable version)"
url="https://gitlab.gnome.org/GNOME/gnome-settings-daemon"
conflicts=("gnome-settings-daemon")
provides=("gnome-settings-daemon=$pkgver")
replaces=("gnome-settings-daemon")
arch=(x86_64)
license=(GPL)
depends=(dconf gnome-desktop gsettings-desktop-schemas-oldstable libcanberra-pulse libnotify systemd libwacom
         pulseaudio pulseaudio-alsa upower librsvg libgweather geocode-glib geoclue nss libgudev
         gtk3 libnm gcr)
makedepends=(xf86-input-wacom libxslt docbook-xsl python git meson usbguard)
checkdepends=(python-gobject python-dbusmock)
optdepends=('usbguard: USB protection support')
groups=(gnome-oldstable)
backup=(etc/xdg/Xwayland-session.d/00-xrdb)
_commit=f33abac1de0c8cecd8ededa75200648c6470e406  # tags/tags/40.0.1^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-settings-daemon.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
        "fix_str-bool_comparison.patch")
sha256sums=('SKIP'
            'SKIP'
            'e12a423f16d68e6fd7fe9c2953b77c25aef85ca39d757f5e6debd53f266e0292')

pkgver() {
  cd gnome-settings-daemon
  git describe --tags | sed 's/^GNOME_SETTINGS_DAEMON_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd gnome-settings-daemon
  git apply -3 ../fix_str-bool_comparison.patch

  git submodule init
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git submodule update
}

build() {
  arch-meson gnome-settings-daemon build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

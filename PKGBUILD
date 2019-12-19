pkgname=gnome-settings-daemon-git
_pkgname=gnome-settings-daemon
pkgver=3.33.90+62+g7bf807de
pkgrel=1
pkgdesc="GNOME Settings Daemon"
url="https://gitlab.gnome.org/GNOME/gnome-settings-daemon"
arch=(x86_64)
license=(GPL)
depends=('dconf' 'gnome-desktop' 'gsettings-desktop-schemas' 'libcanberra-pulse' 'libnotify' 'systemd-libs' 'libwacom' 'pulseaudio' 'pulseaudio-alsa' 'upower' 'librsvg' 'libgweather' 'geocode-glib' 'geoclue2' 'nss' 'libgudev' 'gtk3-print-backends' 'libnm' 'gcr')
makedepends=('xf86-input-wacom' 'libxslt' 'docbook-xsl' 'python' 'git' 'meson')
checkdepends=('python-gobject' 'python-dbusmock')
provides=('gnome-settings-daemon')
conflicts=('gnome-settings-daemon')
source=("git+https://gitlab.gnome.org/GNOME/gnome-settings-daemon.git"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^GNOME_SETTINGS_DAEMON_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $_pkgname

  git submodule init
  git config --local submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
  git submodule update
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

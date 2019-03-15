# $Id$
# Maintainer: Sébastien Faucheux <faucheux.seb@gmail.com>

pkgname=gnome-settings-daemon-shutdown
pkgver=3.32.0
pkgrel=2
pkgdesc="GNOME Settings Daemon with shutdown button action"
url="https://gitlab.gnome.org/GNOME/gnome-settings-daemon"
arch=(x86_64)
license=(GPL)
depends=(dconf gnome-desktop gsettings-desktop-schemas libcanberra-pulse libnotify systemd-libs
         libwacom pulseaudio pulseaudio-alsa upower librsvg libgweather geocode-glib geoclue2 nss
         libgudev gtk3-print-backends libnm)
makedepends=(xf86-input-wacom libxslt docbook-xsl python git meson)
checkdepends=(python-gobject python-dbusmock)
groups=(gnome)
_commit=9381b6c2be1ae0e58a4adb5375f59e6765dd0276  # tags/GNOME_SETTINGS_DAEMON_3_32_0^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-settings-daemon.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
        shutdown.patch)

sha256sums=('SKIP'
            'SKIP'
            'cd2136653c24f85865b9011fdc3620448b771d9c50a7e7e16191c352ff02feda')
pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^GNOME_SETTINGS_DAEMON_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname

  git submodule init
  git config --local submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
  git submodule update
  patch -Np1 -i ../shutdown.patch
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

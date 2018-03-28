# $Id$
# Maintainer: Sébastien Faucheux <faucheux.seb@gmail.com>

pkgname=gnome-settings-daemon-shutdown
_pkgname=gnome-settings-daemon
pkgver=3.28.0+4+gef32315a
pkgrel=1
pkgdesc="The GNOME Settings daemon with shutdown button action"
arch=(x86_64)
license=(GPL)
depends=(dconf gnome-desktop gsettings-desktop-schemas libcanberra-pulse libnotify libsystemd
         libwacom pulseaudio pulseaudio-alsa upower librsvg libgweather geocode-glib geoclue2 nss
         libgudev gtk3-print-backends libnm)
makedepends=(xf86-input-wacom libxslt docbook-xsl python git meson)

url="https://git.gnome.org/browse/gnome-settings-daemon"
groups=(gnome)
provides=('gnome-settings-daemon')
conflicts=('gnome-settings-daemon')

_commit=ef32315a4142a60fc1defb940ba9306a6fb3a085  # master
source=("git+https://gitlab.gnome.org/GNOME/gnome-settings-daemon.git#commit=$_commit"
        "git+https://git.gnome.org/browse/libgnome-volume-control"
        shutdown.patch)

sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd $_pkgname
  git submodule init
  git config --local submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
  git submodule update
  patch -Np1 -i ../shutdown.patch
}

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^GNOME_SETTINGS_DAEMON_//;s/_/./g;s/-/+/g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  cd build
  # Needs python-dbusmock
  #meson test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

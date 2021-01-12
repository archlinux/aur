pkgname=tracker-miners-git
_pkgname=tracker-miners
pkgver=3.0.4
pkgrel=1
pkgdesc="Collection of data extractors for Tracker/Nepomuk"
url="https://wiki.gnome.org/Projects/Tracker"
arch=(x86_64)
license=(GPL)
depends=('tracker3' 'gst-plugins-base-libs' 'exempi' 'libexif' 'libcue' 'libgrss' 'libgsf'
         'libgxps' 'libiptcdata' 'libosinfo' 'poppler-glib' 'totem-plparser' 'giflib'
         'libgexiv2' 'gupnp-dlna' 'upower' 'libseccomp' 'libnm')
makedepends=('git' 'meson' 'vala' 'asciidoc')
checkdepends=('python-gobject' 'gst-plugins-good' 'gst-plugins-base' 'gst-libav')
provides=('tracker3-miners')
conflicts=('tracker3-miners')
source=("git+https://gitlab.gnome.org/GNOME/tracker-miners.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  # Intermittent test failures: https://gitlab.gnome.org/GNOME/tracker-miners/-/issues/79
  dbus-run-session meson test -C build --print-errorlogs -t 3 || :
}

package() {
  depends+=(libtracker-sparql-3.0.so)

  DESTDIR="$pkgdir" meson install -C build
}

pkgname=tracker-miners-git
_pkgname=tracker-miners
pkgver=2.99.5+5+gafb650198
pkgrel=1
pkgdesc="Collection of data extractors for Tracker/Nepomuk"
url="https://wiki.gnome.org/Projects/Tracker"
arch=(x86_64)
license=(GPL)
depends=('tracker' 'gst-plugins-base-libs' 'exempi' 'flac' 'libexif' 'libcue' 'libgrss' 'libgsf' 'libgxps' 'libiptcdata'
         'libosinfo' 'libvorbis' 'poppler-glib' 'totem-plparser' 'giflib' 'libgexiv2' 'gupnp-dlna' 'upower'
         'libseccomp')
makedepends=('intltool' 'git' 'meson' 'vala')
checkdepends=('python-gobject' 'gst-plugins-good' 'gst-plugins-base' 'gst-libav')
provides=('tracker-miners')
conflicts=('tracker-miners')
source=("git+https://gitlab.gnome.org/GNOME/tracker-miners.git")
sha512sums=('SKIP')

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

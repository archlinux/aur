pkgname=tracker-git
_pkgname=tracker
pkgver=2.99.5+6+g305218ee1
pkgrel=1
pkgdesc="Desktop-neutral user information store, search tool and indexer"
url="https://wiki.gnome.org/Projects/Tracker"
arch=(x86_64)
license=(GPL)
depends=('sqlite' 'icu' 'glib2' 'libffi' 'util-linux' 'libstemmer' 'libseccomp' 'libsoup'
         'json-glib' 'upower' 'libnm')
makedepends=('gobject-introspection' 'vala' 'git' 'gtk-doc' 'bash-completion' 'meson')
checkdepends=('python-gobject' 'python-dbus')
provides=('tracker' libtracker-sparql-3.0.so)
conflicts=('tracker')
source=("git+https://gitlab.gnome.org/GNOME/tracker.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/_/./g;s/-/+/g'
}

build() {
  arch-meson $_pkgname build -D docs=true
  meson compile -C build
}

check() {
  dbus-run-session meson test -C build --print-errorlogs -t 3
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

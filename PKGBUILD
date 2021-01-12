pkgname=tracker-git
_pkgname=tracker
pkgver=3.1.0.alpha
pkgrel=1
pkgdesc="Desktop-neutral user information store, search tool and indexer"
url="https://wiki.gnome.org/Projects/Tracker"
arch=(x86_64)
license=(GPL)
depends=('sqlite' 'icu' 'glib2' 'libffi' 'util-linux' 'libstemmer' 'libseccomp' 'libsoup'
         'json-glib')
makedepends=('gobject-introspection' 'vala' 'git' 'gtk-doc' 'bash-completion' 'meson'
             'asciidoc' 'systemd')
checkdepends=('python-gobject' 'python-dbus')
provides=('tracker3' 'libtracker-sparql-3.0.so')
conflicts=('tracker3')
source=("git+https://gitlab.gnome.org/GNOME/tracker.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/_/./g;s/-/+/g'
}

build() {
  arch-meson $_pkgname build --buildtype debug
  meson compile -C build
}

check() {
  TRACKER_DEBUG=sqlite,sql-statements dbus-run-session meson test -C build --print-errorlogs -t 3
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

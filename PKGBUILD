pkgname=gnome-notes-git
_pkgname=gnome-notes
pkgver=40.0+6+g8491d75
pkgrel=1
pkgdesc="Write out notes, every detail matters"
url="https://wiki.gnome.org/Apps/Notes"
arch=(x86_64)
license=(GPL)
depends=('tracker3' 'webkit2gtk' 'gnome-online-accounts' 'evolution-data-server'
         'libhandy')
makedepends=('evolution' 'python' 'appstream-glib' 'yelp-tools' 'git' 'meson')
provides=("bijiben=$pkgver" 'gnome-notes')
conflicts=('bijiben' 'gnome-notes')
source=("git+https://gitlab.gnome.org/GNOME/gnome-notes.git"
        "git+https://gitlab.gnome.org/GNOME/libgd.git")
b2sums=('SKIP'
        'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^BIJIBEN_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $_pkgname

  git submodule init
  git submodule set-url subprojects/libgd "$srcdir/libgd"
  git submodule update
}

build() {
  arch-meson $_pkgname build -D update_mimedb=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

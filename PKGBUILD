# Maintainer: Sam Dolt <sam@dolt.ch>

pkgname=termbox-glib-git
pkgver=0.0.1.r12.ab2245d
pkgrel=1
pkgdesc='GLib/GObject wrapper around termbox2'
arch=('x86_64')
url='https://dolt.ch/projects/termbox-glib/'
license=('LGPL-2.1-or-later AND MIT')
depends=('glib2>=2.84')
makedepends=(
  'git'
  'meson>=1.7.0'
  'ninja'
  'pkgconf'
  'glib2-devel'
  'gobject-introspection'
  'vala'
)
provides=('termbox-glib' 'libtermbox-glib.so')
conflicts=('termbox-glib')
source=(
  'termbox-glib::git+https://git.sr.ht/~samdolt/termbox-glib'
  'termbox2::git+https://github.com/termbox/termbox2.git'
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd termbox-glib
  printf '0.0.1.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd termbox-glib
  git submodule init
  git config submodule.termbox2.url "$srcdir/termbox2"
  git -c protocol.file.allow=always submodule update
}

build() {
  export XDG_CACHE_HOME="$srcdir/.cache"

  arch-meson termbox-glib build \
    -Dwerror=false \
    -Dintrospection=enabled \
    -Ddocs=false \
    -Dexamples=false \
    -Dtests=true \
    -Dvaladoc_deps=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 termbox-glib/termbox2/LICENSE "$pkgdir/usr/share/licenses/$pkgname/MIT"
  install -Dm644 termbox-glib/NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}

# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=girens
pkgver=1.1.10.r14.g448e92d
pkgrel=1
pkgdesc="Girens is a Plex GTK client for playing movies, TV shows and music from your Plex library"
arch=('x86_64')
url="https://gitlab.gnome.org/tijder/girens"
license=('GPL3')
depends=('libadwaita' 'org.freedesktop.secrets' 'plex-remote'
  'python-plexapi' 'libass' 'python-opengl' 'python-mpv'
  'fribidi' 'ffmpeg' 'python-mpv' 'python-idna' 'python-certifi'
  'python-chardet' 'python-urllib3' 'python-requests'
  'python-tqdm' 'python-six' 'python-websocket-client'
  'python-gobject' 'python-cairo')
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
_commit=448e92dd0d30a025e41d6c5977dc0c71fc69c897  # Prepare for realese 2.0.0
source=($pkgname::git+$url.git#commit=$_commit)
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local meson_options=(
    --libdir=lib
  )

  arch-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

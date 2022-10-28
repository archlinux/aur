# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=girens-git
pkgver=1.1.10.r14.g448e92d
pkgrel=1
pkgdesc="Girens is a Plex GTK client for playing movies, TV shows and music from your Plex library"
arch=('x86_64')
url="https://gitlab.gnome.org/tijder/girens"
license=('GPL3')
depends=('libadwaita' 'org.freedesktop.secrets' 'mpv' 'plex-remote-git' 'python-plexapi' 'libass' 'python-opengl' 'python-mpv' 'fribidi' 'ffmpeg' 'python-mpv' 'python-idna' 'python-certifi' 'python-chardet' 'python-urllib3' 'python-requests' 'python-tqdm' 'python-six' 'python-websocket-client')
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local meson_options=(
    --libdir=lib
  )

  arch-meson "${pkgname%-git}" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

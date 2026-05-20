# Maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=libtape-git
pkgver=r140.3f640f3
pkgrel=1
pkgdesc="Tape library for your Cassette application (Unofficial Yandex Music SDK)"
arch=(aarch64 i686 x86_64)
url="https://altlinux.space/rirusha/${pkgname%-git}"
license=(GPL-3.0-or-later)
depends=(
  glib2
  glibc
  gst-plugins-base-libs
  gstreamer
  json-glib
  libapi-base-git
  libgee
  libsoup3
  libxml2
  sqlite
)
makedepends=(
  git
  gobject-introspection
  meson
  vala
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!debug)
source=("${pkgname%-git}::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  sed -i -e 's/(Error e)/(GLib.Error e)/g' \
         -e 's/catch (Error e)/catch (GLib.Error e)/g' \
            "$srcdir/libtape/lib/yandex-music/client.vala"
}

build() {
  arch-meson ${pkgname%-git} build
  meson configure build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

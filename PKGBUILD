# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>

pkgname=gtuber
pkgver=r452.468bf02
pkgrel=1
_commit=468bf02a8adcf69b1bd6dd7b5dbcdcc0bfdb6922
pkgdesc="C library to fetch media info from websites (bilibili, lbry, niconico, reddit, twitch, youtube)"
arch=(x86_64)
url="https://github.com/Rafostar/gtuber"
license=('LGPL-2.1-only')
depends=(
  glib2
  glibc
  gstreamer
  json-glib
  libsoup3
  libxml2
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  meson
  vala
)
provides=(gst-plugins-gtuber=$pkgver)
source=("git+https://github.com/Rafostar/gtuber.git#commit=$_commit")
b2sums=('b8d0dc56c9797a3323460eb947814c3b4f8bd459729bb4cc2c293e071d322fc9955923dc81f36513dc3d1e3327f1ee0c131a2e02a36d8d07768454d007032ccf')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  local meson_options=(
    # Gtuber
    -D introspection=enabled
    -D vapi=enabled
    -D doc=true
    -D tests=false # broken

    # Bin
    -D gtuber-dl=enabled

    # GStreamer
    -D gst-gtuber=enabled

    # Utils
    -D utils-common=enabled
    -D utils-json=enabled
    -D utils-xml=enabled
    -D utils-youtube=enabled

    # Plugins
    -D bilibili=enabled
    -D crunchyroll=disabled # broken
    -D invidious=disabled # broken
    -D lbry=enabled
    -D niconico=enabled
    -D peertube=disabled # broken
    -D piped=disabled # broken
    -D reddit=enabled
    -D twitch=enabled
    -D youtube=enabled
  )

  arch-meson gtuber build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir" --no-rebuild	
}


# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>

pkgname=gtuber
pkgver=r449.adda1ed
pkgrel=1
_commit=adda1edbfd4e9f80abb2d5d0e59bee175d958f64
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
b2sums=('673a7a8252c0546c40abde7ec7eba2aedb2f738f4ca7ceb21b9fc867fff4ff67706da18183995ba0a6da74b210a6b027a340c48fdae9ab9418cad91ec8b72543')

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


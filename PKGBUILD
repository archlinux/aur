# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>

pkgname=gtuber
pkgver=r446.f5a64d4
pkgrel=1
_commit=f5a64d442c18ae2fa732a851ccb4859c8a45d944
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
b2sums=('f98e190f38b315e87bfcacf00b196c5acd0d6d87db00e44e97d669283295a5594b923f2ec2f13558b78a65c7a044b5abdb2554623fe55f464fc1bc9eb5cbd2bd')

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


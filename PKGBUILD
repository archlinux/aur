# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Original maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=footage
pkgname="$_pkgname-git"
pkgver=r144.g41a7c77
pkgrel=1
pkgdesc="Polish your videos"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/adhami3310/Footage"
license=('GPL-3.0-only')
depends=('a52dec' 'fdkaac' 'ffmpeg' 'gst-editing-services' 'gst-plugin-gif' 'gst-plugin-gtk4'
         'gst-plugins-bad' 'gst-plugins-ugly' 'gstreamer-svt-av1-git' 'gstreamer-vaapi'
         'libadwaita' 'libmpeg2' 'svt-av1' 'vo-aacenc' 'x264' 'x265')
makedepends=('blueprint-compiler' 'cargo' 'git' 'meson')
checkdepends=('appstream-glib')
conflicts=(footage)
provides=(footage)
source=(
  "git+$url.git"
)
sha256sums=(
  'SKIP'
)
_srcdir="Footage"

pkgver() {
    cd "${srcdir}/${_srcdir}" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_srcdir}" || exit
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson Footage build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}

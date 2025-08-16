# Maintainer: robertfoster

pkgname=recordbox
pkgver=0.10.4 # renovate: datasource=git-tags depName=https://codeberg.org/edestcroix/Recordbox
pkgrel=1
pkgdesc='A music player and library browser designed primarily to be as simple as possible, and tailored specifically to browsing and playing albums, rather than tracks or playlists.'
arch=(x86_64)
url="https://codeberg.org/edestcroix/Recordbox"
license=(GPL-3.0-only)
depends=(
  dconf
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  graphene
  gst-plugins-bad-libs
  gst-plugins-base
  gst-plugins-base-libs
  gst-plugins-good
  gstreamer
  gtk4
  hicolor-icon-theme
  libadwaita
  pango
)
makedepends=(
  appstream
  git
  meson
  rust
)
optdepends=(
  'gst-libav: Extra media codecs'
  'gst-plugins-bad: Extra media codecs'
  'gst-plugins-ugly: Extra media codecs'
)
source=("${pkgname}-${pkgver}::https://codeberg.org/edestcroix/Recordbox/archive/v${pkgver}.tar.gz")

prepare() {
  cd "${pkgname}"

  CARGO_HOME="$srcdir/build/cargo-home" \
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  arch-meson "${pkgname}" build

  CARGO_PROFILE_RELEASE_LTO=true \
    CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1 \
    CARGO_PROFILE_RELEASE_DEBUG=2 \
    CARGO_PROFILE_RELEASE_STRIP=false \
    meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}" --no-rebuild
}

sha256sums=('6344364bd37af13cd69be4a3d884f69676ceaf16b990615f64b7629c4278c71b')

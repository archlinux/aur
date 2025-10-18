# Maintainer: a821 at (nospam) mail de
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=librsvg-git
pkgver=2.61.1.r39.g569c2c2b7
pkgrel=1
epoch=2
pkgdesc="SVG rendering library"
url="https://wiki.gnome.org/Projects/LibRsvg"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  cairo
  dav1d
  freetype2
  gcc-libs
  glib2
  glibc
  harfbuzz
  libxml2
  pango
)
makedepends=(
  cargo-c
  gi-docgen
  git
  gobject-introspection
  llvm
  meson
  python-docutils
  rust
  vala
)
provides=(librsvg-${pkgver%%.*}.so "${pkgname%-git}" "${pkgname%-git}-docs")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.gnome.org/GNOME/librsvg.git")
sha256sums=('SKIP')

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

pkgver() {
  cd "${pkgname%-git}"
  git describe --tags | sed -r 's,^[^0-9]*,,;s,([0-9]*-g),r\1,;s,[-_],.,g'
}

prepare() {
  cd "${pkgname%-git}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  local meson_options=(
    -D avif=enabled
    -D pixbuf-loader=disabled
  )

  arch-meson librsvg build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir" --no-rebuild
}

# vim:set sw=2 et:

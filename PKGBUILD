# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Igor Saric <karabaja4@gmail.com>

pkgbase=librsvg-noglycin
pkgname=(
  librsvg-noglycin
  librsvg-noglycin-docs
)
pkgver=2.61.3
pkgrel=2
pkgdesc="SVG rendering library, compatible with gdk-pixbuf2-noglycin"
url="https://wiki.gnome.org/Projects/LibRsvg"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  cairo
  dav1d
  freetype2
  gcc-libs
  gdk-pixbuf2-noglycin
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
checkdepends=(ttf-dejavu)
source=(
  # librsvg tags use SSH signatures which makepkg doesn't understand
  "git+https://gitlab.gnome.org/GNOME/librsvg.git#tag=$pkgver"
)
b2sums=('1595786064565bb00c14ff6a3d6555b0cef5eedb12f4c5dde47aa69d66caaeb3f5cd257c1004d7bb5830456545cfde02998104fb80317749bb7ca7cb886404b4')

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

prepare() {
  cd librsvg
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  local meson_options=(
    -D avif=enabled
    -D pixbuf-loader=enabled
  )

  arch-meson librsvg build "${meson_options[@]}"
  meson compile -C build
}

package_librsvg-noglycin() {
  provides=(
    librsvg-${pkgver%%.*}.so
    librsvg
  )
  conflicts=(
    librsvg
  )
  install=librsvg-noglycin.install

  meson install -C build --destdir "$pkgdir" --no-rebuild

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_librsvg-noglycin-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  provides=(
    librsvg-docs
  )
  conflicts=(
    librsvg-docs
  )

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:

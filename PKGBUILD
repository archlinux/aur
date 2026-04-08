# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Igor Saric <karabaja4@gmail.com>

pkgbase=librsvg-noglycin
pkgname=(
  librsvg-noglycin
  librsvg-noglycin-docs
)
pkgver=2.62.1
pkgrel=1
pkgdesc="SVG rendering library, compatible with gdk-pixbuf2-noglycin"
url="https://gitlab.gnome.org/GNOME/librsvg"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  cairo
  dav1d
  fontconfig
  freetype2
  gdk-pixbuf2-noglycin
  glib2
  glibc
  harfbuzz
  libgcc
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
b2sums=('b35a6b9230ca8c4ddfbdb8ed602be388cd8c4fdd1f8af2d70096f4f039b1401ac19e9ffb6b774998e8e6a641d27d1cb5e32ec6c28d295e3fc8fa506de3e9640d')

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

prepare() {
  cd librsvg
  cargo fetch --locked --target host-tuple
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

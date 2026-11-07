# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Igor Saric <karabaja4@gmail.com>

pkgbase=librsvg-noglycin
pkgname=(
  librsvg-noglycin
  librsvg-noglycin-docs
)
pkgver=2.63.4
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
b2sums=('9c55c6161eee4cc5762c3a19c229b27da9169d599e57fc3ec72012fe0825038b37f6355ffd422e15613f9aa5548e1a6c7a11106eb2acdf34d0f6623487303cd1')

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

  meson install -C build --no-rebuild --destdir "$pkgdir"

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

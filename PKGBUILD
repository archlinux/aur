# Maintainer: CPT-Dawn <ping@cptdawn.dev>
#
# Template for the zenith-bar AUR package. The release workflow fills in
# pkgver, pkgrel and sha256sums with .github/scripts/generate_aur_files.sh.
pkgname=zenith-bar
_reponame=Zenith
pkgver=2.4.0
pkgrel=1
pkgdesc="The lightest beautiful status bar for Wayland: GTK4 glass themes at zero idle CPU, for Hyprland, Sway, niri and river"
arch=('x86_64')
url="https://github.com/CPT-Dawn/Zenith"
license=('MIT')
depends=(
  'libgcc'
  'glib2'
  'glibc'
  'graphene'
  'gtk4>=1:4.22'
  'gtk4-layer-shell'
  'libsoup3'
  'pango'
)
makedepends=('cargo')
optdepends=('ttf-inter: the recommended UI font'
            'hoarder: clipboard history for the clipboard module')
options=('!lto')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('379d4e08c958cbf8941b3acdc4e987dbb80667f8f777b34d67219616c09fc387')

prepare() {
  cd "${_reponame}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "${_reponame}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${_reponame}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "${_reponame}-${pkgver}"
  install -Dm755 target/release/zenith-bar "${pkgdir}/usr/bin/zenith-bar"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# Maintainer: CPT-Dawn <ping@cptdawn.dev>
#
# Template for the zenith-bar AUR package. The release workflow fills in
# pkgver, pkgrel and sha256sums with .github/scripts/generate_aur_files.sh.
pkgname=zenith-bar
_reponame=Zenith
pkgver=2.3.1
pkgrel=1
pkgdesc="The lightest beautiful status bar for Wayland"
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
  'pango'
)
makedepends=('cargo')
optdepends=('ttf-inter: the recommended UI font'
            'hoarder: clipboard history for the clipboard module')
options=('!lto')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7cd523be4f8d8497671aaaab7dac98259f8bea633e1fbc86ce89eaf87f67c23f')

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

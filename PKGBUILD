# Maintainer: CPT-Dawn <ping@cptdawn.dev>
#
# Template for the zenith-bar AUR package. The release workflow fills in
# pkgver, pkgrel and sha256sums with .github/scripts/generate_aur_files.sh.
pkgname=zenith-bar
_reponame=Zenith
pkgver=2.0.0
pkgrel=1
pkgdesc="The lightest beautiful status bar for Wayland"
arch=('x86_64')
url="https://github.com/CPT-Dawn/Zenith"
license=('MIT')
depends=(
  'libgcc'
  'glib2'
  'glibc'
  'gtk4>=1:4.22'
  'gtk4-layer-shell'
  'pango'
)
makedepends=('cargo')
optdepends=('ttf-inter: the recommended UI font')
options=('!lto')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b165d4de5853a7d7b7ee437cc1e2c556bbfb76b9a9124e47b784162e62de094e')

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

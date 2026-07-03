# Maintainer: Sadrach34 <https://github.com/Sadrach34>
pkgname=sdrx-mimic-git
_pkgname=SDRX-Mimic
pkgver=r1.0000000
pkgrel=1
pkgdesc="TUI Markdown vault editor for the terminal, compatible with Obsidian vaults, extensible with Lua/Rhai plugins"
arch=('x86_64' 'aarch64')
url="https://github.com/Sadrach34/SDRX-Mimic"
license=('MIT')
optdepends=(
  'xclip: system clipboard support on X11'
  'xsel: alternative system clipboard support on X11'
  'wl-clipboard: system clipboard support on Wayland'
)
makedepends=('git' 'cargo')
provides=('sdrx-mimic' 'mmc')
conflicts=('sdrx-mimic')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  rm -rf target
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/mmc" "${pkgdir}/usr/bin/mmc"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "EXTENSIONS.md" "${pkgdir}/usr/share/doc/${pkgname}/EXTENSIONS.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

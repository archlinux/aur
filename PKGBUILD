# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=modder-rs-git
pkgver=r31.4424186
pkgrel=1
pkgdesc="A practical TUI to manage and install mods for Minecraft"
arch=('x86_64' 'aarch64')
url="https://github.com/JayanAXHF/modder-rs"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
makedepends=('cargo' 'git')
provides=("modder-rs")
conflicts=("modder-rs")
options=('!lto')
source=("modder-rs::git+https://github.com/JayanAXHF/modder-rs.git")
sha256sums=('SKIP')

pkgver() {
  cd "modder-rs"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "modder-rs"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "modder-rs"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export PKG_CONFIG_PATH=/usr/lib/openssl-3/pkgconfig
  export CURSEFORGE_API_KEY="${CURSEFORGE_API_KEY:-}"
  cargo build --frozen --release
}

package() {
  cd "modder-rs"
  install -Dm755 "target/release/modder" -t "${pkgdir}/usr/bin"
  install -Dm755 "target/release/modder_tui" -t "${pkgdir}/usr/bin"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wopr_tui_2026-git
pkgver=r29.13cb3d1
pkgrel=1
pkgdesc="A WarGames-inspired Cold War simulation TUI with AI-powered scenarios, DEFCON escalation"
arch=('x86_64' 'aarch64')
url="https://github.com/ankurCES/WOPR_TUI_2026"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "target/release/wopr-2026" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

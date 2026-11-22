# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=thardians-git
pkgver=r24.08d89a3
pkgrel=1
pkgdesc="Space Invaders for the terminal"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/thustle/thardians-rs"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
provides=("thardians")
conflicts=("thardians")
options=('!lto')
source=("thardians::git+https://gitlab.com/thustle/thardians-rs.git")
sha256sums=('SKIP')

pkgver() {
  cd "thardians"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "thardians"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "thardians"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "thardians"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "thardians"
  install -Dm755 "target/release/thardians-rs" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

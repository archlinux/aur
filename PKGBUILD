# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gtm-tui-git
pkgver=r874.ced137c
pkgrel=1
pkgdesc="Feature rich audio player built for terminal enthusiasts"
arch=('x86_64' 'aarch64')
url="https://github.com/craftty-org/gtm"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
conflicts=('gtm-bin')
options=('!lto')
source=("gtm::git+https://github.com/craftty-org/gtm.git")
sha256sums=('SKIP')

pkgver() {
  cd "gtm"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "gtm"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "gtm"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "gtm"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen -- --skip mixer_
}

package() {
  cd "gtm"
  install -Dm755 "target/release/gtm" -t "${pkgdir}/usr/bin"
  install -Dm755 "target/release/gtmd" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

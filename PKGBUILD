# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=proxyjail-git
pkgver=r3.f83727d
pkgrel=1
pkgdesc="Proxychains alternative built with Rust and eBPF"
arch=('x86_64')
url="https://github.com/erfanara/proxyjail"
license=('LicenseRef-unknown')
depends=('glibc' 'libgcc' 'libelf' 'zlib')
makedepends=('cargo' 'clang' 'git' 'libbpf' 'linux-api-headers')
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
  cargo build --frozen --release -p proxyjail-cli --features ebpf
}

check() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --workspace
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "target/release/proxyjail-cli" "${pkgdir}/usr/bin/proxyjail"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

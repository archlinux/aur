pkgname=v6asm-git
pkgver=2026.07.22.r12.gb73c12c
pkgrel=1
pkgdesc="CLI Intel 8080/Z80 assembler and FDD image tool for Vector-06c. Git version"
arch=('x86_64')
url="https://github.com/parallelno/v6asm"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
provides=('v6asm' 'v6fdd')
conflicts=('v6asm' 'v6fdd')
options=('!debug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin/" target/release/v6asm target/release/v6fdd
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" README.md
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" docs/*.md
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

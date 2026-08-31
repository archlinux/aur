# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Pig Fang <g-plane@hotmail.com>
# Contributor: 欠陥電気 <misaka13514@gmail.com>

pkgname=pnpm-shell-completion
pkgdesc='Complete your pnpm command fastly'
pkgver=0.5.5
pkgrel=2
url='https://github.com/g-plane/pnpm-shell-completion'
arch=(aarch64 armv7h i486 i686 pentium4 riscv64 x86_64)
license=('MIT')
makedepends=('cargo')
depends=('libgcc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('b6a8006927862682a4758df67b635d84871a2dce65fb3a59dc7bcd33aebf22c052d9e5c79364851e274272609e36208135b6c4a36a5b0a02cddb8e8228431830')

prepare() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"

  export CARGO_PROFILE_RELEASE_STRIP=false
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --all-features --release
}

check() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features

  # just check if the final binary works
  FEATURE=pnpm_cmd target/release/pnpm-shell-completion test command
}

package() {
  cd "${pkgname}-${pkgver}"

  install -vD -t "${pkgdir}/usr/bin" \
    -m755 target/release/pnpm-shell-completion
  install -vD -m644 pnpm-shell-completion.plugin.zsh \
    -T "${pkgdir}/usr/share/zsh/plugins/pnpm-shell-completion/pnpm-shell-completion.zsh"
  install -vD -t "${pkgdir}/usr/share/fish/vendor_completions.d" \
    -m644 pnpm.fish
  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    -m644 LICENSE
}

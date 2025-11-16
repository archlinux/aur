# Maintainer: Jason Nader <jason.nader@protonmail.com>

pkgname=dyna-git
pkgver=0.1.1.r13.g96545ad
pkgrel=3
pkgdesc='Convert a colorscheme from one terminal emulator to another.'
arch=('x86_64')
url='https://git.sr.ht/~grtcdr/dyna'
license=('MIT')
makedepends=('git' 'cargo')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

prepare() {
  cd "${pkgname%-*}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  cd "${pkgname%-*}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname%-*}"
  install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${pkgname%-*}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE"
}

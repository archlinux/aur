# Maintainer: Jasmeet (Jazz) Bhatia
pkgname=jerc
pkgver=0.6.63
pkgrel=1
pkgdesc='Keyboard-driven terminal email client written in Rust'
arch=('x86_64')
url='https://github.com/HiFiveJazz/jerc'
license=('GPL-3.0-only')

depends=('ca-certificates')
makedepends=('cargo' 'rust')
optdepends=(
  'poppler: render PDF attachment previews with pdftoppm'
  'xdg-utils: open links in the default browser'
)

# ring's C/assembly objects cannot be linked with makepkg's GCC LTO flags
# when Rust links the final executable using lld.
options=('!lto')

conflicts=('jerc-bin')

source=(
  "${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)

# Replace after publishing v0.6.1 using updpkgsums.
sha256sums=('4377430962d6d8a2c9c382bb5a372785d340ba035e2dd2576ac01a60ae63b17d')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --release --frozen
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 target/release/jerc \
    "${pkgdir}/usr/bin/jerc"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/jerc/LICENSE"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/jerc/README.md"

  install -Dm644 config.example.toml \
    "${pkgdir}/usr/share/doc/jerc/config.example.toml"

  if [[ -d licenses ]]; then
    install -d "${pkgdir}/usr/share/licenses/jerc"
    cp -a licenses/. "${pkgdir}/usr/share/licenses/jerc/"
  fi
}

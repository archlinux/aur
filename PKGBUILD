# Maintainer: Katie Varkony (tristanandlucky@gmail.com)

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN
export RUSTC_BOOTSTRAP=1

: ${_commit=}

_pkgname="nbtworkbench"
pkgname="$_pkgname-git"
pkgver=1.6.2.r27.g6660f94
pkgrel=1
pkgdesc="A modern NBT (Minecraft's Named Binary Tags) Editor written in Rust."
url='https://github.com/RealRTTV/nbtworkbench'
license=('MPL-2.0')
arch=('x86_64')

depends=('gcc-libs')
makedepends=('cargo' 'git')

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git${_commit:+#commit=$_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"

  # compile faster
  sed -E \
    -e 's&^(opt-level) = .*$&\1 = 2&' \
    -e 's&^(codegen-units) = .*$&\1 = 16&' \
    -e 's&^(lto) = .*$&&' \
    -i "Cargo.toml"

  # warn instead of error
  sed -E -e 's&\b(deny|forbid)\(&warn(&' -i src/main.rs

  # continue
  cargo update
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgsrc"
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgsrc"
  RUST_BACKTRACE=1 cargo test --frozen --all-features
}

package() {
  cd "$_pkgsrc"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/nbtworkbench"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

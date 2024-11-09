# Maintainer: Levi Zim (kxxt) <rsworktech@outlook.com>
_pkgname=aya-tool
pkgname=$_pkgname-git
pkgver=0.1.0+aya.0.13.1.r3.ge3bfeb9
pkgrel=1
pkgdesc="tool for inspection and simple manipulation of eBPF programs and maps"
arch=(x86_64 aarch64 riscv64)
url="https://aya-rs.dev/book/aya/aya-tool/"
conflicts=('aya-tool-bin' 'aya-tool')
provides=('aya-tool')
license=('MIT OR Apache-2.0')
depends=('rust-bindgen' 'bpf')
makedepends=('cargo' 'git' 'jq')
source=(
    # Source
    "git+https://github.com/aya-rs/aya"
)
b2sums=('SKIP')

pkgver() {
  cd aya
  # aya-tool version
  cd "$_pkgname"
  local _aya_tool_ver="$(cargo metadata --format-version 1 --no-deps | jq -r '.packages[] | select(.name == "aya-tool") | .version')"
  cd ..
  # Upstream does not publish tags for aya-tool. Thus aya version tags are used
  local _aya_describe="$(git describe --long --tags --abbrev=7 --match="aya-v*" | sed 's/^aya-v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
  echo "$_aya_tool_ver+aya.$_aya_describe"
}

prepare() {
  cd "aya/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "aya/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "aya/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "aya/$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}

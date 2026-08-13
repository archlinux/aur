# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>

pkgname=vite-plus-git
pkgver=0.2.9.r2.858ed05fdb
pkgrel=1
pkgdesc="The Unified Toolchain for the Web (git)"
arch=("x86_64" "aarch64")
url="https://github.com/voidzero-dev/vite-plus"
license=("MIT")
depends=("glibc" "gcc-libs")
makedepends=("cargo" "rustup" "git")
provides=("vite-plus")
conflicts=("vite-plus-bin" "vite-plus")
options=("!debug" "!lto")

source=("git+https://github.com/voidzero-dev/vite-plus.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/vite-plus"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

_get_toolchain() {
  grep -E '^[[:space:]]*channel[[:space:]]*=' rust-toolchain.toml |
    sed 's/.*=[[:space:]]*"\(.*\)"/\1/'
}

prepare() {
  cd "$srcdir/vite-plus"

  # Clone vendored rolldown crates at the pinned commit for Cargo workspace
  # resolution (mirrors what sync-remote-deps.ts does).
  local rolldown_hash
  rolldown_hash=$(grep -A5 '"rolldown"' packages/tools/.upstream-versions.json |
    grep '"hash"' | cut -d'"' -f4)
  if [[ -n "$rolldown_hash" ]]; then
    mkdir -p rolldown
    git -C rolldown init -q
    git -C rolldown remote add origin https://github.com/rolldown/rolldown.git
    git -C rolldown fetch origin "$rolldown_hash" --depth 1 -q
    git -C rolldown checkout FETCH_HEAD -q
    rm -rf rolldown/.git
  fi

  local toolchain
  toolchain=$(_get_toolchain)
  rustup install "$toolchain"
  export RUSTUP_TOOLCHAIN="$toolchain"
  cargo fetch --locked --target "$(rustc -vV | grep host | sed 's/host: //')"
}

build() {
  cd "$srcdir/vite-plus"
  local toolchain
  toolchain=$(_get_toolchain)
  export RUSTUP_TOOLCHAIN="$toolchain"
  cargo build --release --frozen -p vp_global_cli
}

package() {
  cd "$srcdir/vite-plus"
  install -Dm755 target/release/vp "$pkgdir/usr/bin/vp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

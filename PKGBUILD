# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>

pkgname=vite-plus-git
pkgver=0.2.9.r7.97d7b62675
pkgrel=1
pkgdesc="The Unified Toolchain for the Web (git)"
arch=("x86_64" "aarch64")
url="https://github.com/voidzero-dev/vite-plus"
license=("MIT")
# nodejs: JS CLI half of the hybrid launcher runs under node
depends=("glibc" "gcc-libs" "nodejs")
# npm: resolves the JS CLI dependency closure in prepare()
makedepends=("cargo" "rustup" "git" "npm")
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

  # JS CLI dependency closure — install the npm package at the version
  # declared in the git HEAD's packages/cli/package.json (tracks upstream
  # without a hardcoded pin; fails loudly if the version isn't published yet).
  local jsver
  jsver=$(sed -n 's/.*"version": *"\([^"]*\)".*/\1/p' packages/cli/package.json)
  npm install --prefix "$srcdir/js-deps" --omit=dev --no-audit --no-fund \
    --cache "$srcdir/npm-cache" \
    "vite-plus@${jsver}"

  # Clone vendored rolldown crates at the pinned commit for Cargo workspace
  # resolution (mirrors what sync-remote-deps.ts does).
  local rolldown_hash
  rolldown_hash=$(grep -A5 '"rolldown"' packages/tools/.upstream-versions.json |
    grep '"hash"' | cut -d'"' -f4)
  if [[ -n "$rolldown_hash" ]]; then
    rm -rf rolldown
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
  export CARGO_TARGET_DIR=target
  local toolchain
  toolchain=$(_get_toolchain)
  export RUSTUP_TOOLCHAIN="$toolchain"
  cargo build --release --frozen -p vp_global_cli
}

package() {
  cd "$srcdir/vite-plus"
  # Real binary + JS CLI share a version dir so auto-detect finds
  # ../node_modules/vite-plus/dist relative to the canonicalized binary path.
  install -Dm755 target/release/vp "$pkgdir/usr/lib/vite-plus/bin/vp"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/lib/vite-plus/bin/vp "$pkgdir/usr/bin/vp"
  install -dm755 "$pkgdir/usr/lib/vite-plus/node_modules/vite-plus"
  cp -a "$srcdir/js-deps/node_modules/." "$pkgdir/usr/lib/vite-plus/node_modules/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

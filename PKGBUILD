# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>

_pkgname=vite-plus
pkgname=${_pkgname}
pkgver=0.2.9
pkgrel=2
pkgdesc="The Unified Toolchain for the Web"
arch=("x86_64" "aarch64")
url="https://github.com/voidzero-dev/vite-plus"
license=("MIT")
# nodejs: JS CLI half of the hybrid launcher runs under node
depends=("glibc" "gcc-libs" "nodejs")
# npm: resolves the JS CLI dependency closure in prepare()
# git: needed to fetch vendored rolldown crates in prepare()
makedepends=("cargo" "rustup" "git" "npm")
provides=("${_pkgname}")
conflicts=("${_pkgname}-bin" "${_pkgname}-git")
options=("!debug" "!lto")

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/voidzero-dev/vite-plus/archive/refs/tags/v${pkgver}.tar.gz"
  "vite-plus-js-${pkgver}.tgz::https://registry.npmjs.org/vite-plus/-/vite-plus-${pkgver}.tgz"
)
sha256sums=('749f6bd91c31a0f1ddb5221c03058ea52a582becbf1d05aeb5a1cd3ad19b9559'
            'bca14b36f39c63b265405d37f5010ee8fee2e0237ed4b556e20c06153d626458')

_get_toolchain() {
  grep -E '^[[:space:]]*channel[[:space:]]*=' rust-toolchain.toml |
    sed 's/.*=[[:space:]]*"\(.*\)"/\1/'
}

prepare() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  # JS CLI dependency closure — same as upstream's installer (npm install
  # vite-plus@<ver>). The npm tarball has a `package/` root, so install it via
  # npm directly rather than extracting and guessing the tree.
  npm install --prefix "$srcdir/js-deps" --omit=dev --no-audit --no-fund \
    --cache "$srcdir/npm-cache" \
    "$srcdir/vite-plus-js-${pkgver}.tgz"

  # Upstream workflow (sync-remote-deps.ts) clones rolldown+vite repos at pinned
  # commits and merges JS tooling. For Rust builds we only need the rolldown
  # crates — they are path-referenced in [workspace.dependencies] and required
  # for Cargo workspace resolution.
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
  cd "$srcdir/${_pkgname}-${pkgver}"
  export CARGO_TARGET_DIR=target
  local toolchain
  toolchain=$(_get_toolchain)
  export RUSTUP_TOOLCHAIN="$toolchain"
  cargo build --release --frozen -p vp_global_cli
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  # Real binary + JS CLI share a version dir so auto-detect finds
  # ../node_modules/vite-plus/dist relative to the canonicalized binary path.
  install -Dm755 target/release/vp "$pkgdir/usr/lib/vite-plus/bin/vp"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/lib/vite-plus/bin/vp "$pkgdir/usr/bin/vp"
  cp -a "$srcdir/js-deps/node_modules/." "$pkgdir/usr/lib/vite-plus/node_modules/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

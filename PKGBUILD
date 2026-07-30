# Maintainer: zsigisti
# VCS package: builds mam-automate (Rust v2) straight from the git repo, so it
# works before a tagged release exists. Builds the CLI + TUI (the GUI is an
# opt-in cargo feature, left out so no desktop libraries are needed).
pkgname=mam-automate-git
pkgver=r0.g0000000
pkgrel=1
pkgdesc="Ratio-safe MyAnonaMouse -> qBittorrent automation (CLI/TUI/GUI)"
arch=('x86_64')
url="https://github.com/zsigisti/mam-automate"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
optdepends=('python: local-LLM AI sidecar (decision.backend = "llm")'
            'ollama: local model backend for the AI sidecar')
provides=('mam-automate')
conflicts=('mam-automate')
# Disable makepkg's global LTO: it injects -flto into ring's C/asm objects,
# which then fail to link against the Rust code. Cargo's own release-profile LTO
# still applies.
options=(!lto)
# Build from the rewrite branch until it is merged to the default branch; after
# the merge, drop the "#branch=..." fragment.
_branch=rust-rewrite
source=("$pkgname::git+https://github.com/zsigisti/mam-automate.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin mam
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release -p mam-core
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/mam" "$pkgdir/usr/bin/mam"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/mam-automate/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/mam-automate/README.md"

  install -d "$pkgdir/usr/share/bash-completion/completions"
  ./target/release/mam cli completions bash > "$pkgdir/usr/share/bash-completion/completions/mam"
  install -d "$pkgdir/usr/share/zsh/site-functions"
  ./target/release/mam cli completions zsh > "$pkgdir/usr/share/zsh/site-functions/_mam"
  install -d "$pkgdir/usr/share/fish/vendor_completions.d"
  ./target/release/mam cli completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/mam.fish"
}

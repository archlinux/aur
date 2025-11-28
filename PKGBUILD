# Maintainer: Thorben Günther <admin@xenrox.net>
# Contributor: Simon Ser <contact@emersion.fr>

pkgname=forgejo-cli-git
_pkgname=forgejo-cli
pkgver=v0.3.0.r51.g3f25bed
pkgrel=1
pkgdesc='CLI application for interacting with Forgejo'
url='https://codeberg.org/forgejo-contrib/forgejo-cli'
license=('Apache-2.0 OR MIT')
makedepends=('cargo' 'git')
depends=('openssl')
arch=('x86_64')
source=("git+$url.git")
sha256sums=('SKIP')
conflicts=(forgejo-cli)
provides=(forgejo-cli)
options=(!lto) # ref https://bbs.archlinux.org/viewtopic.php?id=294150

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features

    target/release/fj completion bash > fj.bash
    target/release/fj completion zsh > fj.zsh
    target/release/fj completion fish > fj.fish
}

check() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/fj"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/forgejo-cli/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/forgejo-cli/LICENSE-MIT"
    install -Dm644 fj.bash "$pkgdir/usr/share/bash-completion/completions/fj"
    install -Dm644 fj.zsh "$pkgdir/usr/share/zsh/site-functions/_fj"
    install -Dm644 fj.fish "$pkgdir/usr/share/fish/vendor_completions.d/fj.fish"
}

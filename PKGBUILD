# Maintainer: Tim Pearson <ttpears@gmail.com>
pkgname=tmux-tad
_pkgname=tad
pkgver=0.7.0
pkgrel=1
pkgdesc="Tmux session and group manager with a native TUI dashboard"
arch=('x86_64')
url="https://github.com/ttpears/tad"
license=('MIT')
depends=('tmux' 'gcc-libs' 'glibc')
makedepends=('cargo')
# Installs /usr/bin/tad — conflicts with `tmux-tad-bin` (same project,
# prebuilt binary) and with unrelated AUR `tad-bin` (CSV viewer) / `tad`
# (C++ array library) that also claim the binary name.
conflicts=('tad-bin' 'tad' 'tmux-tad-bin' 'tmux-tad-git')
# Upstream's Cargo.toml sets profile.release.strip = true, so the built
# binary has no debug symbols. Skip makepkg's debug-split and re-strip
# passes — they only produce an empty tmux-tad-debug package.
options=('!debug' '!strip')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4846861d9892d5d9b00fe982ea4903ed49dfcbaa1af2154675e7b8b1cb00993c')

prepare() {
    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "completions/tad.bash" \
        "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm644 "completions/_tad" \
        "$pkgdir/usr/share/zsh/site-functions/_tad"
    install -Dm644 "examples/groups.yaml.example" \
        "$pkgdir/usr/share/doc/$pkgname/groups.yaml.example"
    install -Dm644 "examples/config.yaml.example" \
        "$pkgdir/usr/share/doc/$pkgname/config.yaml.example"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

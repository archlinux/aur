pkgname=hyprshell
# x-release-please-start-version
pkgver=4.8.0
# x-release-please-end
pkgrel=1
pkgdesc="A modern GTK4-based window switcher and application launcher for Hyprland"
arch=('x86_64' 'aarch64')
conflicts=('hyprshell')
provides=('hyprshell')
url="https://github.com/h3rmt/hyprshell/"
license=("MIT")
makedepends=('cargo')
depends=('hyprland' 'gtk4-layer-shell' 'gtk4' 'gcc' 'pixman' 'libadwaita')
source=("hyprshell-$pkgver.tar.gz::https://static.crates.io/crates/hyprshell/hyprshell-$pkgver.crate")

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "hyprshell-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "hyprshell-$pkgver"
    cargo build --frozen --release
}

package() {
    install -Dm755 "hyprshell-$pkgver/target/release/hyprshell" "$pkgdir/usr/bin/hyprshell"
    install -Dm644 "hyprshell-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/hyprshell/LICENSE"

    "$pkgdir/usr/bin/hyprshell" completions bash -p "$pkgdir/usr/share/bash-completion/completions"
    "$pkgdir/usr/bin/hyprshell" completions fish -p "$pkgdir/usr/share/fish/vendor_completions.d"
    "$pkgdir/usr/bin/hyprshell" completions zsh -p "$pkgdir/usr/share/zsh/site-functions"
}
sha256sums=('5d6ccaa010d969899c37062f7c188261c800774e60c5148f92c4c4da7753bf8a')

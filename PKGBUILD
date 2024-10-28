# Maintainer: Max Hösel <aur at spacebird dot dev>

# shellcheck disable=all
pkgname=alacritty-theme-switcher
pkgver=0.1.5
pkgrel=2
epoch=0
pkgdesc="Easily switch between color themes for Alacritty"
arch=(
    'x86_64'
    'aarch64'
)
url="https://github.com/spacebird-dev/alacritty-theme-switcher"
license=("GPL-3.0-only")
makedepends=(
    git
    cargo
)
optdepends=(
    'alacritty: theme usage'
)
source=(
    "git+https://github.com/spacebird-dev/alacritty-theme-switcher.git#tag=v$pkgver"
)
sha256sums=(
    SKIP
)

prepare() {
    cd "${pkgbase}"

    # Keep rust/cargo build-dependency management inside the build directory
    export CARGO_HOME="${srcdir}/cargo"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}


build() {
    cd "${pkgbase}"

    # Keep rust/cargo build-dependency management inside the build directory
    export CARGO_HOME="${srcdir}/cargo"

    # Follow Rust package guidelines
    ## https://wiki.archlinux.org/title/Rust_package_guidelines
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --all-features
}

package() {
    install -Dm 0755 -t "$pkgdir/usr/bin/" "alacritty-theme-switcher/target/release/$pkgname"
	install -Dm 0644 -t "$pkgdir/usr/share/bash-completion/completions/" alacritty-theme-switcher/dist/completions/bash/completions/alacritty-theme-switcher
	install -Dm 0644 -t "$pkgdir/usr/share/zsh/site-functions/" alacritty-theme-switcher/dist/completions/zsh/site-functions/_alacritty-theme-switcher
}

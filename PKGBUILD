# Maintainer: sinder <smirnov.sinder@gmail.com>
pkgname=live-paper-git
_pkgname=live-paper
pkgver=0.2.0.r0.g0bb27ef
pkgrel=1
pkgdesc="A Wayland video wallpaper engine (VCS build)"
arch=('x86_64')
url="https://github.com/sinder38/live-paper-rs"
license=('MIT')
depends=('mpv' 'wayland' 'libglvnd')
makedepends=('cargo' 'git')
provides=('live-paper')
conflicts=('live-paper')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 "target/release/live-paper" "$pkgdir/usr/bin/live-paper"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    # Ship the sample config as documentation
    install -Dm644 "config.example.toml" \
        "$pkgdir/usr/share/doc/$_pkgname/config.example.toml"
}

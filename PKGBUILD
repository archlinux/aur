# Maintainer: ShinKouyo <i@0x0f.dev>
pkgname=we-layerd-git
_pkgname=we-layerd
pkgver=r74.6140b9f
pkgrel=1
pkgdesc="Rust daemon to run Wallpaper Engine via Wine on Wayland compositors"
arch=("x86_64")
url="https://github.com/Aromatic05/we-layerd"
license=("unknown")
depends=(
    "ffmpeg"
    "gtk3"
    "libx11"
    "libxcomposite"
    "libxdamage"
    "libxfixes"
    "libxrender"
    "vulkan-icd-loader"
    "xdotool"
)
optdepends=(
    "wine: required to run Wallpaper Engine"
    "wlr-randr: monitor management for wlroots-based compositors"
)
makedepends=("git" "cargo")
provides=("we-layerd")
conflicts=("we-layerd")
source=("$_pkgname::git+${url}.git")
sha256sums=("SKIP")
pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
prepare() {
    cd "$_pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
build() {
    export CARGO_TARGET_DIR=target
    cd "$_pkgname"
    cargo build --frozen --release -p we-layerd -p we-gui
}
check() {
    cd "$_pkgname"
    cargo test --frozen -p we-layerd -p we-gui
}
package() {
    cd "$_pkgname"
    install -Dm755 target/release/we-layerd -t "$pkgdir/usr/bin/"
    install -Dm755 target/release/we-gui -t "$pkgdir/usr/bin/"
    if [ -f config.example.toml ]; then
      install -Dm644 config.example.toml -t "$pkgdir/usr/share/doc/$_pkgname/"
    fi
}
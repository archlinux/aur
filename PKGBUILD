# Maintainer: dowoge <t@tommyy.dev>
pkgname=asset-tool-git
_pkgname=asset-tool
pkgver=0.5.1.r286.173ad65
pkgrel=1
pkgdesc="Upload and download Roblox assets (StrafesNET)"
arch=('x86_64')
url="https://git.itzana.me/StrafesNET/asset-tool"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    local cargo_ver
    cargo_ver=$(awk -F'"' '/^version[[:space:]]*=/ {print $2; exit}' Cargo.toml)
    printf "%s.r%s.%s" "$cargo_ver" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    install -Dm755 "$_pkgname/target/release/$_pkgname" \
        "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$_pkgname/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$_pkgname/README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}

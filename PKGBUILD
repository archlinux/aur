# Maintainer: AkitaOnRails <boss@akitaonrails.com>

# NOTE: pkgver/pkgrel and the sha256sums below are PLACEHOLDERS.
# `.github/workflows/release.yml` copies this file at publish time and
# rewrites all of them from the release tag before pushing to the AUR.
# Check the published package instead:
#
#     curl -s 'https://aur.archlinux.org/rpc/v5/info?arg[]=omarchy-cheatsheets'
#
pkgname=omarchy-cheatsheets
pkgver=0.6.1
pkgrel=1
pkgdesc="Pretty, searchable Neovim/tmux/etc cheatsheets for Omarchy Linux (Qt6/QML + Rust)"
arch=('x86_64' 'aarch64')
url="https://github.com/akitaonrails/omarchy-cheatsheets"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'qt6-base' 'qt6-declarative')
makedepends=('cargo' 'clang' 'cmake')
conflicts=('omarchy-cheatsheets-bin')
install=omarchy-cheatsheets.install
options=('!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('904cf2197a6510b1f9900491708fb8980b624341727178f9bb6d88695f6a5410')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=1.95
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=1.95
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=1.95
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 packaging/omarchy-cheatsheets.desktop \
        "$pkgdir/usr/share/applications/omarchy-cheatsheets.desktop"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

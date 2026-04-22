# Maintainer: kabeuchi-bird <https://github.com/kabeuchi-bird>
pkgname=kabekami-git
pkgver=r69.2d8df78
pkgrel=1
pkgdesc="KDE Plasma wallpaper rotation daemon with BlurPad display mode and online sources"
arch=('x86_64' 'aarch64')
url="https://github.com/kabeuchi-bird/kabekami"
license=('MIT')
depends=('plasma-workspace' 'libxkbcommon' 'openssl')
makedepends=('rust' 'cargo' 'git' 'pkg-config')
optdepends=(
    'kscreen: screen resolution auto-detection via kscreen-doctor'
    'noto-fonts-cjk: Japanese text in the settings GUI'
)
provides=('kabekami' 'kabekami-config')
conflicts=('kabekami' 'kabekami-config')
source=(
    "$pkgname::git+https://github.com/kabeuchi-bird/kabekami.git"
    "kabekami-config.desktop"
)
sha256sums=(
    'SKIP'
    'c5448fc1733c37ce87f24bcdddc732f1bf524cf4c1c94d4ef8735987d01df62d'
)

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/kabekami"        "$pkgdir/usr/bin/kabekami"
    install -Dm755 "target/release/kabekami-config" "$pkgdir/usr/bin/kabekami-config"
    install -Dm644 LICENSE                          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md                        "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/kabekami-config.desktop" \
        "$pkgdir/usr/share/applications/kabekami-config.desktop"
}

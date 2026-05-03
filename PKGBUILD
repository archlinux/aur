# Maintainer: kabeuchi-bird <https://github.com/kabeuchi-bird>
pkgname=kabekami-git
pkgver=r125.69935d8
pkgrel=1
pkgdesc="KDE Plasma wallpaper rotation daemon with multi-monitor support, online sources, and global shortcuts"
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
install=kabekami.install
source=(
    "$pkgname::git+https://github.com/kabeuchi-bird/kabekami.git"
    "kabekami-config.desktop"
    "kabekami.install"
)
sha256sums=(
    'SKIP'
    'aadec7cb6e6bff5a008936578905beb8fbf18feb794b8decd3b3e8ad90023b27'
    '98f2a4c185312a68910e300ce428ad793481b893194ecbf86f12f5fec91313e1'
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
    install -Dm644 config.toml                      "$pkgdir/usr/share/doc/$pkgname/config.toml"
    install -Dm644 config.ja.toml                   "$pkgdir/usr/share/doc/$pkgname/config.ja.toml"
    install -Dm644 "$srcdir/kabekami-config.desktop" \
        "$pkgdir/usr/share/applications/kabekami-config.desktop"
}

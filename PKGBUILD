# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight Wayland application launcher with plugin support"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry-core' 'gcc-libs' 'gtk4' 'gtk4-layer-shell')
makedepends=('cargo')
optdepends=(
    'cliphist: clipboard provider support'
    'wl-clipboard: clipboard and emoji copy support'
    'fd: fast file search'
    'owlry-plugin-calculator: calculator provider'
    'owlry-plugin-clipboard: clipboard provider'
    'owlry-plugin-emoji: emoji picker'
    'owlry-plugin-bookmarks: browser bookmarks'
    'owlry-plugin-ssh: SSH host launcher'
    'owlry-plugin-scripts: custom scripts provider'
    'owlry-plugin-system: system actions (shutdown, reboot, etc.)'
    'owlry-plugin-websearch: web search provider'
    'owlry-plugin-filesearch: file search provider'
    'owlry-plugin-systemd: systemd service management'
    'owlry-plugin-weather: weather widget'
    'owlry-plugin-media: media player controls'
    'owlry-plugin-pomodoro: pomodoro timer widget'
    'owlry-lua: Lua runtime for user plugins'
    'owlry-rune: Rune runtime for user plugins'
)
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry/archive/owlry-v$pkgver.tar.gz")
b2sums=('173bc81da3f130204c3d4a75438cc0532f6783bd6bbfdab8f32f0521312389fb4ad24587e248201649fd837e1ddd06cfa15c4a3dced520b8db1354bb6ff39d4c')

prepare() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Build only the core binary without embedded Lua (Lua runtime is separate package)
    cargo build -p owlry --frozen --release --no-default-features
}

check() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test -p owlry --frozen --no-default-features
}

package() {
    cd "owlry"

    # Core binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Example configuration files
    install -Dm644 data/config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
    install -Dm644 data/style.example.css "$pkgdir/usr/share/doc/$pkgname/style.example.css"
    install -Dm755 data/scripts/example.sh "$pkgdir/usr/share/doc/$pkgname/scripts/example.sh"

    # Install themes
    install -d "$pkgdir/usr/share/$pkgname/themes"
    install -Dm644 data/themes/*.css "$pkgdir/usr/share/$pkgname/themes/"

    # Example plugins (for user plugin development)
    install -d "$pkgdir/usr/share/$pkgname/examples/plugins"
    cp -r examples/plugins/* "$pkgdir/usr/share/$pkgname/examples/plugins/"
}

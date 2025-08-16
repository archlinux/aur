pkgname=lyrica
pkgver=0.14
pkgrel=1
pkgdesc="Linux desktop lyrics widget focused on simplicity and integration."
arch=("x86_64")
url="https://github.com/chiyuki0325/lyrica/"
license=("MIT")
depends=("zlib" "dbus" "gcc-libs" "glibc" "openssl" "qt6-declarative" "qt6-websockets" "libplasma"
         "kirigami" "plasma5support")
makedepends=("cargo" "jq")
optdepends=("python-websockets: Run examples/lyrica_obs_plugin.py"
            "python: Run examples/lyrica_obs_plugin.py"
            "obs-studio: Run examples/lyrica_obs_plugin.py")
options=("!lto") # Undefined references to ...
source=("$pkgname-$pkgver.tar.gz::https://github.com/chiyuki0325/lyrica/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a54596c5a42f0feb7fa952110aee001ac4d115c551a9aefd5a7bb3e4c25b3553')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    depends+=(psmisc bash hicolor-icon-theme)
    cd "$srcdir/$pkgname-$pkgver"
    local id
    id=$(jq -r .KPlugin.Id plasmoid/metadata.json)
    echo "Installing $id..."
    local plasmoids="$pkgdir/usr/share/plasma/plasmoids"
    install -d "$plasmoids"
    local plasmoid="$plasmoids/$id"
    cp -a --no-preserve=ownership plasmoid "$plasmoid"
    install -Dm755 target/release/lyrica "$pkgdir/usr/lib/lyrica/lyrica"
    local bin="$pkgdir/usr/share/plasma/plasmoids/$id/contents/bin"
    mkdir -p "$bin"
    ln -srfv "$pkgdir/usr/lib/lyrica/lyrica" "$bin/lyrica"
    sed -i "s|\$HOME/.local|/usr|" "$plasmoid/contents/ui/main.qml"

    local doc="$pkgdir/usr/share/doc/$pkgname"
    install -d "$doc"
    install -Dm644 docs/LYRIC_PROVIDERS{,.zh}.md "$doc"
    cp -a --no-preserve=ownership examples "$doc"

    install -Dm644 assets/lyrica.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/$id.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

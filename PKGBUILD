pkgname=lyrica
pkgver=0.10
pkgrel=1
pkgdesc="Linux desktop lyrics widget focused on simplicity and integration."
arch=("x86_64")
url="https://github.com/chiyuki0325/lyrica/"
license=("LicenseRef-unknown")
depends=(
    "zlib" "dbus" "gcc-libs" "glibc" "openssl"
    "qt6-declarative" "qt6-websockets" "libplasma" "kirigami" "plasma5support")
makedepends=("cargo" "jq")
optdepends=(
    "python-websockets: Run examples/lyrica_obs_plugin.py"
    "python: Run examples/lyrica_obs_plugin.py"
    "obs-studio: Run examples/lyrica_obs_plugin.py")
options=("!lto") # Undefined references to ...
source=("$pkgname-$pkgver.tar.gz::https://github.com/chiyuki0325/lyrica/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8fc5f0a9461019404eb0d138fd705d3aa25d199c043fdb2fa7cfd477f6a0e85b')

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
    cargo test --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    local id
    id=$(jq -r .KPlugin.Id plasmoid/metadata.json)
    echo "Installing $id..."
    local plasmoids="$pkgdir/usr/share/plasma/plasmoids"
    install -d "$plasmoids"
    local plasmoid="$plasmoids/$id"
    cp -a --no-preserve=ownership plasmoid "$plasmoid"
    install -Dm755 target/release/lyrica "$plasmoid/contents/bin/lyrica"
	sed -i 's|$HOME/.local|/usr|' "$plasmoid/contents/ui/main.qml"

    local doc="$pkgdir/usr/share/doc/$pkgname"
    install -d "$doc"
    install -Dm644 docs/LYRIC_PROVIDERS{,.zh}.md "$doc"
    cp -a --no-preserve=ownership examples "$doc"

    install -Dm644 assets/lyrica.png \
    	"$pkgdir/usr/share/icons/hicolor/128x128/apps/$id.png"
}

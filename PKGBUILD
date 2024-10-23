pkgname=lyrica
pkgver=0.12
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
sha256sums=('08a33e6643d8c74706f119d81d4218d354972769aa10728eaf0e07a4332683f0')

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
    install -Dm755 target/release/lyrica "$pkgdir/usr/bin/lyrica"
	sed -i "s|bash -c '\$HOME/.local/share/plasma/plasmoids/$id/contents/bin/lyrica'|/usr/bin/lyrica|" \
	    "$plasmoid/contents/ui/main.qml"

    local doc="$pkgdir/usr/share/doc/$pkgname"
    install -d "$doc"
    install -Dm644 docs/LYRIC_PROVIDERS{,.zh}.md "$doc"
    cp -a --no-preserve=ownership examples "$doc"

    install -Dm644 assets/lyrica.png \
    	"$pkgdir/usr/share/icons/hicolor/128x128/apps/$id.png"
}

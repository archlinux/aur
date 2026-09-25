# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: le0nxx <leonlawxx@outlook.sg>

pkgname=rayburst
pkgver=4.0.0
pkgrel=2
pkgdesc="A full-featured download manager rebuilt with Tauri 2, Vue 3, and Rust"
arch=(x86_64 aarch64)
url="https://github.com/AnInsomniacy/rayburst"
license=(MIT)
depends=(
    cairo
    gdk-pixbuf2
    gtk3
    hicolor-icon-theme
    libappindicator-gtk3
    libsoup3
    webkit2gtk-4.1
)
makedepends=(
    cargo
    nodejs
    pnpm
    openssl
    appmenu-gtk-module
)
replaces=(motrix-next)
options=(!lto)
install=rayburst.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3ab1041c8ad5c62cd62e968d0141695bff041c06a04f2258dd48d1a07924758f')


prepare() {
    cd "$pkgname-$pkgver"

    # Disable updater artifact signing — not needed for distro packages
    sed -i '/"createUpdaterArtifacts":/s/true/false/' src-tauri/tauri.conf.json

    pnpm install --frozen-lockfile
    cd src-tauri
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_HOME="${srcdir}/cargo-home"
    rm -rf src-tauri/target/release/build/ring-*
    pnpm tauri build --bundles deb
}

package() {
    cd "$pkgname-$pkgver"

    # Extract the built .deb and repackage its contents
    local tmpdir="${srcdir}/deb-extract"
    mkdir -p "$tmpdir"
    ar x src-tauri/target/release/bundle/deb/*.deb --output="$tmpdir"
    tar -xf "$tmpdir/data.tar.gz" -C "$pkgdir"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

    # Fix empty Categories so KDE launcher can display the app
    sed -i '/^Categories=/c\Categories=Network;FileTransfer;' \
        "$pkgdir/usr/share/applications/Rayburst.desktop"
}

# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: le0nxx <leonlawxx@outlook.sg>

pkgname=motrix-next
pkgver=3.9.7
pkgrel=1
pkgdesc="A full-featured download manager rebuilt with Tauri 2, Vue 3, and Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/AnInsomniacy/motrix-next"
license=('MIT')
depends=(
    aria2-next
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
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5f7ddb6a83d4ce1201aaa9f0e68733a6c1410578a54036e722e320abdc047acd')


prepare() {
    cd "$pkgname-$pkgver"

    # Disable updater artifact signing — not needed for distro packages
    sed -i '/"createUpdaterArtifacts":/s/true/false/' src-tauri/tauri.conf.json

    pnpm install --frozen-lockfile
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
        "$pkgdir/usr/share/applications/MotrixNext.desktop"
}

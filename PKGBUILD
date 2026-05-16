# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: le0nxx <leonlawxx@outlook.sg>

pkgname=motrix-next
pkgver=3.8.10
pkgrel=1
pkgdesc="A full-featured download manager rebuilt with Tauri 2, Vue 3, and Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/AnInsomniacy/motrix-next"
license=('MIT')
depends=(
    aria2
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
sha256sums=('4abbc55d7512763a26ed112eaca2c9ffb51f203c51f67d78f68627bbbb1b4010')


prepare() {
    cd "$pkgname-$pkgver"

    # Create the Tauri-expected sidecar symlink pointing to the system aria2c.
    # Tauri's externalBin resolves "binaries/aria2c" to
    # "binaries/aria2c-<target-triple>" at build time and install time.
    local target_triple=$(rustc -vV | awk '/^host:/{print $2}')
    mkdir -p src-tauri/binaries
    ln -sf /usr/bin/aria2c "src-tauri/binaries/aria2c-${target_triple}"

    # Disable updater artifact signing — not needed for distro packages
    sed -i '/"createUpdaterArtifacts":/s/true/false/' src-tauri/tauri.conf.json

    pnpm install --frozen-lockfile
}

build() {
    cd "$pkgname-$pkgver"

    export CARGO_HOME="${srcdir}/cargo-home"
    export CC=gcc
    export AR=ar
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc

    # Strip -flto from system CFLAGS — LTO produces GIMPLE IR objects that
    # the Rust linker cannot resolve when linking ring's static C/ASM library.
    # export CFLAGS="${CFLAGS//-flto=auto/}"
    # export CFLAGS="${CFLAGS//-flto/}"

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

    rm -f "$pkgdir/usr/bin/aria2c"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

    # Replace the bundled aria2c sidecar copy with a symlink to the system package.
    local target_triple=$(rustc -vV | awk '/^host:/{print $2}')
    find "$pkgdir/usr/lib/MotrixNext/" -name "aria2c-*" -delete
    ln -sf /usr/bin/aria2c "$pkgdir/usr/lib/MotrixNext/aria2c-${target_triple}"

    # Fix empty Categories so KDE launcher can display the app
    sed -i '/^Categories=/c\Categories=Network;FileTransfer;' \
        "$pkgdir/usr/share/applications/MotrixNext.desktop"
}

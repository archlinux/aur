# Maintainer: le0nxx <leonlawxx@outlook.sg>
pkgname=motrix-next
pkgver=3.4.5
pkgrel=1
pkgdesc="A full-featured download manager rebuilt with Tauri 2, Vue 3, and Rust"
arch=('x86_64')
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
    curl
    file
    openssl
    appmenu-gtk-module
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/AnInsomniacy/motrix-next/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "motrix-next-$pkgver"

    # Create the Tauri-expected sidecar symlink pointing to the system aria2c.
    # Tauri's externalBin resolves "binaries/aria2c" to
    # "binaries/aria2c-<target-triple>" at build time and install time.
    local target_triple
    target_triple=$(rustc -vV | awk '/^host:/{print $2}')
    mkdir -p src-tauri/binaries
    ln -sf /usr/bin/aria2c "src-tauri/binaries/aria2c-${target_triple}"

    # Disable updater artifact signing — not needed for distro packages
    sed -i 's/"createUpdaterArtifacts": true/"createUpdaterArtifacts": false/' src-tauri/tauri.conf.json

    pnpm install --frozen-lockfile
}

build() {
    cd "motrix-next-$pkgver"

    export CARGO_HOME="${srcdir}/cargo-home"
    export CC=gcc
    export AR=ar
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc

    # Strip -flto from system CFLAGS — LTO produces GIMPLE IR objects that
    # the Rust linker cannot resolve when linking ring's static C/ASM library.
    export CFLAGS="${CFLAGS//-flto=auto/}"
    export CFLAGS="${CFLAGS//-flto/}"

    rm -rf src-tauri/target/release/build/ring-*

    pnpm tauri build --bundles deb
}

package() {
    cd "motrix-next-$pkgver"

    # Extract the built .deb and repackage its contents
    local deb
    deb=$(find src-tauri/target/release/bundle/deb -name "*.deb" | head -1)
    [[ -z "$deb" ]] && { echo "ERROR: .deb bundle not found"; return 1; }

    local tmpdir="${srcdir}/deb-extract"
    mkdir -p "$tmpdir"
    ar x "$deb" --output="$tmpdir"

    local data_tar
    data_tar=$(find "$tmpdir" -name "data.tar*" | head -1)
    [[ -z "$data_tar" ]] && { echo "ERROR: data.tar not found in .deb"; return 1; }
    tar -xf "$data_tar" -C "$pkgdir"

    rm -f "$pkgdir/usr/bin/aria2c"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Replace the bundled aria2c sidecar copy with a symlink to the system package.
    local target_triple
    target_triple=$(rustc -vV | awk '/^host:/{print $2}')
    local install_dir
    install_dir=$(find "$pkgdir/usr/lib" -maxdepth 1 -type d \( -name "*motrix*" -o -name "*MotrixNext*" \) 2>/dev/null | head -1)
    if [[ -n "$install_dir" ]]; then
        find "$install_dir" -name "aria2c-*" -delete
        ln -sf /usr/bin/aria2c "$install_dir/aria2c-${target_triple}"
    fi

    # Fix empty Categories so KDE launcher can display the app
sed -i 's/^Categories=$/Categories=Network;/' \
    "$pkgdir/usr/share/applications/MotrixNext.desktop"
}

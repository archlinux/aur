# Maintainer: Hussein Hareb <shtam.hareb12@gmail.com>
#
# Builds the latest commit on main from GitHub, so only pushed work is
# packaged. Locally:
#
#     cd packaging && makepkg -si
pkgname=netmeter-git
_pkgname=netmeter
pkgver=r32.3cd88a2
pkgrel=1
pkgdesc="Network usage monitor: interface totals and per-application usage, measured in the kernel"
arch=('x86_64')
url="https://github.com/husseinhareb/NetMeter"
license=('Apache-2.0')
# GUI: webkit2gtk, gtk3, the tray. netmeterd: libelf, zlib, zstd (libbpf is
# linked in statically).
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'libelf' 'zlib' 'zstd'
         'gcc-libs' 'glibc' 'systemd')
makedepends=('git' 'cargo' 'nodejs' 'npm' 'clang' 'libbpf')
optdepends=('polkit: re-enable the service from the GUI after turning it off')
provides=("$_pkgname")
conflicts=("$_pkgname")
# makepkg's LTO turns the bundled SQLite into GCC bitcode that the Rust link
# cannot read (every sqlite3_* symbol comes up undefined). The Rust side
# already builds with LTO from its own release profile.
options=('!lto')
install=netmeter.install
source=("$_pkgname::git+https://github.com/husseinhareb/NetMeter.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    # Downloads happen here so build() can run offline.
    npm ci
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" \
        --manifest-path src-tauri/Cargo.toml
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" \
        --manifest-path netmeterd/Cargo.toml
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    # The binary only: the .deb and .rpm bundles are not wanted here.
    npm run tauri build -- --no-bundle -- --frozen
    cargo build --release --frozen --manifest-path netmeterd/Cargo.toml
}

check() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen --manifest-path netmeterd/Cargo.toml
}

package() {
    cd "$_pkgname"
    install -Dm755 src-tauri/target/release/netmeter "$pkgdir/usr/bin/netmeter"
    install -Dm755 netmeterd/target/release/netmeterd "$pkgdir/usr/lib/netmeter/netmeterd"
    install -Dm755 packaging/install-helper.sh "$pkgdir/usr/lib/netmeter/install-helper.sh"
    install -Dm644 packaging/netmeterd.service \
        "$pkgdir/usr/lib/systemd/system/netmeterd.service"

    install -Dm644 packaging/netmeter.desktop \
        "$pkgdir/usr/share/applications/netmeter.desktop"
    for size in 32 64 128; do
        install -Dm644 "src-tauri/icons/${size}x${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/netmeter.png"
    done
    install -Dm644 src-tauri/icons/128x128@2x.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/netmeter.png"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

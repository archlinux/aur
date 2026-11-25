# Maintainer: Antidote1911 <antidote1911@users.noreply.github.com>
#
# Cryptyrust built from the sources of a release. The Rust crates are fetched in prepare()
# (versions pinned by Cargo.lock), then the build runs offline. Only the application is built:
# the C FFI library of the workspace is not packaged.
#
# No check(): the tests run real Argon2id key derivations and take several minutes.
#
# New version: ../publish.sh (pkgver, updpkgsums, makepkg --printsrcinfo > .SRCINFO, push to the AUR)

pkgname=cryptyrust
pkgver=3.1.0
pkgrel=1
pkgdesc="Post-quantum file encryption: drag-and-drop GUI and command line (X25519 + ML-KEM, Argon2id)"
arch=('x86_64' 'aarch64')
url="https://github.com/Antidote1911/cryptyrust"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'libxkbcommon' 'libxkbcommon-x11' 'libx11' 'libxcb' 'libxcursor' 'libxi'
         'libglvnd' 'xdg-desktop-portal' 'hicolor-icon-theme')
optdepends=('wayland: run on Wayland when no X server is available')
makedepends=('cargo')
conflicts=('cryptyrust-bin')
# The C code of the crates (zstd) is linked by rustc, which does not read LTO objects of gcc
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Antidote1911/cryptyrust/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('76fb21ac732c36ae44adb067a4425f3aac4ba04a2ecd6327a35674f5484004de')

prepare() {
    cd "$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo" CARGO_TARGET_DIR=target
    # No path of the build folder in the program (messages of the Rust crates)
    export RUSTFLAGS="--remap-path-prefix=$srcdir=/usr/src/$pkgname"
    cargo build --frozen --release --package cryptyrust
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/cryptyrust -t "$pkgdir/usr/bin"
    install -Dm644 packaging/linux/cryptyrust.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 packaging/cryptyrust.png -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    install -Dm644 README.md arsenic/FORMAT.md -t "$pkgdir/usr/share/doc/$pkgname"
    # The GUI and CLI reference; a second README.md would overwrite the first
    install -Dm644 cryptyrust/README.md "$pkgdir/usr/share/doc/$pkgname/USAGE.md"
}

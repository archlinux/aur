# Maintainer: LogicalKarma <aur.archlinux.org.urgent678@passmail.net>
# Upstream: https://codeberg.org/Enoki/linux-mod-organizer (tags are annotated but unsigned)
#
# Tracks the newest release tag: pkgver() reads it from the clone and prepare()
# checks that tag out, so the build is never a floating master snapshot.

pkgname=linux-mod-organizer-git
_pkgname=linux-mod-organizer
pkgver=1.28.0
pkgrel=1
pkgdesc="Native Linux mod organizer for Bethesda games and Baldur's Gate 3 using fuse-overlayfs"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/Enoki/linux-mod-organizer"
license=('GPL-3.0-or-later')
depends=('fuse-overlayfs' 'webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
makedepends=('cargo' 'git' 'nodejs' 'npm' 'pkg-config')
optdepends=('wine: run xEdit, DynDOLOD and Wrye Bash through Proton/Wine')
provides=('linux-mod-organizer' 'lmo')
conflicts=('linux-mod-organizer' 'linux-mod-organizer-bin')
# !strip: Tauri/upstream keep the binary unstripped.
# !lto: makepkg's default lto option injects -flto=auto into CFLAGS, so the cc-built
#       archives from libsqlite3-sys/zstd-sys end up as GCC LTO bytecode that rust-lld
#       cannot read (undefined symbol: sqlite3_*, ZSTD_decompressStream).
options=('!strip' '!lto')
# No check(): upstream's 1420 tests are slow and stay out of the default build. To run them by hand
# (needs p7zip and zip): cd src/linux-mod-organizer && LMO_CONFIG_DIR=$(mktemp -d) CARGO_HOME=../cargo-home cargo test --release --locked
source=("git+https://codeberg.org/Enoki/linux-mod-organizer.git")
sha256sums=('SKIP')

_latest_tag() {
    git tag --list 'v[0-9]*' --sort=-v:refname | head -n1
}

pkgver() {
    cd "$srcdir/$_pkgname"
    _latest_tag | sed 's/^v//' | tr - '_'
}

prepare() {
    cd "$srcdir/$_pkgname"
    git checkout "$(_latest_tag)"

    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked

    cd gui
    npm ci --no-audit --no-fund --no-progress --cache "$srcdir/npm-cache"
}

build() {
    cd "$srcdir/$_pkgname"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo build --release --locked --bin lmo

    cd gui
    RUSTFLAGS="-C link-arg=-lstdc++ ${RUSTFLAGS-}" NO_STRIP=1 npx tauri build --no-bundle
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 target/release/lmo "$pkgdir/usr/bin/lmo"
    install -Dm755 gui/src-tauri/target/release/lmo-gui "$pkgdir/usr/bin/lmo-gui"

    install -Dm644 docs/lmo.1 "$pkgdir/usr/share/man/man1/lmo.1"
    install -Dm644 packaging/lmo.desktop "$pkgdir/usr/share/applications/lmo.desktop"
    install -Dm644 packaging/flatpak/page.codeberg.enoki.LinuxModOrganizer.metainfo.xml \
        "$pkgdir/usr/share/metainfo/page.codeberg.enoki.LinuxModOrganizer.metainfo.xml"

    for size in 32 128 256 512; do
        install -Dm644 "gui/src-tauri/icons/icon_${size}x${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/lmo.png"
    done

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

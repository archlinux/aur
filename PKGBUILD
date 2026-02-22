# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=surrealist
pkgname="$_pkgname-cef"
pkgver=3.7.2
pkgrel=2
pkgdesc="Surrealist is the ultimate way to visually manage your SurrealDB database (Experimental CEF runtime)"
arch=("x86_64" "aarch64")
url="https://github.com/surrealdb/surrealist"
license=("MIT")
groups=()
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'libcups'
    'libdrm'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'openssl'
    'pango'
    'wayland'
)
makedepends=(
    'rust'
    'cargo'
    'git'
    'jq'
)
optdepends=('surrealdb: non-sandboxed SurrealDB instance')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
source=(
    "$url/archive/refs/tags/surrealist-v$pkgver.tar.gz"
    'cef-runtime.patch'
    'surrealist'
    'Surrealist.desktop'
)
sha256sums=('51d6ae88a746a4a5cbce6b19aaf6778acffd990f7b26e5e9ca8e20348c88f729'
            '1790c8fdaec8750844c69d6d1798b41236504461313764c6f740dad0a56376a7'
            '9f2c7374511c39bb98cb8a41f85908b76f90052904edb88b17a1523e40942fb1'
            '94f0619847e1136a07c7386c9bf20fec15ff29c69c4dede523958beeaed28427')

_srcdir="$srcdir/$_pkgname-$_pkgname-v$pkgver"
_cef_ver="144.0.7"

prepare() {
    cd "./$_srcdir"
    
    patch -Np0 < "$srcdir/cef-runtime.patch" || true

    if ! command -v bun &> /dev/null; then
        echo "Bun was not found. Please install bun from https://bun.com/, or install the bun AUR package."
        exit 1
    fi
    bunversion=$(bun --version | sed 's/[^0-9]*//g')
    if (( bunversion < 120 )); then
        echo "Upgrading bun"
        bun upgrade
    fi

    export CARGO_HOME="$srcdir/.cargo-tauri-cef"
    cargo install tauri-cli \
        --git https://github.com/tauri-apps/tauri \
        --branch feat/cef \
        --root "$srcdir/.cargo-tauri-cef" \
        --locked # --force

    msg "Installing JS dependencies"
    bun i
    bun run license-report
}

build() {
    cd "./$_srcdir"

    export CARGO_HOME="$srcdir/.cargo-tauri-cef"
    export PATH="$srcdir/.cargo-tauri-cef/bin:$PATH"
    export CEF_PATH="$srcdir/cef"
    export CFLAGS+=" -ffat-lto-objects"
    mkdir -p "$CEF_PATH"

    # Remove the lockfile so Cargo re-resolves against the patched git crates
    # instead of the locked crates.io versions which don't have the cef feature
    rm -f src-tauri/Cargo.lock

    cargo tauri build --no-bundle
}

package() {
    cd "./$_srcdir"

    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm755 "src-tauri/target/release/$_pkgname" "$pkgdir/usr/share/$_pkgname"

    mkdir -p "$pkgdir/usr/lib/cef-$_pkgname/"
    cp -r "$srcdir/cef/$_cef_ver"/* "$pkgdir/usr/lib/cef-$_pkgname/"

    install -Dm644 "$srcdir/Surrealist.desktop" "$pkgdir/usr/share/applications/Surrealist.desktop"
    install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/Surrealist.png"
    install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/Surrealist.png"
    install -Dm644 "src-tauri/icons/64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/Surrealist.png"
    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/Surrealist.png"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

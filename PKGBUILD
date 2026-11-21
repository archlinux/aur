# Maintainer: koh11235813 <koh11235813@gmail.com>
# Contributor: togatoga <>
pkgname='karukan-git'
pkgver=0.1.0.r109.g2f0a00a
pkgrel=1
pkgdesc="Japanese Input Method System for Linux, Neural Kana-Kanji Conversion Engine + fcitx5 IME"
arch=('x86_64')
url="https://github.com/togatoga/karukan"
license=('MIT OR Apache-2.0')
options=('!lto')
depends=('fcitx5' 'oniguruma' 'libgomp' 'hicolor-icon-theme' 'ca-certificates')
makedepends=('cmake' 'extra-cmake-modules' 'rust' 'libxkbcommon' 'clang' 'git')
optdepends=('fcitx5-configtool: GUI configuration tool')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/togatoga/karukan.git")
b2sums=('SKIP')

# Upstream layout, relative to the repository root
_crate="karukan-im/fcitx5"
_addondir="$_crate/fcitx5-addon"

pkgver() {
    cd "${pkgname%-git}"
    local desc cargo_ver=""
    # Testing git describe directly (rather than through a pipeline) keeps its exit
    # status visible without pipefail, which would turn the fallback's failures fatal
    if desc=$(git describe --long --abbrev=7 2>/dev/null); then
        printf '%s' "$desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        # No reachable tag: prefix with the workspace version instead. Upstream keeps it
        # only in the root Cargo.toml's [workspace.package]; every crate inherits it
        cargo_ver=$(awk -F'"' '/^\[/ { s = ($0 == "[workspace.package]") } s && /^version[[:space:]]*=/ { print $2; exit }' Cargo.toml)
        # Falls back to no version prefix if the root Cargo.toml ever stops declaring a literal version
        printf '%sr%s.g%s' "${cargo_ver:+$cargo_ver.}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    rm -rf target
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/${pkgname%-git}/$_addondir"
    export RUSTONIG_SYSTEM_LIBONIG=1
    export RUSTONIG_DYNAMIC_LIBONIG=1
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j$(nproc)
}

package() {
    cd "$srcdir/${pkgname%-git}/$_addondir"
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$srcdir/${pkgname%-git}/LICENSE-MIT" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "$srcdir/${pkgname%-git}/LICENSE-APACHE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}

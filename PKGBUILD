# Maintainer: Antidote1911 <antidote1911@gmail.com>
#
# Hydra64 built from the sources of a release. Two things differ from the AppImage:
#   - Stockfish is the system's package (the program finds /usr/bin/stockfish and registers it as
#     its built-in engine) instead of a copy built with Hydra64;
#   - Qt is the system's.
# What the build would otherwise download is listed in source=(): the docking library (Qt Advanced
# Docking System, built statically, with the fix of cmake/patch-qtads.cmake) and the Rust crates
# (fetched in prepare(), versions pinned by the Cargo.lock files).
#
# New version: change pkgver, then  updpkgsums && makepkg --printsrcinfo > .SRCINFO

pkgname=hydra64
pkgver=1.0.0
pkgrel=1
pkgdesc="Chess databases, engine analysis, play against an engine and engine tournaments"
arch=('x86_64')
url="https://antidote1911.github.io/Hydra64/"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'stockfish' 'libxcb' 'fuse3' 'zlib' 'gcc-libs' 'glibc' 'hicolor-icon-theme')
makedepends=('cmake' 'rust' 'qt6-tools')
conflicts=('hydra64-bin')
_ads=5.1.1
source=("$pkgname-$pkgver.tar.gz::https://github.com/Antidote1911/Hydra64/archive/refs/tags/v$pkgver.tar.gz"
        "qt-advanced-docking-system-$_ads.tar.gz::https://github.com/githubuser0xFFFF/Qt-Advanced-Docking-System/archive/refs/tags/v$_ads.tar.gz")
sha256sums=('b82b1d14a8cbfa11466bde74fa01e371d53bca8b7ebc03f1454718f365ff2ec7'
            '9ce947acbb1984946f9145c976e42e6984f99b98fb414dd7354a290af6d4ff04')

prepare() {
    # The fix the build applies after its own download
    cd "$srcdir/Qt-Advanced-Docking-System-$_ads"
    cmake -P "$srcdir/Hydra64-$pkgver/cmake/patch-qtads.cmake"

    export CARGO_HOME="$srcdir/cargo"
    cd "$srcdir/Hydra64-$pkgver"
    cargo fetch --locked --manifest-path engines/shuffle/Cargo.toml
    cargo fetch --locked --manifest-path src/chessbase/bridge/Cargo.toml
}

build() {
    export CARGO_HOME="$srcdir/cargo" CARGO_NET_OFFLINE=true
    # No path of the build folder in the programs (messages of the Rust crates)
    export RUSTFLAGS="--remap-path-prefix=$srcdir=/usr/src/$pkgname"
    cmake -S "Hydra64-$pkgver" -B build \
        -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DHYDRA64_TESTS=OFF -DBUNDLE_STOCKFISH=OFF \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DFETCHCONTENT_SOURCE_DIR_QTADS="$srcdir/Qt-Advanced-Docking-System-$_ads"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

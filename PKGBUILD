# Maintainer: ind4skylivey <your.email@example.com>
# MateriaTrack - Final Fantasy-themed CLI time tracker

pkgname=materiatrack
pkgver=1.0.3
pkgrel=3
pkgdesc="Mystical Final Fantasy-themed CLI time tracker based on Zeit"
arch=('x86_64' 'aarch64')
url="https://github.com/ind4skylivey/matteria-track"
license=('MIT')
depends=('sqlite' 'gnupg' 'openssl' 'libgit2')
makedepends=('rust' 'cargo' 'pkgconf' 'libssh2')
optdepends=(
    'libnotify: desktop notifications'
    'git: git commit integration'
)
provides=('materiatrack' 'mtrack')
conflicts=('materiatrack-git' 'materiatrack-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ind4skylivey/matteria-track/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8a51681613fcb885868d9e0c35c321c29c5660d0be2cc15811a4de6509874327')

source_x86_64=("materiatrack-$pkgver-x86_64.tar.gz::https://github.com/ind4skylivey/matteria-track/releases/download/v$pkgver/materiatrack-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b03c323358a0c4254285ae1a716c85ee05192ebc8a61a27e1c3cf89d205b03de')

prepare() {
    # On x86_64 we use the prebuilt binary artifact; no prepare needed.
    if [[ $CARCH == "x86_64" ]]; then
        return 0
    fi

    cd "$srcdir/matteria-track-$pkgver"
    # Avoid user/global RUSTFLAGS that might force lld and break bundled libs
    export RUSTFLAGS="-Clink-arg=-fuse-ld=bfd"
    export CC="${CC:-/usr/bin/gcc}"
    export CXX="${CXX:-/usr/bin/g++}"
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER="${CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER:-/usr/bin/gcc}"
    export LIBGIT2_SYS_USE_PKG_CONFIG=1
    export SQLITE3_LIB_DIR="/usr/lib"
    export SQLITE3_INCLUDE_DIR="/usr/include"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    # No build for x86_64 (uses prebuilt binary).
    if [[ $CARCH == "x86_64" ]]; then
        return 0
    fi

    cd "$srcdir/matteria-track-$pkgver"
    export RUSTFLAGS="-Clink-arg=-fuse-ld=bfd"
    export CC="${CC:-/usr/bin/gcc}"
    export CXX="${CXX:-/usr/bin/g++}"
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER="${CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER:-/usr/bin/gcc}"
    export LIBGIT2_SYS_USE_PKG_CONFIG=1
    export SQLITE3_LIB_DIR="/usr/lib"
    export SQLITE3_INCLUDE_DIR="/usr/include"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    if [[ $CARCH == "x86_64" ]]; then
        return 0
    fi

    cd "$srcdir/matteria-track-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    if [[ $CARCH == "x86_64" ]]; then
        tar -xzf "$srcdir/materiatrack-$pkgver-x86_64.tar.gz" -C "$srcdir"
        cd "$srcdir"
        install -Dm755 "materiatrack" "$pkgdir/usr/bin/materiatrack"
        ln -s materiatrack "$pkgdir/usr/bin/mtrack"

        if [ -f "man/materiatrack.1" ]; then
            install -Dm644 "man/materiatrack.1" "$pkgdir/usr/share/man/man1/materiatrack.1"
        fi
        if [ -f "completions/materiatrack.bash" ]; then
            install -Dm644 "completions/materiatrack.bash" \
                "$pkgdir/usr/share/bash-completion/completions/materiatrack"
        fi
        if [ -f "completions/_materiatrack" ]; then
            install -Dm644 "completions/_materiatrack" \
                "$pkgdir/usr/share/zsh/site-functions/_materiatrack"
        fi
        if [ -f "completions/materiatrack.fish" ]; then
            install -Dm644 "completions/materiatrack.fish" \
                "$pkgdir/usr/share/fish/vendor_completions.d/materiatrack.fish"
        fi
        install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
        return 0
    fi

    cd "$srcdir/matteria-track-$pkgver"

    install -Dm755 "target/release/materiatrack" "$pkgdir/usr/bin/materiatrack"
    ln -s materiatrack "$pkgdir/usr/bin/mtrack"

    if [ -f "man/materiatrack.1" ]; then
        install -Dm644 "man/materiatrack.1" "$pkgdir/usr/share/man/man1/materiatrack.1"
    fi
    if [ -f "completions/materiatrack.bash" ]; then
        install -Dm644 "completions/materiatrack.bash" \
            "$pkgdir/usr/share/bash-completion/completions/materiatrack"
    fi
    if [ -f "completions/_materiatrack" ]; then
        install -Dm644 "completions/_materiatrack" \
            "$pkgdir/usr/share/zsh/site-functions/_materiatrack"
    fi
    if [ -f "completions/materiatrack.fish" ]; then
        install -Dm644 "completions/materiatrack.fish" \
            "$pkgdir/usr/share/fish/vendor_completions.d/materiatrack.fish"
    fi

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=4 sw=4 et:

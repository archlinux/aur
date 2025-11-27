# Maintainer: ind4skylivey <your.email@example.com>
# MatteriaTrack - Final Fantasy-themed CLI time tracker

pkgname=materiatrack
pkgver=1.0.4
pkgrel=1
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
sha256sums=('92cb8bf4f1a6073bff61839cd146208417541ec4f5673cb18482cc4b3e5dbc37')

source_x86_64=("materiatrack-$pkgver-x86_64.tar.gz::https://github.com/ind4skylivey/matteria-track/releases/download/v$pkgver/materiatrack-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c262a7b56600bfe3d9413fcdf5533cef1230ac55e607917eaaa5a23bd01c6996')

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
    local prebuilt_dir="$srcdir/materiatrack-$pkgver-x86_64-unknown-linux-gnu"
    local flat_root="$srcdir"

    if [[ -d "$prebuilt_dir" || -f "$flat_root/materiatrack" ]]; then
        local root="$prebuilt_dir"
        if [[ ! -d "$root" ]]; then
            root="$flat_root"
        fi

        install -Dm755 "$root/materiatrack" "$pkgdir/usr/bin/materiatrack"
        ln -s materiatrack "$pkgdir/usr/bin/mtrack"

        if [[ -d "$root/man" ]]; then
            install -d "$pkgdir/usr/share/man/man1"
            cp -a "$root/man/." "$pkgdir/usr/share/man/man1/"
        fi

        if [[ -d "$root/completions" ]]; then
            for f in "$root"/completions/*; do
                [[ -e "$f" ]] || continue
                case "$f" in
                    *_materiatrack) install -Dm644 "$f" "$pkgdir/usr/share/zsh/site-functions/_materiatrack" ;;
                    *.bash) install -Dm644 "$f" "$pkgdir/usr/share/bash-completion/completions/materiatrack" ;;
                    *.fish) install -Dm644 "$f" "$pkgdir/usr/share/fish/vendor_completions.d/materiatrack.fish" ;;
                esac
            done
        else
            # Generate completions on the fly if missing in the artifact
            install -d "$pkgdir/usr/share/bash-completion/completions" "$pkgdir/usr/share/zsh/site-functions" "$pkgdir/usr/share/fish/vendor_completions.d"
            "$pkgdir/usr/bin/materiatrack" completions bash --out-dir "$pkgdir/usr/share/bash-completion/completions" || true
            mv "$pkgdir/usr/share/bash-completion/completions/materiatrack.bash" "$pkgdir/usr/share/bash-completion/completions/materiatrack" 2>/dev/null || true
            "$pkgdir/usr/bin/materiatrack" completions zsh --out-dir "$pkgdir/usr/share/zsh/site-functions" || true
            "$pkgdir/usr/bin/materiatrack" completions fish --out-dir "$pkgdir/usr/share/fish/vendor_completions.d" || true
        fi

        if [[ -f "$root/LICENSE" ]]; then
            install -Dm644 "$root/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        fi
        if [[ -f "$root/README.md" ]]; then
            install -Dm644 "$root/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
        fi
        return 0
    fi

    cd "$srcdir/matteria-track-$pkgver" || exit 1

    install -Dm755 "target/release/materiatrack" "$pkgdir/usr/bin/materiatrack"
    ln -s materiatrack "$pkgdir/usr/bin/mtrack"

    install -Dm644 "man/materiatrack.1" "$pkgdir/usr/share/man/man1/materiatrack.1"
    install -Dm644 "completions/materiatrack.bash" "$pkgdir/usr/share/bash-completion/completions/materiatrack"
    install -Dm644 "completions/_materiatrack" "$pkgdir/usr/share/zsh/site-functions/_materiatrack"
    install -Dm644 "completions/materiatrack.fish" "$pkgdir/usr/share/fish/vendor_completions.d/materiatrack.fish"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=4 sw=4 et:

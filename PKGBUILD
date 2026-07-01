# Maintainer: koh11235813 <koh11235813@gmail.com>
# Contributor: togatoga <>
pkgname='karukan-git'
pkgver=0.1.0.r26.g6746900
pkgrel=1
pkgdesc="Japanese Input Method System for Linux, Neural Kana-Kanji Conversion Engine + fcitx5 IME"
arch=('x86_64')
url="https://github.com/togatoga/karukan"
license=('MIT OR Apache-2.0')
options=('!lto')
depends=('fcitx5' 'openssl' 'oniguruma')
makedepends=('cmake' 'extra-cmake-modules' 'rust' 'libxkbcommon' 'patchelf' 'clang' 'git')
optdepends=('fcitx5-configtool: GUI configuration tool')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/togatoga/karukan.git")
b2sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        {
            local cargo_ver
            cargo_ver=$(grep -m1 '^version' karukan-fcitx5/Cargo.toml | cut -d'"' -f2)
            # Falls back to no version prefix if Cargo.toml ever stops declaring a literal version
            printf "%sr%s.g%s" "${cargo_ver:+$cargo_ver.}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
        }
    )
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    rm -rf target
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/${pkgname%-git}/${pkgname%-git}-fcitx5/fcitx5-addon"
    export LLAMA_BUILD_SHARED_LIBS=1
    export RUSTONIG_SYSTEM_LIBONIG=1
    export RUSTONIG_DYNAMIC_LIBONIG=1
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j$(nproc)
}

package() {
    cd "$srcdir/${pkgname%-git}/${pkgname%-git}-fcitx5/fcitx5-addon"
    DESTDIR="$pkgdir" cmake --install build
    local -A seen_libs=()
    local -a bundled_libs=()
    while IFS= read -r -d '' lib; do
        local base
        base="$(basename "$lib")"
        case "$(basename "$lib")" in
            libllama*.so*|libggml*.so*)
                [[ -n ${seen_libs["$base"]+x} ]] && continue
                seen_libs["$base"]=1
                bundled_libs+=("$lib")
                ;;
        esac
    done < <(find "$srcdir/${pkgname%-git}/target/release/build" \
        -path '*/llama-cpp-sys-2-*/out/lib/lib*.so*' \
        \( -type f -o -type l \) -print0)

    if (( ${#bundled_libs[@]} == 0 )); then
        echo "error: could not find llama/ggml shared libraries to bundle" >&2
        return 1
    fi

    install -d "$pkgdir/usr/lib/fcitx5"
    for lib in "${bundled_libs[@]}"; do
        cp -a "$lib" "$pkgdir/usr/lib/fcitx5/"
    done

    while IFS= read -r -d '' elf; do
        patchelf --set-rpath '$ORIGIN' "$elf"
    done < <(find "$pkgdir/usr/lib/fcitx5" -maxdepth 1 -type f -name '*.so*' -print0)

    install -Dm644 "$srcdir/${pkgname%-git}/LICENSE-MIT" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "$srcdir/${pkgname%-git}/LICENSE-APACHE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}

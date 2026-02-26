# Maintainer: koh11235813 <koh11235813@gmail.com>
# Contributor: togatoga <>
pkgname='karukan'
pkgver='0.1.0'
pkgrel=3
pkgdesc="Japanese Input Method System for Linux, Neural Kana-Kanji Conversion Engine + fcitx5 IME"
arch=('x86_64')
url="https://github.com/togatoga/karukan"
license=('MIT' 'Apache-2.0')
options=('!lto')
depends=('fcitx5' 'openssl' 'oniguruma')
makedepends=('cmake' 'extra-cmake-modules' 'rust' 'libxkbcommon' 'patchelf' 'clang')
optdepends=('fcitx5-configtool: GUI configuration tool')
provides=('karukan')
conflicts=('karukan')
source=("https://github.com/togatoga/karukan/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b7421b3f3eff24954ad89112078bdcde94a38cf522fc134ec6e2c1352add42b7')
prepare() {
    cd "$srcdir/karukan-${pkgver}"
    # Avoid stale llama-cpp-sys CMake caches when rebuilding with different link modes.
    rm -rf target
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
build() {
    cd "$srcdir/karukan-${pkgver}/karukan-im/fcitx5-addon"
    export LLAMA_BUILD_SHARED_LIBS=1
    export RUSTONIG_SYSTEM_LIBONIG=1
    export RUSTONIG_DYNAMIC_LIBONIG=1
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j$(nproc)
}

package() {
    cd "$srcdir/karukan-${pkgver}/karukan-im/fcitx5-addon"
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
    done < <(find "$srcdir/karukan-${pkgver}/target/release/build" \
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

    install -Dm644 "$srcdir/karukan-${pkgver}/LICENSE-MIT" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "$srcdir/karukan-${pkgver}/LICENSE-APACHE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}

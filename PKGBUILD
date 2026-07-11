pkgname=recipe
pkgdesc="WIP DO NOT INSTALL - ML/DL/AI training+inference for AMD/NVIDIA GPUs (fp64)"
pkgver=0.0.r242.460582f
pkgrel=1
url=https://github.com/nm-z/nates-recipe-rs
arch=(x86_64)
license=(MIT)
depends=(rust hip-runtime-amd hipblas hipsolver gcc-libs xz bzip2)
makedepends=(git perl)
options=(!debug !lto)
source=("nates-recipe-rs::git+https://github.com/nm-z/nates-recipe-rs.git")
sha256sums=('SKIP')
export GIT_LFS_SKIP_SMUDGE=1

pkgver() {
    cd nates-recipe-rs
    printf "0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    set -o pipefail
    cd nates-recipe-rs
    unset RUSTFLAGS DEBUG_RUSTFLAGS CFLAGS CXXFLAGS LDFLAGS
    export CARGO_TARGET_DIR="$srcdir/target-pkg"
    cargo build --release -p recipe -p gpu-core -p pantry -p recipe-infer -p ogdl \
        --message-format=json-render-diagnostics \
        | perl -nle 'while (m{"([^"]+/deps/lib[^"]+\.(?:rlib|so))"}g) { print $1 }' \
        | sort -u > "$srcdir/deps.files"
}

package() {
    export SOURCE_DATE_EPOCH=$(git -C "$srcdir/nates-recipe-rs" log -1 --format=%ct)
    local t="$srcdir/target-pkg/release"
    install -Dm755 "$t/recipe" "$pkgdir/usr/bin/recipe"
    install -d "$pkgdir/usr/lib/recipe/deps"
    install -m644 "$t/librecipe.rlib" "$pkgdir/usr/lib/recipe/"
    install -m644 "$t/libogdl.rlib" "$pkgdir/usr/lib/recipe/"
    install -m644 "$t/libgpu_core.rlib" "$pkgdir/usr/lib/recipe/"
    install -m644 "$t/libpantry.rlib" "$pkgdir/usr/lib/recipe/"
    install -m644 "$t/librecipe_infer.rlib" "$pkgdir/usr/lib/recipe/"
    xargs -a "$srcdir/deps.files" install -m644 -t "$pkgdir/usr/lib/recipe/deps/"
    install -Dm644 "$srcdir/nates-recipe-rs/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

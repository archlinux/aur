pkgname=recipe
pkgdesc="Capability-driven AOT scheduling and execution for AMD/NVIDIA GPUs"
pkgver=0.1.1.r443.720916e
pkgrel=1
url=https://github.com/nm-z/nates-recipe-rs
arch=(x86_64)
license=(MIT)
depends=(
    gcc-libs
    glibc
    llvm
)
makedepends=(
    cargo
    git
)
optdepends=(
    'cuda: NVIDIA PTX assembler'
    'hsa-rocr: AMD ROCr/HSA runtime'
    'lld: AMD HSACO linker'
    'nvidia-utils: NVIDIA CUDA Driver library'
)
options=(!debug !lto)
source=("nates-recipe-rs::git+https://github.com/nm-z/nates-recipe-rs.git#branch=main")
sha256sums=('SKIP')
export GIT_LFS_SKIP_SMUDGE=1

pkgver() {
    cd nates-recipe-rs
    printf "0.1.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd nates-recipe-rs
    # The repository config is tuned for its developer workstation. AUR builds
    # must use the distribution toolchain instead of requiring clang and mold.
    rm -f .cargo/config.toml
}

build() {
    cd nates-recipe-rs
    export CARGO_TARGET_DIR="$srcdir/target-pkg"
    cargo build --release --locked --package recipe --bin recipe
}

check() {
    cd nates-recipe-rs
    export CARGO_TARGET_DIR="$srcdir/target-pkg"
    # recipe-text's tokenizer corpus is Git LFS data; source-only AUR builds
    # deliberately skip the multi-gigabyte dataset checkout.
    cargo test --workspace --exclude recipe-text --locked
}

package() {
    local target="$srcdir/target-pkg/release"
    install -Dm755 "$target/recipe" "$pkgdir/usr/bin/recipe"
    install -Dm644 "$srcdir/nates-recipe-rs/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

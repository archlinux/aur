# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=zluda
pkgver=4
pkgrel=3
pkgdesc='A drop-in replacement for CUDA on non-NVIDIA GPUs'
arch=('x86_64')
url='https://github.com/vosen/ZLUDA/'
license=('Apache-2.0 OR MIT')
depends=(
    'comgr'
    'gcc-libs'
    'glibc'
    'hip-runtime-amd')
makedepends=(
    'git'
    'cargo'
    'cmake'
    'ninja'
    'python')
conflicts=('nvidia-utils')
source=("git+https://github.com/vosen/ZLUDA.git#tag=v${pkgver}"
        'git+https://github.com/llvm/llvm-project.git')
sha256sums=('52bddb538ec282f3ba3e20986cb9afc780ea6d9c8bcdbd540814b1efad6a8d66'
            'SKIP')

prepare() {
    git -C ZLUDA submodule init
    git -C ZLUDA config --local submodule.ext/llvm-project.url "${srcdir}/llvm-project"
    git -C ZLUDA -c protocol.file.allow='always' submodule update
    
    export RUSTUP_TOOLCHAIN='stable'
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path='ZLUDA/Cargo.toml'
    
    # llvm: fix build with gcc 15
    # https://github.com/llvm/llvm-project/commit/7e44305041d96b064c197216b931ae3917a34ac1
    git -C ZLUDA/ext/llvm-project cherry-pick --no-commit 7e44305041d96b064c197216b931ae3917a34ac1
}

build() {
    export CFLAGS+=' -ffat-lto-objects'
    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR='target'
    cargo build --release --frozen --all-features --manifest-path='ZLUDA/Cargo.toml'
}

#check() {
#    export CFLAGS+=' -ffat-lto-objects'
#    export RUSTUP_TOOLCHAIN='stable'
#    export CARGO_TARGET_DIR='target'
#    cargo test --frozen --workspace --all-features --manifest-path='ZLUDA/Cargo.toml'
#}

package() {
    find target/release -maxdepth 1 -type f -executable ! -name 'lib*' -exec install -D -m755 -t "${pkgdir}/usr/bin" {} +
    install -D -m644 target/release/lib{nv{cuda,ml},zluda_redirect}.so -t "${pkgdir}/usr/lib"
    install -D -m644 ZLUDA/LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s libnvcuda.so "${pkgdir}/usr/lib/libcuda.so"
    ln -s libnvcuda.so "${pkgdir}/usr/lib/libcuda.so.1"
    ln -s libnvml.so "${pkgdir}/usr/lib/libnvidia-ml.so"
    ln -s libnvml.so "${pkgdir}/usr/lib/libnvidia-ml.so.1"
}

# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=zluda
pkgver=5
pkgrel=3
pkgdesc='A drop-in replacement for CUDA on non-NVIDIA GPUs'
arch=('x86_64')
url='https://github.com/vosen/ZLUDA/'
license=('Apache-2.0 OR MIT')
depends=(
    'gcc-libs'
    'glibc'
    'hip-runtime-amd'
    'hipblaslt'
    'rocblas'
    'rocm-smi-lib')
makedepends=(
    'git'
    'cargo'
    'cmake'
    'ninja'
    'python')
conflicts=('nvidia-utils')
source=("git+https://github.com/vosen/ZLUDA.git#tag=v${pkgver}"
        'git+https://github.com/llvm/llvm-project.git'
        '010-zluda-add-linux-rocm7-support.patch')
sha256sums=('71dc16b62ecdaa6e60f6eb1c717b5385fd789ac6fb646912700a2c5ce21371ce'
            'SKIP'
            '42517a1a2c31040d57ee8731e0fc428db18e76f5625e8ac6d6f8dd7b26f9a862')

prepare() {
    git -C ZLUDA submodule init
    git -C ZLUDA config --local submodule.ext/llvm-project.url "${srcdir}/llvm-project"
    git -C ZLUDA -c protocol.file.allow='always' submodule update
    
    # llvm: fix build with gcc 15
    # https://github.com/llvm/llvm-project/commit/7e44305041d96b064c197216b931ae3917a34ac1
    git -C ZLUDA/ext/llvm-project cherry-pick --no-commit 7e44305041d96b064c197216b931ae3917a34ac1
    
    # add rocm7 support
    # https://github.com/vosen/ZLUDA/commit/522794caff41f6603e0719ce0bc181fc525594f6
    rm ZLUDA/ext/hip_runtime-sys/lib/amdhip64_6.lib
    patch -d ZLUDA -Np1 -i "${srcdir}/010-zluda-add-linux-rocm7-support.patch"
}

build() {
    cd ZLUDA
    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR='target'
    cargo xtask --release
}

package() {
    install -d -m755 "${pkgdir}/usr/lib"
    install -D -m644 ZLUDA/LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -dr --no-preserve='ownership' ZLUDA/target/release/{lib*.so*,zluda_ld} "${pkgdir}/usr/lib"
    find ZLUDA/target/release -maxdepth 1 -type f -executable ! -name 'lib*' -exec install -D -m755 -t "${pkgdir}/usr/bin" {} +
}

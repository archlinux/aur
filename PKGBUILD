# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=zluda
pkgver=5
pkgrel=2
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
        '010-zluda-use-unversioned-libamdhip64.patch')
sha256sums=('71dc16b62ecdaa6e60f6eb1c717b5385fd789ac6fb646912700a2c5ce21371ce'
            'SKIP'
            '074c1a01912ac819922a85d2a34e34c99782be3cae78fddc4069c74f198fbf53')

prepare() {
    git -C ZLUDA submodule init
    git -C ZLUDA config --local submodule.ext/llvm-project.url "${srcdir}/llvm-project"
    git -C ZLUDA -c protocol.file.allow='always' submodule update
    
    # llvm: fix build with gcc 15
    # https://github.com/llvm/llvm-project/commit/7e44305041d96b064c197216b931ae3917a34ac1
    git -C ZLUDA/ext/llvm-project cherry-pick --no-commit 7e44305041d96b064c197216b931ae3917a34ac1
    
    # fix build with rocm7
    patch -d ZLUDA -Np1 -i "${srcdir}/010-zluda-use-unversioned-libamdhip64.patch"
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

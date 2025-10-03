# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=zluda
pkgver=5
pkgrel=1
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
        'git+https://github.com/llvm/llvm-project.git')
sha256sums=('71dc16b62ecdaa6e60f6eb1c717b5385fd789ac6fb646912700a2c5ce21371ce'
            'SKIP')

prepare() {
    git -C ZLUDA submodule init
    git -C ZLUDA config --local submodule.ext/llvm-project.url "${srcdir}/llvm-project"
    git -C ZLUDA -c protocol.file.allow='always' submodule update
    
    # llvm: fix build with gcc 15
    # https://github.com/llvm/llvm-project/commit/7e44305041d96b064c197216b931ae3917a34ac1
    git -C ZLUDA/ext/llvm-project cherry-pick --no-commit 7e44305041d96b064c197216b931ae3917a34ac1
}

build() {
    cd ZLUDA
    cargo xtask --release
}

package() {
    install -D -m644 ZLUDA/target/release/zluda_ld -t "${pkgdir}/usr/lib"
    install -D -m644 ZLUDA/LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -dr --no-preserve='ownership' ZLUDA/target/release/lib*.so* "${pkgdir}/usr/lib"
    find ZLUDA/target/release -maxdepth 1 -type f -executable ! -name 'lib*' -exec install -D -m755 -t "${pkgdir}/usr/bin" {} +
}

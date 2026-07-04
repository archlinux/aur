# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=zluda
pkgver=6
pkgrel=1
pkgdesc='A drop-in replacement for CUDA on non-NVIDIA GPUs'
arch=('x86_64')
url='https://github.com/vosen/ZLUDA/'
license=('Apache-2.0 OR MIT')
depends=(
    'glibc'
    'hip-runtime-amd'
    'hipblaslt'
    'libgcc'
    'libstdc++'
    'miopen-hip'
    'rocblas'
    'rocm-smi-lib'
    'rocsparse')
makedepends=(
    'cargo'
    'cmake'
    'git'
    'git-lfs'
    'ninja'
    'python')
conflicts=('nvidia-utils')
source=("git+https://github.com/vosen/ZLUDA.git#tag=v${pkgver}"
        'llvm-project-vosen'::'git+https://github.com/vosen/llvm-project.git'
        'git+https://github.com/ERGO-Code/HiGHS.git')
sha256sums=('74d395d74e755ea82312d77230f3a06cd8a0a9798b26980fa2dd090018fd0176'
            'SKIP'
            'SKIP')

export GIT_LFS_SKIP_SMUDGE='1'

prepare() {
    git -C ZLUDA lfs install --local
    git -C ZLUDA lfs pull "$(printf '%s' "${source[0]/git+/}" | sed 's/#.*$//')"
    
    git -C ZLUDA submodule init
    git -C ZLUDA config --local submodule.ext/llvm-project.url "${srcdir}/llvm-project-vosen"
    git -C ZLUDA config --local submodule.ext/HiGHS.url "${srcdir}/HiGHS"
    git -C ZLUDA -c protocol.file.allow='always' submodule update
}

build() {
    cd ZLUDA
    export CXXFLAGS+=' -ffat-lto-objects'
    export CARGO_TARGET_DIR='target'
    export RUSTUP_TOOLCHAIN='stable'
    cargo xtask --release
}

package() {
    install -d -m755 "${pkgdir}/usr/lib"
    install -D -m644 ZLUDA/LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -dr --no-preserve='ownership' ZLUDA/target/release/{lib*.so*,zluda_ld} "${pkgdir}/usr/lib"
    find ZLUDA/target/release -maxdepth 1 -type f -executable ! -name 'lib*' -exec install -D -m755 -t "${pkgdir}/usr/bin" {} +
}

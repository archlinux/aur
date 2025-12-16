# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=zluda-git
pkgver=6.preview.35.r0.g754bfbb
pkgrel=1
pkgdesc='A drop-in replacement for CUDA on non-NVIDIA GPUs (git version)'
arch=('x86_64')
url='https://github.com/vosen/ZLUDA/'
license=('Apache-2.0 OR MIT')
depends=(
    'gcc-libs'
    'glibc'
    'hip-runtime-amd'
    'hipblaslt'
    'miopen-hip'
    'rocblas'
    'rocm-smi-lib')
makedepends=(
    'git'
    'cargo'
    'cmake'
    'ninja'
    'python')
provides=('zluda')
conflicts=('zluda' 'nvidia-utils')
source=('git+https://github.com/vosen/ZLUDA.git'
        'llvm-project-vosen'::'git+https://github.com/vosen/llvm-project.git'
        'git+https://github.com/ERGO-Code/HiGHS.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    git -C ZLUDA submodule init
    git -C ZLUDA config --local submodule.ext/llvm-project.url "${srcdir}/llvm-project-vosen"
    git -C ZLUDA config --local submodule.ext/HiGHS.url "${srcdir}/HiGHS"
    git -C ZLUDA -c protocol.file.allow='always' submodule update
}

pkgver() {
    git -C ZLUDA describe --long --tags --abbrev='7' | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
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

# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=zluda-git
pkgver=6.preview.25.r0.g7b8f3a5
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
        'git+https://github.com/ERGO-Code/HiGHS.git'
        '010-zluda-use-unversioned-libamdhip64.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'cc7a56ddd488b8cb4696a54896e00cb3db767ca94b7db8ca9348a290dc148d0b')

prepare() {
    git -C ZLUDA submodule init
    git -C ZLUDA config --local submodule.ext/llvm-project.url "${srcdir}/llvm-project-vosen"
    git -C ZLUDA config --local submodule.ext/HiGHS.url "${srcdir}/HiGHS"
    git -C ZLUDA -c protocol.file.allow='always' submodule update
    
    # fix build with rocm7
    patch -d ZLUDA -Np1 -i "${srcdir}/010-zluda-use-unversioned-libamdhip64.patch"
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

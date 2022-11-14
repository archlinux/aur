# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=zluda
pkgver=2
pkgrel=3
pkgdesc='A drop-in replacement for CUDA on Intel Skylake/Gen9 or newer GPUs'
arch=('x86_64')
url='https://github.com/vosen/ZLUDA/'
license=('Apache' 'MIT')
depends=('opencl-icd-loader' 'level-zero-loader')
makedepends=('git' 'rust' 'opencl-headers' 'level-zero-headers')
conflicts=('nvidia-utils')
source=("git+https://github.com/vosen/ZLUDA.git#tag=v${pkgver}"
        'git+https://github.com/KhronosGroup/SPIRV-Tools.git'
        'git+https://github.com/KhronosGroup/SPIRV-Headers.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    git -C ZLUDA submodule init
    git -C ZLUDA config --local submodule.ext/spirv-tools.url "${srcdir}/SPIRV-Tools"
    git -C ZLUDA config --local submodule.ext/spirv-headers.url "${srcdir}/SPIRV-Headers"
    git -C ZLUDA -c protocol.file.allow='always' submodule update
    cargo fetch --manifest-path='ZLUDA/Cargo.toml'
}

build() {
    cargo build --release --frozen --manifest-path='ZLUDA/Cargo.toml'
}

check() {
    cargo test --release --frozen --manifest-path='ZLUDA/Cargo.toml'
}

package() {
    install -D -m644 ZLUDA/target/release/libnvcuda.so "${pkgdir}/usr/lib/libcuda.so.1"
    install -D -m644 ZLUDA/LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s libcuda.so.1 "${pkgdir}/usr/lib/libcuda.so"
}

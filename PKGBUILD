# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=zluda-git
pkgver=2.r0.g4d3e37b
pkgrel=1
pkgdesc='A drop-in replacement for CUDA on Intel GPUs (git version)'
arch=('x86_64')
url='https://github.com/vosen/ZLUDA/'
license=('Apache' 'MIT')
depends=('opencl-icd-loader' 'level-zero-loader')
makedepends=('git' 'rust' 'opencl-headers' 'level-zero-headers')
provides=('zluda')
conflicts=('zluda' 'nvidia-utils')
source=('git+https://github.com/vosen/ZLUDA.git'
        'git+https://github.com/KhronosGroup/SPIRV-Tools.git'
        'git+https://github.com/KhronosGroup/SPIRV-Headers.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    git -C ZLUDA submodule init
    git -C ZLUDA config --local submodule.ext/spirv-tools.url "${srcdir}/SPIRV-Tools"
    git -C ZLUDA config --local submodule.ext/spirv-headers.url "${srcdir}/SPIRV-Headers"
    git -C ZLUDA submodule update
    cargo fetch --manifest-path='ZLUDA/Cargo.toml'
}

pkgver() {
    git -C ZLUDA describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cargo build --release --frozen --manifest-path='ZLUDA/Cargo.toml'
}

check() {
    cargo test --release --frozen --manifest-path='ZLUDA/Cargo.toml'
}

package() {
    install -D -m755 ZLUDA/target/release/zluda_with -t "${pkgdir}/usr/bin"
    install -D -m644 ZLUDA/target/release/libnvcuda.so -t "${pkgdir}/usr/lib"
    install -D -m644 ZLUDA/target/release/libzluda_redirect.so -t "${pkgdir}/usr/lib"
    install -D -m644 ZLUDA/LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s libnvcuda.so "${pkgdir}/usr/lib/libcuda.so"
    ln -s libnvcuda.so "${pkgdir}/usr/lib/libcuda.so.1"
}

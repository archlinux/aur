# Maintainer: Uyanide <me@uyani.de>
pkgname=fssimu2
pkgver=0.2.0
pkgrel=1
pkgdesc='Fast SSIMULACRA2 derivative implementation in Zig.'
arch=('x86_64' 'aarch64')
url='https://github.com/gianni-rosato/fssimu2'
license=('Apache-2.0')
depends=(
    'glibc'
    'libavif'
    'libwebp'
    'libjpeg-turbo'
)
options=('!debug')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/gianni-rosato/fssimu2/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('5d08a7c64b655733c6bc78da082b6bfa1d33beb27b9fe111289e1ed883a406bf')

prepare() {
    cd "${pkgname}-${pkgver}"
    # Bake version
    sed -i 's|getVersionString(b) catch [^;]*|"'"${pkgver}"'"|' build.zig
    # Enable PIE
    sed -i 's|b\.installArtifact(bin);|bin.pie = true;\n    b.installArtifact(bin);|' build.zig
}

build() {
    cd "${pkgname}-${pkgver}"
    export ZIG_GLOBAL_CACHE_DIR="${srcdir}/.zig-cache"
    zig build --release=fast
}

package() {
    cd "${pkgname}-${pkgver}"
    export ZIG_GLOBAL_CACHE_DIR="${srcdir}/.zig-cache"
    zig build --release=fast --prefix "${pkgdir}"/usr
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed -i "s|${pkgdir}||g" "${pkgdir}/usr/lib/pkgconfig/ssimu2.pc"
}

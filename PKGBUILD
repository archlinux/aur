# Maintainer: Uyanide <me@uyani.de>

pkgname=oavif
pkgver=0.2.1
pkgrel=3
pkgdesc='Target quality AVIF encoding'
arch=('x86_64')
url='https://github.com/gianni-rosato/oavif'
license=('Apache-2.0')
depends=(
    'glibc'
    'libavif'
)
makedepends=(
    'zig'
)
options=('!debug')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/gianni-rosato/oavif/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('1d9011499a53d789ef528ce69ffade37fa4f4f56f828a540b52c14891f2b866a')

prepare() {
    cd "${pkgname}-${pkgver}"
    # Bake version
    sed -i 's|getVersionString(b) catch [^;]*|"'"${pkgver}"'"|' build.zig
    # Prefer dynamic
    sed -i 's/\.preferred_link_mode = \.static/.preferred_link_mode = .dynamic/g' build.zig
    # Enable PIE
    sed -i 's|b\.installArtifact(bin);|bin.pie = true;\n    b.installArtifact(bin);|' build.zig

    export ZIG_GLOBAL_CACHE_DIR="${srcdir}/.zig-cache"
    zig build --fetch
}

build() {
    cd "${pkgname}-${pkgver}"
    export ZIG_GLOBAL_CACHE_DIR="${srcdir}/.zig-cache"
    zig build --release=fast --prefix "$srcdir/dist"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${srcdir}/dist/bin/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

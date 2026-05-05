# Maintainer: Uyanide <me@uyani.de>
pkgname=oavif
pkgver=0.1.3
_fssimu2_ver=0.1.1
pkgrel=4
pkgdesc='Target quality AVIF encoding'
arch=('x86_64' 'aarch64')
url='https://github.com/gianni-rosato/oavif'
license=('Apache-2.0')
depends=(
    'glibc'
    'libavif'
    'libwebp'
    'libjpeg-turbo'
    'libspng'
)
makedepends=(
    'zig'
)
options=('!debug')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/gianni-rosato/oavif/archive/refs/tags/${pkgver}.tar.gz"
    "fssimu2-${_fssimu2_ver}.tar.gz::https://github.com/gianni-rosato/fssimu2/archive/refs/tags/${_fssimu2_ver}.tar.gz"
)
sha256sums=(
    'f9f462a60ca08a59cd1d6576ad1440be3167bd3d5dd77ca950cdb7e71f62d50e'
    '8cd80dcf085f391a94b7aaf62ad1bb2dec2d9e455c4945678f376b9ab71897b2'
)

prepare() {
    cd "${pkgname}-${pkgver}"
    # Bake version
    sed -i 's|getVersionString(b) catch [^;]*|"'"${pkgver}"'"|' build.zig
    # Prefer dynamic
    sed -i 's/\.preferred_link_mode = \.static/.preferred_link_mode = .dynamic/g' build.zig
    # Enable PIE
    sed -i 's|b\.installArtifact(bin);|bin.pie = true;\n    b.installArtifact(bin);|' build.zig
    # Use prefetched fssimu2
    export ZIG_GLOBAL_CACHE_DIR="${srcdir}/.zig-cache"
    zig fetch --save=fssimu2 "${srcdir}/fssimu2-${_fssimu2_ver}.tar.gz"
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

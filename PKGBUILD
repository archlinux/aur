# Maintainer: Uyanide <me@uyani.de>
pkgname=oavif-git
pkgver=0.2.1.r0.g4247db0
pkgrel=2
pkgdesc='Target quality AVIF encoding (git)'
arch=('x86_64')
url='https://github.com/gianni-rosato/oavif'
license=('Apache-2.0')
depends=(
    'glibc'
    'libavif'
)
makedepends=(
    'git'
    'zig'
)
provides=('oavif')
conflicts=('oavif')
options=('!debug')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname%-git}"
    sed -i 's/\.preferred_link_mode = \.static/.preferred_link_mode = .dynamic/g' build.zig
    sed -i 's|b\.installArtifact(bin);|bin.pie = true;\n    b.installArtifact(bin);|' build.zig
    export ZIG_GLOBAL_CACHE_DIR="${srcdir}/.zig-cache"
    zig build --fetch
}

build() {
    cd "${pkgname%-git}"
    export ZIG_GLOBAL_CACHE_DIR="${srcdir}/.zig-cache"
    zig build --release=fast --prefix "${srcdir}/dist"
}

package() {
    cd "${pkgname%-git}"
    install -Dm755 "$srcdir/dist/bin/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

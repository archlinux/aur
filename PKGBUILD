# Maintainer: Sidharth Arya
pkgname=sailer
pkgver=0.1.9
pkgrel=1
pkgdesc="A Wayland compositor written in Zig, built on wlroots"
arch=('x86_64')
url="https://github.com"
license=('MIT')
depends=(
    'wlroots0.19'
    'wayland'
    'libxkbcommon'
    'pixman'
    'freetype2'
    'python-yaml'
)
makedepends=(
    'zig'
    'wayland-protocols'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SidharthArya/sailer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP') # Run 'updpkgsums' to fill this automatically

prepare() {
    cd "${pkgname}-${pkgver}"
    # Pre-fetch Zig dependencies for a clean build
    zig build --fetch
}

build() {
    cd "${pkgname}-${pkgver}"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "${pkgname}-${pkgver}"

    # Binaries
    install -Dm755 zig-out/bin/sailer "$pkgdir/usr/bin/sailer"
    install -Dm755 zig-out/bin/sailer-mcp "$pkgdir/usr/bin/sailer-mcp"
    install -Dm755 zig-out/bin/sailer-msg "$pkgdir/usr/bin/sailer-msg"

    # Wayland session desktop entry
    install -Dm644 contrib/sailer.desktop "$pkgdir/usr/share/wayland-sessions/sailer.desktop"

    # Sample config
    install -Dm644 examples/config.yaml "$pkgdir/usr/share/sailer/config.yaml"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


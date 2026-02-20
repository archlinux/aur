# Maintainer: L.B.R. <lbr@mmonad.com>
pkgname=zmosh-git
_pkgname=zmosh
pkgver=0.4.0.r237.g1dbff97 # This will be updated by pkgver()
pkgrel=1
pkgdesc="Session persistence with auto-reconnect for terminal processes"
arch=('x86_64' 'aarch64')
url="https://github.com/mmonad/zmosh"
license=('MIT')
depends=('glibc')
makedepends=('git' 'zig>=0.15.0')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/mmonad/zmosh.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # Use build.zig.zon version if available
    if [ -f build.zig.zon ]; then
        _ver=$(grep -Po '^\s*\.version\s*=\s*"\K[^"]+' build.zig.zon)
    else
        _ver=$(git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || echo "0.0.0")
    fi
    printf "%s.r%s.g%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    # Fetch dependencies (optional, but good for robust builds)
    # zig fetch --global-cache-dir "$srcdir/zig-cache" build.zig.zon 2>/dev/null || true
}

build() {
    cd "$_pkgname"
    export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache"
    zig build -Doptimize=ReleaseSafe --prefix zig-out
}

package() {
    cd "$_pkgname"
    
    # Install binary
    install -Dm755 zig-out/bin/zmosh "$pkgdir/usr/bin/zmosh"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    
    # Install README
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}

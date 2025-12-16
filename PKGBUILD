# Maintainer: Your Name <your.email@example.com>
pkgname=neowall-git
pkgver=0.4.4.r0.ga382c50
pkgrel=1
pkgdesc="GPU shader wallpapers for Wayland and X11"
arch=('x86_64' 'aarch64')
url="https://github.com/1ay1/neowall"
license=('MIT')
depends=(
    'wayland'
    'mesa'
    'libpng'
    'libjpeg-turbo'
    'libx11'
    'libxrandr'
)
makedepends=(
    'git'
    'meson'
    'ninja'
    'wayland-protocols'
    'pkgconf'
)
provides=('neowall')
conflicts=('neowall')
source=("git+https://github.com/1ay1/neowall.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/neowall"
    # Try to get version from git tags
    if git describe --long --tags 2>/dev/null | grep -q "^v"; then
        git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        # Fallback: use meson.build version + commit count + short hash
        local meson_ver=$(grep "version:" meson.build 2>/dev/null | head -1 | sed "s/.*'\([^']*\)'.*/\1/")
        local commit_count=$(git rev-list --count HEAD)
        local short_hash=$(git rev-parse --short HEAD)
        printf "%s.r%s.g%s" "${meson_ver:-0.4.4}" "$commit_count" "$short_hash"
    fi
}

build() {
    cd "$srcdir/neowall"
    meson setup build --prefix=/usr --buildtype=release
    ninja -C build
}

package() {
    cd "$srcdir/neowall"
    DESTDIR="$pkgdir" ninja -C build install

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

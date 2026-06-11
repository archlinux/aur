# Maintainer: Papaya <me@papayadev.net>
pkgname=lectern-git
pkgver=0.3.0
pkgrel=1
pkgdesc='A configurable, cross-platform markdown viewer'
arch=('x86_64')
url='https://git.papayadev.net/pub/lectern'
license=('LicenseRef-MIT-Commons-Clause')
depends=(
    'gcc-libs'
    'glibc'
    'qt6-base'
    'qt6-svg'
    'qt6-wayland'
    'xdg-desktop-portal'
    'xdg-desktop-portal-impl'
)
makedepends=(
    'cargo'
    'cmake'
    'git'
)
optdepends=(
    'noto-fonts-emoji: color emoji rendering'
    'xorg-server: X11 support'
)
provides=('lectern')
conflicts=('lectern')
source=('lectern::git+https://git.papayadev.net/pub/lectern.git')
sha256sums=('SKIP')
options=('!lto')

pkgver() {
    cd lectern
    local desc
    desc=$(git describe --long --tags --abbrev=7 2>/dev/null) || true
    if [ -n "$desc" ]; then
        echo "$desc" | sed 's/^v//;s/-/.r/;s/-/./g'
    else
        printf '0.3.0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

prepare() {
    cd lectern/parser
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd lectern
    export RUSTUP_TOOLCHAIN=stable
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_SKIP_RPATH=ON
    cmake --build build -j$(nproc)
}

package() {
    cd lectern

    # Binary
    install -Dm755 "build/lectern" "$pkgdir/usr/bin/lectern"

    # Parser library
    install -Dm755 "build/liblectern_parser.so" "$pkgdir/usr/lib/liblectern_parser.so"

    # Desktop entry
    install -Dm644 "assets/lectern.desktop" "$pkgdir/usr/share/applications/lectern.desktop"

    # Icons
    install -Dm644 "assets/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/lectern.svg"
    install -Dm644 "assets/icon-64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/lectern.png"
    install -Dm644 "assets/icon-128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/lectern.png"

    # License
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

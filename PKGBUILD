# Maintainer: Papaya <me@papayadev.net>
pkgname=lectern-git
pkgver=0.1.0
pkgrel=1
pkgdesc='A configurable, cross-platform markdown viewer'
arch=('x86_64')
url='https://git.papayadev.net/pub/lectern'
license=('LicenseRef-MIT-Commons-Clause')
depends=(
    'gcc-libs'
    'glibc'
    'libglvnd'
    'libxkbcommon'
    'wayland'
    'xdg-desktop-portal'
    'xdg-desktop-portal-impl'
)
makedepends=(
    'cargo'
    'git'
)
optdepends=(
    'xorg-server: X11 support'
    'libx11: X11 support'
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
        printf '0.1.0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

prepare() {
    cd lectern
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd lectern
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd lectern
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd lectern

    # Binary
    install -Dm755 "target/release/lectern" "$pkgdir/usr/bin/lectern"

    # Desktop entry
    install -Dm644 "assets/lectern.desktop" "$pkgdir/usr/share/applications/lectern.desktop"

    # Icons
    install -Dm644 "assets/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/lectern.svg"
    install -Dm644 "assets/icon-64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/lectern.png"
    install -Dm644 "assets/icon-128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/lectern.png"

    # License
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

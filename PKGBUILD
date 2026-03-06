# Maintainer: eaholum
pkgname=pave-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Smart window tiling manager for KDE/KWin"
arch=('x86_64')
url="https://github.com/TheVisher/Pave"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libayatana-appindicator'
    'dbus'
    'procps-ng'
)
makedepends=(
    'git'
    'rust'
    'cargo'
    'nodejs'
    'npm'
)
provides=('pave')
conflicts=('pave')
source=("${pkgname}::git+https://github.com/TheVisher/Pave.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    if git describe --long --tags --abbrev=7 2>/dev/null; then
        git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    npm ci
    npx tauri build -b none
}

package() {
    cd "$pkgname"

    # Binary
    install -Dm755 "src-tauri/target/release/pave" "$pkgdir/usr/bin/pave"

    # Desktop file
    install -Dm644 "pave.desktop" "$pkgdir/usr/share/applications/pave.desktop"

    # Icons
    install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/pave.png"
    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/pave.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/pave.png"
    install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/pave.png"

    # License
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

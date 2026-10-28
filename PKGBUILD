# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=loaf-fm-git
pkgver=0.2.1
pkgrel=1
pkgdesc="Material 3 Expressive File Manager built with Qt6 Quick and Rust (git)"
arch=('x86_64')
url="https://github.com/m-uvex/loaf-fm"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('git' 'cargo' 'rust' 'cmake' 'ninja' 'pkgconf' 'clang')
# GCC LTO objects from the cxx-qt C++ side can't be linked by rustc
options=('!lto')
optdepends=('7zip: zip/7z/rar/iso and encrypted archives'
            'udisks2: mount, eject and unlock drives'
            'ffmpegthumbnailer: video thumbnails'
            'xdg-utils: open files with their default application'
            'libsecret: remember encrypted drive passphrases'
            'polkit: Open as Administrator')
provides=('loaf-fm' 'loaf')
conflicts=('loaf-fm' 'loaf')
source=("$pkgname::git+https://github.com/m-uvex/loaf-fm.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    (git describe --long --tags 2>/dev/null || echo "v0.0.0-0-g$(git rev-parse --short HEAD)") \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    cargo build --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/loaf" "$pkgdir/usr/bin/loaf"
    install -Dm644 "packaging/assets/loaf.desktop" "$pkgdir/usr/share/applications/loaf.desktop"
    for sz in 16 32 48 64 128 256 512; do
        install -Dm644 "packaging/assets/icons/hicolor/${sz}x${sz}/apps/loaf.png" \
            "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/loaf.png"
    done
    install -Dm644 "packaging/assets/icons/hicolor/scalable/apps/loaf.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/loaf.svg"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "THIRD-PARTY-LICENSES.md" "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-LICENSES.md"
}

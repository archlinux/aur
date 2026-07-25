# Maintainer: f-o-o-g-s <tollwitch@proton.me>
pkgname=nokkvi-git
pkgver=0.18.3.r0.gc68a77d
pkgrel=1
pkgdesc="A native Rust/Iced desktop client for Navidrome music servers (git HEAD)"
arch=('x86_64')
url="https://github.com/f-o-o-g-s/nokkvi"
license=('GPL-3.0-only')
depends=('pipewire' 'fontconfig' 'alsa-lib' 'hicolor-icon-theme')
makedepends=('rust' 'cargo' 'git' 'cmake')
provides=('nokkvi')
conflicts=('nokkvi' 'nokkvi-bin')
options=('!debug' '!lto' '!buildflags')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    # Produces e.g. 0.3.2.r5.gb12c287 — last tag, commits since, short sha
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    install -Dm755 target/release/nokkvi "${pkgdir}/usr/bin/nokkvi"

    install -Dm644 assets/org.nokkvi.nokkvi.desktop \
        "${pkgdir}/usr/share/applications/org.nokkvi.nokkvi.desktop"

    install -Dm644 assets/org.nokkvi.nokkvi.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.nokkvi.nokkvi.svg"

    install -Dm644 assets/org.nokkvi.nokkvi.png \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/org.nokkvi.nokkvi.png"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

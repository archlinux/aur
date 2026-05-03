# Maintainer: Matteo Stancanelli <mattestanka at gmail dot com>
pkgname=picoforge-git
pkgver=0.5.0+1.r2.g6c003ed
pkgrel=1
pkgdesc="Desktop tool for configuring and managing Pico FIDO security keys"
arch=('x86_64')
url="https://github.com/librekeys/picoforge"
license=('AGPL-3.0-only')
depends=('pcsclite' 'libxcb' 'libxkbcommon' 'systemd-libs')
makedepends=('rust' 'pkg-config' 'git' 'xcb-util-keysyms')
provides=('picoforge')
conflicts=('picoforge')
options=('!debug')
source=("${pkgname}::git+https://github.com/librekeys/picoforge.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    # Strip GCC LTO flags — cc-compiled C objects would contain GIMPLE IR
    # which lld (Rust's linker) cannot read, causing undefined symbols.
    export CFLAGS="${CFLAGS/-flto=auto/}"
    export CXXFLAGS="${CXXFLAGS/-flto=auto/}"
    cargo build --release
}

package() {
    cd "$pkgname"

    install -Dm755 "target/release/picoforge" \
        "$pkgdir/usr/bin/picoforge"
    install -Dm644 "data/in.suyogtandel.picoforge.desktop" \
        "$pkgdir/usr/share/applications/in.suyogtandel.picoforge.desktop"
    install -Dm644 "static/appIcons/in.suyogtandel.picoforge.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/in.suyogtandel.picoforge.svg"
    install -Dm644 "static/appIcons/in.suyogtandel.picoforge-symbolic.svg" \
        "$pkgdir/usr/share/icons/hicolor/symbolic/apps/in.suyogtandel.picoforge-symbolic.svg"
    install -Dm644 "data/in.suyogtandel.picoforge.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/in.suyogtandel.picoforge.metainfo.xml"
}

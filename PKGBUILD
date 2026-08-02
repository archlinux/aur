# Maintainer: Bill Auclair <screenshaver@proton.me>

pkgname=screenshaver
pkgver=0.4.5
pkgrel=1
pkgdesc="Next-generation Linux screensaver and wallpaper manager that renders ISF, ShaderToy and GLSL shaders"
arch=('x86_64')
url="https://github.com/bauclair/screenshaver"
license=('GPL-3.0-or-later')

depends=(
    'glibc'
    'sdl2'
    'sdl2_ttf'
    'libx11'
    'libxss'
)

makedepends=(
    'cargo'
    'pkgconf'
)

source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
)

sha256sums=('d426ef22abfaad5fe1caf6b4da545a499726d9168c5756b8dd943a31c2ecdd76')

prepare() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build \
        --frozen \
        --release
}

check() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo test \
        --frozen
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 \
        "target/release/screenshaver" \
        "$pkgdir/usr/bin/screenshaver"

    install -Dm644 \
        "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 \
        "assets/screenshaver.desktop" \
        "$pkgdir/usr/share/applications/screenshaver.desktop"

    install -Dm644 \
        "assets/screenshaver-splash.png" \
        "$pkgdir/usr/share/screenshaver/screenshaver-splash.png"

    install -d "$pkgdir/usr/share/icons/hicolor"

    cp -a \
        "assets/icons/hicolor/." \
        "$pkgdir/usr/share/icons/hicolor/"
}

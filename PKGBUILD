# Maintainer: Mélanie Chauvel (ariasuni) <aria at ariasuni dot eu>

pkgname=tumelune
pkgver=0.15.0
pkgrel=1
pkgdesc='a simple program to browse and search in twitter and mastodon archives'
arch=(x86_64 i686 pentium4 armv7h aarch64)
license=(unknown)
url=https://fedi.doom.solutions/tumelune/
options=(!lto)
makedepends=(cargo)
source=("https://fedi.doom.solutions/tumelune/files/tumelune-v${pkgver}-source.zip" tumelune.desktop)
sha256sums=('3562520b14d8945c92f1b3cb356f1bac7d4facb3267f0746d010586bd7bd9e36'
            'e444a2095820b3ca1105a78ffff81bfc1d51cda2fd85a9fbcaf7d4427fc37515')

prepare() {
    cd ./tumelune-v${pkgver}-*/
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd ./tumelune-v${pkgver}-*/
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd ./tumelune-v${pkgver}-*/
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    install -Dm644 tumelune.desktop "${pkgdir}/usr/share/applications/tumelune.desktop"
    cd ./tumelune-v${pkgver}-*/
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 static/favicon.png "${pkgdir}/usr/share/icons/tumelune.png"
}

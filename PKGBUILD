# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=storagesifter
pkgver=0.4.0
pkgrel=1
pkgdesc='A fast, GPU-accelerated disk-usage treemap visualizer'
arch=(x86_64)
url=https://fopull.com/storage-sifter
license=(MIT)
depends=(alsa-lib
         glibc
         hicolor-icon-theme
         libgcc
         libx11
         libxcursor
         libxi
         libxkbcommon
         vulkan-icd-loader
         wayland)
makedepends=(cargo)
optdepends=('xdg-utils: open file manager/links from within the app')
source=(https://github.com/Fopull-LLC/StorageSifter/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('49760c46cb1ec439593d87b4eb719e821a8a93e3f2d6ec7c7464ddcb470af7c077192376440dafa89aa5afdc341bd7cee8d1820a526cffda57fddda9cbeaa946')

prepare() {
    cd StorageSifter-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd StorageSifter-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true
    cargo build --frozen --release --all-features
}

check() {
    cd StorageSifter-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd StorageSifter-$pkgver
    install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 assets/icons/$pkgname.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.fopull.StorageSifter.png"
    install -Dm644 packaging/com.fopull.StorageSifter.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 packaging/com.fopull.StorageSifter.metainfo.xml -t "$pkgdir/usr/share/metainfo"
}

# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=storagesifter
pkgver=0.3.0
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
b2sums=('7e0c513518aaab89cde4afd54ee2d3c21d614279f61ca7dbb467c21def9d1448191fc68d0c8cc46e81edcea6d7c24cd67ff3c4e1f895a4cd3eedad794326e0f8')

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

# Maintainer: Craig McLure <craig@mclure.net>
pkgname=pipeweaver
pkgver=0.1.9
pkgrel=1
pkgdesc="An audio management tool for Linux built on top of PipeWire, designed specifically with streaming and broadcasting in mind."
arch=('x86_64')
url="https://github.com/pipeweaver/pipeweaver"
license=('MIT')
depends=('pipewire')
makedepends=('git' 'rust' 'cargo' 'clang' 'npm')
optdepends=('pipeweaver-app: An application wrapper for the Pipeweaver UI')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pipeweaver/pipeweaver/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('b1f16a8065125b80ca887220059c3d8a664fa3e40c40393369b2a00f7036c62eb72e2e44372b654db05509c4fced9ac8c305dfb82262ee9c37751ba41db05ac1')
options=(!lto)

prepare() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --workspace --exclude pipeweaver-app --all-features --release --frozen
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --frozen
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"


    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/icons/hicolor/48x48/apps/"
    install -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    install -d "${pkgdir}/usr/share/pixmaps/"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"


    install -m755 target/release/pipeweaver-daemon "$pkgdir/usr/bin/pipeweaver-daemon"
    install -m755 target/release/pipeweaver-client "$pkgdir/usr/bin/pipeweaver-client"

    install -m644 daemon/resources/icons/pipeweaver.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/pipeweaver.png"
    install -m644 daemon/resources/icons/pipeweaver.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/pipeweaver.svg"
    install -m644 daemon/resources/icons/pipeweaver-large.png "$pkgdir/usr/share/pixmaps/pipeweaver.png"
    install -m644 daemon/resources/desktop/pipeweaver.desktop "$pkgdir/usr/share/applications/pipeweaver.desktop"

  
    install -m644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

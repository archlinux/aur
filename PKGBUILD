# Maintainer: Craig McLure <craig@mclure.net>
pkgname=pipeweaver-app
_pkgbase=pipeweaver
pkgver=0.1.9
pkgrel=1
pkgdesc="An application wrapper for the Pipeweaver UI"
arch=('x86_64')
url="https://github.com/pipeweaver/pipeweaver"
license=('MIT')
depends=('pipeweaver' 'qt6-webengine')
makedepends=('git' 'rust' 'cargo')

source=("$_pkgbase-$pkgver.tar.gz::https://github.com/pipeweaver/pipeweaver/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('b1f16a8065125b80ca887220059c3d8a664fa3e40c40393369b2a00f7036c62eb72e2e44372b654db05509c4fced9ac8c305dfb82262ee9c37751ba41db05ac1')
options=('!lto') # build fails with lto enabled

prepare() {
    cd "$_pkgbase-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "$_pkgbase-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -p pipeweaver-app --all-features --release --frozen
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"

    install -m755 "target/release/pipeweaver-app" "$pkgdir/usr/bin/pipeweaver-app"
    install -m644 app/resources/pipeweaver-app.desktop "$pkgdir/usr/share/applications/pipeweaver-app.desktop"

    # The README and LICENSE are provided by pipeweaver, so we don't need a specific install
}

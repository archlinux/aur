# Maintainer: Craig McLure <craig@mclure.net>
pkgname=pipeweaver-app
_pkgbase=pipeweaver
pkgver=0.1.3
pkgrel=1
pkgdesc="An application wrapper for the Pipeweaver UI"
arch=('x86_64')
url="https://github.com/pipeweaver/pipeweaver"
license=('MIT')
depends=('pipeweaver' 'qt6-webengine')
makedepends=('git' 'rust' 'cargo')

source=("$_pkgbase-$pkgver.tar.gz::https://github.com/pipeweaver/pipeweaver/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('5f52f54d5064b20c0aaa6600d8b846896ef2a0e0acb9d56dab1da0a10f553547e96f5e88bbb6e53f68a86d1030a5614a0ec67f0f6842fd03887df106eb1453b8')
options=('!lto') # build fails with lto enabled

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

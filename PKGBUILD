# Maintainer: Craig McLure <craig@mclure.net>
pkgname=pipeweaver-app
_pkgbase=pipeweaver
pkgver=0.1.6
pkgrel=1
pkgdesc="An application wrapper for the Pipeweaver UI"
arch=('x86_64')
url="https://github.com/pipeweaver/pipeweaver"
license=('MIT')
depends=('pipeweaver' 'qt6-webengine')
makedepends=('git' 'rust' 'cargo')

source=("$_pkgbase-$pkgver.tar.gz::https://github.com/pipeweaver/pipeweaver/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('206252b1adeb6be3e3dbfcedf2710074a1ebd8766bd32f4b34be120c93ac0724302a8493247f826f58d6ef142529f65c2e07775cf90c0ec235b56f586fa31b5e')
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

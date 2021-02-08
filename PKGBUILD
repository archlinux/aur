# Maintainer: Jack Wu <origincode@aosc.io>
pkgname=ciel
_pkgname=${pkgname}-rs
_pkgver=3.0.0-rc5
pkgver=${_pkgver/-/}
pkgrel=3
pkgdesc="A tool for controlling multi-layer file systems and containers."
arch=('i686' 'x86_64')
url="https://github.com/AOSC-Dev/ciel-rs"
license=('MIT')
depends=('systemd' 'dbus' 'openssl')
makedepends=('rust' 'make' 'gcc')
optdepends=('libgit2: git vcs support'
            'xz: xzip archive support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AOSC-Dev/${_pkgname}/archive/v${_pkgver}.tar.gz")
sha256sums=('3e22786298d56a624c324d116e5445cd053dbd2634c089d8f77d1c8f1a650db2')
conflicts=('ciel-git')

build() {
    cd ${_pkgname}-${_pkgver}
    cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd ${_pkgname}-${_pkgver}
    install -Dm755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"

    # Rename the binary
    mv -v "${pkgdir}/usr/bin/ciel-rs" "${pkgdir}/usr/bin/ciel"

    # Install assets
    PREFIX="${pkgdir}/usr/" ./install-assets.sh

    # Install the license
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

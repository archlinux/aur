# Maintainer: Jack Wu <origincode@aosc.io>
pkgname=ciel
_pkgname=${pkgname}-rs
_pkgver=3.0.0-rc1
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc="A tool for controlling multi-layer file systems and containers."
arch=('i686' 'x86_64')
url="https://github.com/AOSC-Dev/ciel-rs"
license=('MIT')
depends=('systemd' 'dbus' 'openssl')
makedepends=('rust' 'make' 'gcc')
optdepends=('libgit2: git vcs support'
            'xz: xzip archive support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AOSC-Dev/${_pkgname}/archive/v${_pkgver}.tar.gz"
        "https://raw.githubusercontent.com/AOSC-Dev/${_pkgname}/master/LICENSE")
sha256sums=('fe0259d9bc90e6408132c3d4bc2a64cd57bf97a2d63ff8aeaaf7211998846d8f'
            '612bf4162e0b9f8ee7ef4612ad6fd37e39a33311dc996360583350ba4ea7ae93')

build() {
    cd ${_pkgname}-${_pkgver}
    cargo build --release --locked --all-features --target-dir=target
}

package() {
    # Install the license
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE    

    cd ${_pkgname}-${_pkgver}
    install -Dm755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
    
    # Rename the binary
    mv -v "${pkgdir}/usr/bin/ciel-rs" "${pkgdir}/usr/bin/ciel"

    # Install assets
    PREFIX="${pkgdir}/usr/" ./install-assets.sh
}

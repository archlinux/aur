# Maintainer:   echo -n 'TWF0dCBDLiA8bWF0dEBnZXRjcnlzdC5hbD4='     | base64 -d
# Contributor:  echo -n 'YXh0bG9zIDxheHRsb3NAZ2V0Y3J5c3QuYWw+'     | base64 -d
# Contributor:  echo -n 'TWljaGFsIFMuIDxtaWNoYWxAZ2V0Y3J5c3QuYWw+' | base64 -d

pkgname=ame
_pkgname=amethyst
pkgver=4.0.2
pkgrel=1
_codename='Funky Fish'
pkgdesc='A fast and efficient AUR helper'
arch=('x86_64' 'aarch64')
url="https://github.com/crystal-linux/${_pkgname}"
license=('GPL3')
depends=(
    'git'
    'pacman-contrib'
    'vim'
    'expac'
    'less'
)
makedepends=('cargo')
source=("${_pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d4174788608c34fe9eb5854b6c21a7b460930d567fe4262e492762a8377f5467')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    export AMETHYST_CODENAME="${_codename}"
    cargo build --frozen --release
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 docs/CONFIG.md "${pkgdir}/usr/share/doc/${pkgname}/CONFIG.md"
}

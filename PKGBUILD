# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=seekr
pkgver=0.0.3
pkgrel=1
pkgdesc="System search util for linux"
arch=('any')
url="https://github.com/luxluth/seekr"
license=('MIT')
depends=(
    'gtk4'
)
makedepends=(
    'rust'
    'curl'
    'git'
    'gendesk'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('1ccce07c8f909369ad499545f1c56647142b4fd3d1522b91c6d42fa1796564c5')
build() {
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CARGO_HOME="${srcdir}/.cargo"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
        export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
    fi
    cargo build --release
}
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
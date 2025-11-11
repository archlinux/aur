# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=seekr
pkgver=0.1.3
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
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
)
sha256sums=('1e720d3416efdfdda4ba9468b3a0f46453cbf24ec86c616ae4df9e3832a0f7a4')
prepare() {
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname}"
}
build() {
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

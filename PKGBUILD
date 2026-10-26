# Maintainer: taotieren <admin@taotieren.com>

pkgbase=wyc
pkgname=wyc
pkgver=8.0.11
pkgrel=3
pkgdesc="网云穿最便捷的端口映射"
license=('LicenseRef-scancode-commercial-license')
url="https://wangyunchuan.com"
arch=('x86_64' 'aarch64')
options=(!strip !debug)
depends=(
    sh
)
makedepends=(libarchive)
provides=(${pkgname} ${pkgname}-bin)
conflicts=(${pkgname} ${pkgname}-bin)
replaces=()
backup=(etc/wangyunchuan/config.json)
install=${pkgname}.install
source=(
    "wangyunchuan.service"
    "wangyunchuan.tmpfiles"
    "wangyunchuan.sysusers"
    "${pkgname}.install"
)
source_x86_64=("${pkgname}-clent-linux-x64-${pkgver}.tar.gz::https://update.too1.net/d/wyc/stable/linux-service/linux-x86_64-tar-gz?source=wyc_official")
source_aarch64=("${pkgname}-clent-linux-arm64-${pkgver}.tar.gz::https://update.too1.net/d/wyc/stable/linux-service/linux-arm64-tar-gz?source=wyc_official")
sha256sums=('b43ded86c239ef44c4f9b7dcac115507fda82719c3f9c02d3f6acc568e7a1b0a'
            'b52e4b5775e62bed88beea845bdb2740440c398aed363f0b256a8c8901a89183'
            '1f64b0ebd17ccbf69024e62622816474800f07049a5a5bc85ede142a0ea77523'
            '138f00be0f1c0a8b2a16728e0f146d837f009ae18aeff3c7bee1c08a9fb37e2f')
sha256sums_x86_64=('75ed6c88c05fd7fc637271a9c2fc79eff2241a3c22e9cbf7dff0a9edd453806b')
sha256sums_aarch64=('8efe0b7cec593666e1b6604cd97738ff95a31b081ad6155871e380f6f73941b4')
noextract=(
    "${pkgname}-clent-linux-x64-${pkgver}.tar.gz"
    "${pkgname}-clent-linux-arm64-${pkgver}.tar.gz"
)

package() {
    local _tar _src
    case "$CARCH" in
        x86_64)  _tar="${pkgname}-clent-linux-x64-${pkgver}.tar.gz" ;;
        aarch64) _tar="${pkgname}-clent-linux-arm64-${pkgver}.tar.gz" ;;
        *)       error "不支持的架构: $CARCH"; return 1 ;;
    esac
    _src="${srcdir}/wyc-${CARCH}"
    install -d "${_src}"
    bsdtar -xf "${srcdir}/${_tar}" -C "${_src}"

    install -vDm755 "${_src}/wyc-client" "${pkgdir}/usr/bin/wyc"

    install -vDm644 "${srcdir}/wangyunchuan.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -vDm644 "${srcdir}/wangyunchuan.sysusers" "${pkgdir}/usr/lib/sysusers.d/wangyunchuan.conf"
    install -vDm644 "${srcdir}/wangyunchuan.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/wangyunchuan.conf"

    install -vDm644 "${_src}/LICENSE.md" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.md"
    install -vDm644 "${_src}/README.md" "${pkgdir}/usr/share/doc/$pkgname/README.md"
    install -vDm644 "${_src}/PRIVACY.md" "${pkgdir}/usr/share/doc/$pkgname/PRIVACY.md"
    install -vDm644 "${_src}/CONFIG.example.json" "${pkgdir}/etc/wangyunchuan/config.json"
}

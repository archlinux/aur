# Maintainer: Chapman <touch65536@gmail.com>

pkgname=tencent-qq
_base_pkgver=3.2.35-54395
pkgver=3.2.35_54395
pkgrel=1
pkgdesc="Tencent QQ for Linux with native Wayland auto-detection and secure Bubblewrap sandbox"
arch=('x86_64' 'aarch64' 'loong64')
url="https://im.qq.com/linuxqq/"
license=('LicenseRef-Proprietary')
provides=('qq' 'linuxqq' 'tencent-qq-bin')
conflicts=('qq' 'linuxqq' 'linuxqq-nt-bwrap' 'tencent-qq-bin')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'bubblewrap'
    'gjs'
    'gtk3'
    'libnotify'
    'nss'
)
optdepends=(
    'libappindicator-gtk3: System tray icon support'
)
options=(!strip !debug)

source=(
    "qq.sh"
    "qq.desktop"
    "LICENSE"
)

_url_prefix="https://qqdl.gtimg.cn/qqfile/QQNT/9.9.37/beta/816b3c79"
source_x86_64=("${pkgname}-${pkgver}-amd64.deb::${_url_prefix}/linuxqq_${_base_pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb::${_url_prefix}/linuxqq_${_base_pkgver}_arm64.deb")
source_loong64=("${pkgname}-${pkgver}-loongarch64.deb::${_url_prefix}/linuxqq_${_base_pkgver}_loongarch64.deb")

noextract=("${pkgname}-${pkgver}-"{amd64,arm64,loongarch64}.deb)

sha256sums=(
    'aeff82a282e0f5f68b070b07627b0c0597d80eb217da29828d3ce168a89038cd'
    'a06f6e4f1674de4bc4895d8e499d83814b2fefea88b3c1cbf49621c137495ba9'
    '74ebe2e5775c75d1e62a76ea0304bc77851ee5db92e539b94af264d25ac184dc'
)

sha256sums_x86_64=(
    '7de03862327abbd16da27130413698c9517782b27194afc593bc3abf9b55f9ac'
)
sha256sums_aarch64=(
    '5f93ea62347dd772c7be4115413c95d2a60d189f3dd81bc194834bd4d7343cf2'
)
sha256sums_loong64=(
    'e41dcfcf6729610e5db9a5090964fb01f4487f85f27858301f0c9d3eee747d58'
)

prepare() {
    local _deb_arch
    case "${CARCH}" in
        x86_64) _deb_arch="amd64" ;;
        aarch64) _deb_arch="arm64" ;;
        loong64) _deb_arch="loongarch64" ;;
    esac

    rm -f data.tar.*
    bsdtar -xf "${pkgname}-${pkgver}-${_deb_arch}.deb" 'data.tar.*'
}

package() {
    # Extract data from deb
    bsdtar -xf data.tar.* -C "${pkgdir}"

    # Install custom native Wayland + privacy sandbox launcher
    install -Dm755 "${srcdir}/qq.sh" "${pkgdir}/usr/bin/qq"
    ln -sf qq "${pkgdir}/usr/bin/${pkgname}"
    ln -sf qq "${pkgdir}/usr/bin/linuxqq"

    # Install clean desktop entry
    install -Dm644 "${srcdir}/qq.desktop" "${pkgdir}/usr/share/applications/qq.desktop"

    # Remove known vulnerable bundled libssh2
    rm -f "${pkgdir}/opt/QQ/resources/app"/libssh2.so.1 \
          "${pkgdir}/opt/QQ/resources/app/avsdk/bugly"/libssh2.so.1 2>/dev/null || true

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

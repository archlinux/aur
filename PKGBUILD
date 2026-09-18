# Maintainer: Chapman <touch65536@gmail.com>

pkgname=tencent-qq
_base_pkgver=3.2.33-52892
pkgver=3.2.33_52892
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

_url_prefix="https://qqdl.gtimg.cn/qqfile/QQNT/9.9.35/beta/1763096b"
source_x86_64=("${pkgname}-${pkgver}-amd64.deb::${_url_prefix}/linuxqq_${_base_pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb::${_url_prefix}/linuxqq_${_base_pkgver}_arm64.deb")
source_loong64=("${pkgname}-${pkgver}-loongarch64.deb::${_url_prefix}/linuxqq_${_base_pkgver}_loongarch64.deb")

noextract=("${pkgname}-${pkgver}-"{amd64,arm64,loongarch64}.deb)

sha256sums=(
    '0ba550960aaf275d0a896bdf31ccc888cdfd5e20f4ba66b28e1e229f2f391be8'
    'a06f6e4f1674de4bc4895d8e499d83814b2fefea88b3c1cbf49621c137495ba9'
    '74ebe2e5775c75d1e62a76ea0304bc77851ee5db92e539b94af264d25ac184dc'
)

sha256sums_x86_64=(
    '502a978f2d03af9f21acefc461f9d1d1fe09b65bad620bbfcdb589a79ac53b7e'
)
sha256sums_aarch64=(
    '806e036ee1c19ffeae22f19b5f0c2e1a7789abb5f4383bd67309995a73ea26de'
)
sha256sums_loong64=(
    '3a26ac8bba6b1a007f34d4c007ca2ccf71565cbb2dd47814eee044861d124e43'
)

prepare() {
    local _deb_arch
    case "${CARCH}" in
        x86_64) _deb_arch="amd64" ;;
        aarch64) _deb_arch="arm64" ;;
        loong64) _deb_arch="loongarch64" ;;
    esac

    bsdtar -xf "${pkgname}-${pkgver}-${_deb_arch}.deb" data.tar.xz
}

package() {
    # Extract data from deb
    bsdtar -xf data.tar.xz -C "${pkgdir}"

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

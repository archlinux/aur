# Maintainer: lzsnyy <710080675@qq.com>
# Contributor: syrizelink (original author) <https://github.com/syrizelink>

pkgname=openfic-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="OpenFic — 跨平台、AI Native 的一站式小说创作工具 (官方预编译版)"
arch=('x86_64' 'aarch64')
url="https://github.com/syrizelink/OpenFic"
license=('Apache-2.0')
depends=('gtk3' 'nss' 'alsa-lib' 'libxkbcommon' 'libxcomposite' 'libxdamage'
         'libxrandr' 'libcups' 'libdrm' 'mesa')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/OpenFic-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/OpenFic-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('2acb6870f59062df60edbf5c5eda4d9b94ee097a50459dea75fef7a3a57d9733')
sha256sums_aarch64=('febfdbf3b356503caf80b8317da780ec40cd17e75f329ee3f4777643a76896d5')

package() {
    local _dir="OpenFic-${pkgver}-linux-${CARCH/x86_64/x64}"
    _dir="${_dir/aarch64/arm64}"

    # Electron 应用整体安装到 /opt/OpenFic
    install -d "${pkgdir}/opt"
    cp -a --no-preserve=ownership "${_dir}" "${pkgdir}/opt/${pkgname%-bin}"

    # Electron 的 chrome-sandbox 需要 setuid root
    install -d "${pkgdir}/usr/bin"
    chmod 4755 "${pkgdir}/opt/${pkgname%-bin}/chrome-sandbox"
    ln -s "/opt/${pkgname%-bin}/openfic-desktop" "${pkgdir}/usr/bin/openfic"

    # 桌面入口与图标
    install -Dm644 "${_dir}/resources/frontend-dist/pwa-icons/icon-512.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/openfic.png"
    install -Dm644 /dev/null "${pkgdir}/usr/share/applications/openfic.desktop"
    cat > "${pkgdir}/usr/share/applications/openfic.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=OpenFic
Comment=AI Native 的一站式小说创作工具
Exec=/usr/bin/openfic
Icon=openfic
Categories=Office;TextEditor;
StartupWMClass=openfic-desktop
EOF

    install -Dm644 "${_dir}/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}

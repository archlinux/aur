# Maintainer: comalot <joegodwanggod@gmail.com>
# 純官方來源的 FlClash PKGBUILD - 使用 AppImage (100% from official GitHub)

pkgname=flclash-appimage-bin
_pkgname=FlClash
pkgver=0.8.91
pkgrel=2
pkgdesc="A multi-platform proxy client based on ClashMeta, simple and easy to use, open-source and ad-free"
arch=('x86_64')
url="https://github.com/chen08209/FlClash"
license=('GPL-3.0-only')
depends=('gtk3' 'libayatana-appindicator' 'libkeybinder3' 'hicolor-icon-theme')
provides=('flclash')
conflicts=('flclash' 'flclash-bin')
options=('!strip')

# 來源 100% 來自官方 GitHub
source_x86_64=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.AppImage")
sha256sums_x86_64=('fdb76b7d9c1b40a434923f16b92db96d6843f6ab8e360fd8b6d0a35b5dff5738')

prepare() {
    chmod +x "${srcdir}/${_pkgname}-${pkgver}.AppImage"

    # 解壓 AppImage
    cd "${srcdir}"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null 2>&1
}

package() {
    cd "${srcdir}/squashfs-root"

    # 安裝主程式目錄
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"

    # 複製主程式和核心
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/lib/${pkgname}/${_pkgname}"
    install -Dm755 "${_pkgname}Core" "${pkgdir}/usr/lib/${pkgname}/${_pkgname}Core"

    # 複製 data 目錄
    cp -r data "${pkgdir}/usr/lib/${pkgname}/"

    # 複製 lib 目錄 (所有 .so 檔案)
    cp -r lib "${pkgdir}/usr/lib/${pkgname}/"

    # 建立啟動腳本
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/flclash" <<'EOF'
#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/flclash-appimage-bin"
_RUNNAME="${_APPDIR}/FlClash"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${LD_LIBRARY_PATH}"
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec "${_RUNNAME}" "$@" || exit $?
EOF

    # 安裝圖示
    install -Dm644 "usr/share/icons/hicolor/128x128/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/flclash.png"
    install -Dm644 "usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/flclash.png"

    # 建立 desktop 檔案
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/flclash.desktop" <<EOF
[Desktop Entry]
Name=FlClash
Comment=A multi-platform proxy client based on ClashMeta
Exec=flclash %U
Icon=flclash
Terminal=false
Type=Application
Categories=Network;
StartupWMClass=com.follow.clash
Keywords=proxy;clash;vpn;
EOF
}

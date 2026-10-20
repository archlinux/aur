# Maintainer: sun.wang <sunowsir@163.com>
pkgname=plexo-appimage
pkgver=1.0.0rc15
pkgrel=1
pkgdesc="Speed up downloads by combining multiple network connections in parallel."
arch=('x86_64')
url="https://github.com/anmolkapil/plexo"
license=('MIT')
depends=('fuse2' 'hicolor-icon-theme' 'zlib')
optdepends=('pacman-contrib: rankmirrors script')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")

_upver='1.0.0-rc.15'
_appimage="plexo-${_upver}-x86_64.AppImage"

source=("https://github.com/anmolkapil/plexo/releases/download/v${_upver}/${_appimage}")
sha256sums=('b90e9b3b852140f5031623fc85c6d6a2939b04da50b1127d51fd9880a57d275c')

package() {
    install -Dm755 "${_appimage}" \
      "${pkgdir}/opt/${pkgname}/plexo.AppImage"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/plexo.AppImage" \
      "${pkgdir}/usr/bin/plexo"

    # 自动从 AppImage 里提取图标（需要先 chmod +x）
    chmod +x "${srcdir}/${_appimage}"
    cd "${srcdir}"
    "${srcdir}/${_appimage}" --appimage-extract >/dev/null 2>&1
    if [ -f "${srcdir}/squashfs-root/plexo.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/plexo.png" \
            "${pkgdir}/usr/share/pixmaps/plexo.png"
    fi

    # 安装 .desktop 文件
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/plexo.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Plexo
GenericName=Meeting Notes
Comment=A local-first, beautiful meeting notes app
Exec=plexo %F
Icon=plexo
Terminal=false
Categories=Office;Utility;
StartupNotify=true
StartupWMClass=Plexo
MimeType=text/plain;application/x-markdown;
EOF

}


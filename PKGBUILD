# Maintainer: rzhli tayuebuliuhen@gmail.com
pkgname='ftnn-desktop'
pkgver='16.4.14908'
pkgrel=1
pkgdesc="Futu，富途，股票软件"
arch=('x86_64')
url="https://www.futunn.com/"
license=('custom')

depends=(
    'glibc'
    'qt5-base'
    'qt6-webengine'
    'qt5-webchannel'
    'qt5-multimedia'
    'hicolor-icon-theme'
    'qt5-x11extras'
    'nss'
    'libxss'
    'libxcrypt-compat'
    'xdg-utils'
)

source=("https://softwaredownload.futunn.com/FTNN_desktop_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    # 进入 src 目录解压
    bsdtar -xf "FTNN_desktop_${pkgver}_amd64.deb"
    bsdtar -xf data.tar.* -C "${pkgdir}"

    # 修复权限
    chmod +x "${pkgdir}/opt/FTNN/FTNN"

    # 建立软链接
    install -d "${pkgdir}/usr/bin"
    ln -sf /opt/FTNN/FTNN "${pkgdir}/usr/bin/ftnn"

    # 图标安装
    install -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
    if [ -f "${pkgdir}/opt/FTNN/app.png" ]; then
        install -m644 "${pkgdir}/opt/FTNN/app.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ftnn.png"
    fi

    # 桌面文件
    install -d "${pkgdir}/usr/share/applications"
    cat <<EOF > "${pkgdir}/usr/share/applications/ftnn.desktop"
[Desktop Entry]
Name=FTNN 富途牛牛
Comment=Trade stocks
Exec=ftnn %U
Icon=ftnn
Terminal=false
Type=Application
Categories=Finance;
StartupWMClass=FTNN
MimeType=x-scheme-handler/futu;
EOF
}

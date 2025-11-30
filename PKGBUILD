# Maintainer: Your Name <your.email@example.com>
pkgname=markpix-bin
_pkgname=markpix
pkgver=0.2.0
pkgrel=1
pkgdesc="A modern cross-platform image annotation tool built with Tauri (Binary)"
arch=('x86_64')
url="https://github.com/jswysnemc/markpix"
license=('MIT')
options=('!strip' '!debug')
provides=("$_pkgname")
conflicts=("$_pkgname")

# 运行时依赖 (根据你的 README 转换)
depends=(
    'webkit2gtk-4.1'      # libwebkit2gtk-4.1-dev
    'libappindicator-gtk3' # libappindicator3-dev
    'librsvg'             # librsvg2-dev
    'wl-clipboard'        # 剪贴板支持
    'gtk3'
    'openssl'
)

# 这里假设 GitHub Release 的文件名是 markpix-0.1.1amd64
# 如果你的文件名不同，请修改 source 结尾的部分
source=("${_pkgname}-${pkgver}::https://github.com/jswysnemc/markpix/releases/download/v${pkgver}/markpix-${pkgver}.x86_64"
        "LICENSE::https://raw.githubusercontent.com/jswysnemc/markpix/main/LICENSE"
        "markpix.png::https://raw.githubusercontent.com/jswysnemc/markpix/main/src-tauri/icons/icon.png")

sha256sums=('a2427764eca0b7c64e179fb7cb6a333d9efc47d65a1406e78f795845d5999fe6'
            '9a46a71b6c82da530bc5f2d5e568bc4ae5d1d0f3e95510a85ab2cfbf048c6c24'
            '4a47002bdb250f027d14af191999ebe7f5daa6669e81e41a32bcd27a700ff066')

package() {
    # 1. 安装二进制文件
    # 注意：下载的文件被重命名为了 ${_pkgname}-${pkgver}
    install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

    # 2. 安装 License 和 图标
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 markpix.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    # 3. 创建 Desktop Entry (因为纯二进制文件通常不带这个，我们需要手动生成以确保它出现在菜单里)
    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=MarkPix
Comment=A modern cross-platform image annotation tool
Exec=${_pkgname} %f
Icon=markpix
Terminal=false
Categories=Graphics;Utility;
MimeType=image/png;image/jpeg;image/bmp;image/gif;
Keywords=screenshot;annotation;
EOF
    # 注意：上面的 Icon 暂时用了通用图标。
    # 如果你的仓库里有 logo.png，建议添加到 source 中并安装到 /usr/share/pixmaps/markpix.png
}

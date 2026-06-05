# Maintainer: taotieren <admin@taotieren.com>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=lceda-pro-bin
_pkgname=lceda-pro
pkgver=3.2.149
pkgrel=1
pkgdesc="免费、专业、强大的国产PCB设计工具"
arch=("x86_64" "aarch64")
url="https://pro.lceda.cn/"
license=("LicenseRef-LCEDA-Proprietary")
depends=("gtk3" "nss" "alsa-lib")
makedepends=("curl")
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-electron")
install=$pkgname.install
source=("$pkgname.install")
source_x86_64=("$_pkgname-x86_64-$pkgver.zip::https://image.lceda.cn/files/lceda-pro-linux-x64-$pkgver.zip")
source_aarch64=("$_pkgname-aarch64-$pkgver.zip::https://image.lceda.cn/files/lceda-pro-linux-arm64-$pkgver.zip")
sha256sums=('afba3c6712227a37c08783b3cc1a97ae71e90dc2f575409213d2773372220697')
sha256sums_x86_64=('bda4da794e53b9ee121518f742db68668004ba5408a392d0d4b8cf668f290ced')
sha256sums_aarch64=('a3479ffcc5db1cb478c76e594069a53418c7e728b8302b72dd58cd06404a4363')

prepare() {
    curl -sSfL -o "LICENSE-$pkgver.html" "https://lceda.cn/page/legal"
}

package() {
    install -Dm644 "$srcdir/LICENSE-$pkgver.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"

    cd "$srcdir/$_pkgname"
    if [ -f "EasyEDA-Distribution-License.txt" ]; then
        install -Dm644 "EasyEDA-Distribution-License.txt" "$pkgdir/usr/share/licenses/$pkgname/EasyEDA-DLA.txt"
    elif [ -f "嘉立创EDA软件安装最终用户许可协议（EULA）.pdf" ]; then
        install -Dm644 "嘉立创EDA软件安装最终用户许可协议（EULA）.pdf" "$pkgdir/usr/share/licenses/$pkgname/LCEDA-EULA.pdf"
    elif [ -f "LCEDA-Distribution-License.txt" ]; then
        install -Dm644 "LCEDA-Distribution-License.txt" "$pkgdir/usr/share/licenses/$pkgname/EasyEDA-DLA.txt"
    fi

    install -dm755 "$pkgdir/opt/$_pkgname"
    cp -dpr --no-preserve=ownership * "$pkgdir/opt/$_pkgname"
    rm -rf "$pkgdir/opt/$_pkgname/icon"
    rm -rf "$pkgdir/opt/$_pkgname/$_pkgname.dkt"
    rm -f "$pkgdir/opt/$_pkgname/"*License.txt
    rm -f "$pkgdir/opt/$_pkgname/"*.pdf

    # icon
    local _icon
    for _icon in 16 32 64 128 256 512; do
        if [ -f "icon/icon_${_icon}x${_icon}.png" ]; then
            install -Dm644 "icon/icon_${_icon}x${_icon}.png"                            "$pkgdir/usr/share/icons/hicolor/${_icon}x${_icon}/apps/$_pkgname.png"
        fi
    done
    if [ -f "icon/icon_512x512@2x.png" ]; then
        install -Dm644 "icon/icon_512x512@2x.png"                        "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$_pkgname.png"
    fi

    # desktop entry
    if [ -f "$_pkgname.dkt" ]; then
        install -Dm644 "$_pkgname.dkt" "$pkgdir/usr/share/applications/$_pkgname.desktop"
        sed -E -i "s|^Exec=.*|Exec=$_pkgname %f|g" "$pkgdir/usr/share/applications/$_pkgname.desktop"
        sed -E -i "s|^Icon=.*|Icon=$_pkgname|g" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    else
        install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << "DESKTOP_EOF"
[Desktop Entry]
Categories=Development;Electronics;
Comment=免费、专业、强大的国产PCB设计工具
Exec=$_pkgname %f
Keywords=PCB;EDA;
GenericName=嘉立创EDA(专业版)
Icon=$_pkgname
Name=嘉立创EDA(专业版)
Type=Application
MimeType=application/eprj;application/eprj2;application/eprj3;
DESKTOP_EOF
    fi

    # fix permissions
    find "$pkgdir/opt/$_pkgname/" -type d -exec chmod 755 {} +
    find "$pkgdir/opt/$_pkgname/" -type f -exec chmod 644 {} +
    chmod 755 "$pkgdir/opt/$_pkgname/$_pkgname"
    if [ -f "$pkgdir/opt/$_pkgname/chrome_crashpad_handler" ]; then
        chmod 755 "$pkgdir/opt/$_pkgname/chrome_crashpad_handler"
    fi

    # soft link
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

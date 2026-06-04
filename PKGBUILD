# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: taotieren <admin@taotieren.com>

pkgname=easyeda-pro-electron
_pkgname=easyeda-pro
pkgver=3.2.148
pkgrel=1
pkgdesc="EasyEDA Professional Edition. Run with system electron."
arch=("x86_64" "aarch64")
url="https://pro.easyeda.com/"
license=("LicenseRef-EasyEDA-Proprietary")
depends=("electron" "libnotify" "libappindicator-gtk3")
makedepends=("curl")
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-bin")
install=$pkgname.install
source=("$pkgname.install"
        "$_pkgname.sh")
source_x86_64=("$_pkgname-x86_64-$pkgver.zip::https://image.easyeda.com/files/easyeda-pro-linux-x64-$pkgver.zip")
source_aarch64=("$_pkgname-aarch64-$pkgver.zip::https://image.easyeda.com/files/easyeda-pro-linux-arm64-$pkgver.zip")
sha256sums=('ab64abe7821e4ea37a0e4d1f77c94f37d6a51c7df2038ba7b609c640adf8e51d'
            '89289056ed4b5d051280e3a69dfb550b6914f470f201be1ca3b165ddd4f3e435')
sha256sums_x86_64=('3238496cdb38d7fcecfd09d8972dd938c579c6c5e513f5e296848a328be445f8')
sha256sums_aarch64=('0c18605d5c037a6661f396861d80e646139905cd5eed69bcfcbb06e100e0de14')

prepare() {
    curl -sSfL -o "LICENSE-$pkgver.html" "https://easyeda.com/page/legal"
}

package() {
    install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/LICENSE-$pkgver.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"

    cd "$srcdir/$_pkgname"
    if [ -f "EasyEDA-Distribution-License.txt" ]; then
        install -Dm644 "EasyEDA-Distribution-License.txt" "$pkgdir/usr/share/licenses/$pkgname/EasyEDA-DLA.txt"
    elif [ -f "嘉立创EDA软件安装最终用户许可协议（EULA）.pdf" ]; then
        install -Dm644 "嘉立创EDA软件安装最终用户许可协议（EULA）.pdf" "$pkgdir/usr/share/licenses/$pkgname/LCEDA-EULA.pdf"
    elif [ -f "LCEDA-Distribution-License.txt" ]; then
        install -Dm644 "LCEDA-Distribution-License.txt" "$pkgdir/usr/share/licenses/$pkgname/EasyEDA-DLA.txt"
    fi

    install -dm755 "$pkgdir/usr/lib/$_pkgname"
    cp -dpr --no-preserve=ownership resources "$pkgdir/usr/lib/$_pkgname"
    if [ -d "locales" ]; then
        cp -dpr --no-preserve=ownership locales "$pkgdir/usr/lib/$_pkgname"
    fi

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
Comment=EasyEDA Professional Edition. Run with system electron.
Exec=$_pkgname %f
Keywords=PCB;EDA;
GenericName=EasyEDA Pro
Icon=$_pkgname
Name=EasyEDA Pro
Type=Application
MimeType=application/eprj;application/eprj2;application/eprj3;
DESKTOP_EOF
    fi

    # fix permissions
    find "$pkgdir/usr/lib/$_pkgname/" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/lib/$_pkgname/" -type f -exec chmod 644 {} +
}

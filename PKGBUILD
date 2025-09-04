# Maintainer: Ivan Gabaldon <aur[at]inetol.net>
# Contributor: S Stewart <tda@null.net>
# Contributor: Cranky Supertoon <crankysupertoon@gmail.com>

pkgname=gdlauncher-bin
pkgver=2.0.24
pkgrel=1
pkgdesc='A simple, yet powerful Minecraft custom launcher with a strong focus on the user experience (binary release)'
arch=('x86_64')
url=https://gdlauncher.com
license=('BUSL-1.1')
_electron=electron36
provides=("${pkgname//-bin}")
conflicts=("${pkgname//-bin}")
source=("$pkgname-$pkgver.AppImage::https://cdn-raw.gdl.gg/launcher/GDLauncher__${pkgver}__linux__x64.AppImage"
        "${pkgname//-bin}.sh"
        "LICENSE::https://raw.githubusercontent.com/gorilla-devs/GDLauncher-Carbon/develop/LICENSE")
b2sums=('64bafa308044ef6e3c92710bc0ae5edc3ac99a77be8bdbae88619095b25fda77d9bb4ac305f7e434ba52c60ca54e7c35201c0668fe6dcf5ec7b7743fcf41daf6'
        '98f4cb1253a1c8b076042bec96ccde6253107491790d79eca04b667358b79b4bf34f698fb7e9790e1924c52cbe317783269700e1268d3039803adcdf2ee2f5bd'
        '93aed8a6736b73bc8ce08847d9dc895c0e14310125811ea43fbfe9977faa186c4d8f8ffcf88a2a17ab8ae34ab82e1ffbe84e1c590456d4bef46e552b5f80cee7')

prepare() {
    sed -i "s|@ELECTRON@|$_electron|" "${pkgname//-bin}.sh"

    chmod +x "$pkgname-$pkgver.AppImage"
    "./$pkgname-$pkgver.AppImage" --appimage-extract

    # Convert
    cd squashfs-root/

    mkdir -p resources/resources/
    cp -rlf resources/{binaries/,app.asar} resources/resources/
    rm -rf resources/{binaries/,app.asar,app-update.yml}

    cat ../LICENSE > resources/LICENSE

    cat "../${pkgname//-bin}.sh" > "resources/${pkgname//-bin}"

    mv "@gddesktop.desktop" "resources/${pkgname//-bin}.desktop"
    sed -i -e "s|Exec=.*|Exec=/usr/bin/${pkgname//-bin} %U|" -e "s|Icon=.*|Icon=${pkgname//-bin}|" -e '/X-AppImage-Version=.*/d' "resources/${pkgname//-bin}.desktop"

    mv usr/share/icons/hicolor/0x0/apps/@gddesktop.png "resources/${pkgname//-bin}.png"

    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
    chmod 755 resources/resources/{binaries/core_module,app.asar}
}

package() {
    depends=("$_electron"
             'gcc-libs'
             'glibc'
             'libxcb')

    optdepends=('libappindicator-gtk3: Systray indicator support')

    install -d "$pkgdir/opt/${pkgname//-bin}/"
    cp -a squashfs-root/resources/. "$pkgdir/opt/${pkgname//-bin}/"

    chmod 755 "$pkgdir/opt/${pkgname//-bin}/${pkgname//-bin}"

    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/${pkgname//-bin}/${pkgname//-bin}" "$pkgdir/usr/bin/${pkgname//-bin}"

    install -d "$pkgdir/usr/share/applications/"
    ln -s "/opt/${pkgname//-bin}/${pkgname//-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname//-bin}.desktop"

    install -d "$pkgdir/usr/share/icons/"
    ln -s "/opt/${pkgname//-bin}/${pkgname//-bin}.png" "$pkgdir/usr/share/icons/${pkgname//-bin}.png"

    install -d "$pkgdir/usr/share/licenses/${pkgname//-bin}/"
    ln -s "/opt/${pkgname//-bin}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname//-bin}/LICENSE"
}

# Maintainer MatthieuDev <contact at matthieul dot dev>
# Submitter Wings-Fantasy <1056947073@qq.com>

pkgname=badlion-client
pkgver=4.5.4
pkgrel=2
pkgdesc="A Minecraft client with anti-cheat protection"
url="https://client.badlion.net"
arch=('x86_64')
license=('custom')
provides=('BadlionClient')
source=('BadlionClient::https://client-updates-cdn77.badlion.net/BadlionClient'
'AppRun'
'BadlionClient.desktop')
b2sums=('efdae91ee731df35eb3bb88cc2317c02f62544ca29ff529df5be0deaa659a4274be460a791b732b5c4070adfcb553c008c5fc58656a7270162edbd5c41d9d743'
        '42865a8a9ee9c71a1472fe82554e5b12df59a89a81cb28d2e0e942c59529781724f70c58802dbbb8905f62e0b413665322fcdb2095e8ebb681250456fda2645d'
        '31f87ca073b6b587adc6d6e09846c7d8c143c6140198e7b8fb93fb1d5525b75cd1fd945f138b8b40a4d830a881d34f8d31829f89e8c6ac3de49ee115986e0097')

prepare() {
    chmod a+x BadlionClient
    ./BadlionClient --appimage-extract > /dev/null
    cd "squashfs-root"
    rm -rf "AppRun" "BadlionClient.desktop" "BadlionClient.png" ".DirIcon" "licenses" "LICENSE.electron.txt" "LICENSES.chromium.html"
}

package() {
    cd "${srcdir}"
    install -Dm644 BadlionClient.desktop "${pkgdir}/usr/share/applications/BadlionClient.desktop"
    install -Dm755 AppRun "${pkgdir}/opt/BadlionClient/AppRun"

    cd "squashfs-root"
    mkdir -p "$pkgdir/usr/share/licenses/BadlionClient"
    mv license.txt "$pkgdir/usr/share/licenses/BadlionClient"
    cp -r usr/share "$pkgdir/usr"
    rm -rf usr/share
    cp -r * "$pkgdir/opt/BadlionClient"
    chmod -R go+rX "$pkgdir/usr/share/icons"
    cd "$pkgdir/opt/BadlionClient"
    chmod 755 cursors libs locales native-modules resources usr usr/lib

    # Badlion don't start if not defined
    sed -i -e '/APPDIR=/a\' -e 'export APPIMAGE="true"' AppRun
    # Remove auto-update system
    rm resources/app-update.yml
}

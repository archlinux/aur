# Maintainer Wings-Fantasy <1056947073@qq.com>

pkgname=badlion-client
pkgver=3.18.2
pkgrel=1
pkgdesc="A Minecraft client with anti-cheat protection"
url="https://client.badlion.net"
arch=('x86_64')
license=('custom')
provides=('BadlionClient')
source=('BadlionClient::https://client-updates-cdn77.badlion.net/BadlionClient'
'AppRun'
'BadlionClient.desktop')
sha256sums=('1ea32063df979e9e2e4935abfff444646bf7a7b8afc0b5fdeefc460f9c2abbd1'
            '5baab55280a92c293b2453c22a67fd40cf3e10855cda217ddce50abec1df6816'
            '3f5730cff2f8d1f0d36b14ebf6dd83ea25548fdc287c448716a3533e6f2d0885')

prepare() {
    chmod a+x BadlionClient
    ./BadlionClient --appimage-extract > /dev/null
    cd "squashfs-root"
    rm -rf "AppRun" "BadlionClient.desktop" "BadlionClient.png" ".DirIcon" "licenses" "LICENSE.electron.txt" "LICENSES.chromium.html"
}

package() {
    cd "${srcdir}"
    install -Dm644 BadlionClient.desktop "${pkgdir}/usr/share/applications/BadlionClient.desktop"
    install -Dm755 AppRun                "${pkgdir}/opt/BadlionClient/AppRun"

    cd "squashfs-root"
    mkdir -p "$pkgdir/usr/share/licenses/BadlionClient"
    mv license.txt                       "$pkgdir/usr/share/licenses/BadlionClient"
    cp -r usr/share                      "$pkgdir/usr"
    rm -rf usr/share
    cp -r *                              "$pkgdir/opt/BadlionClient"
    chmod -R go+rX "$pkgdir/usr/share/icons"
    cd "$pkgdir/opt/BadlionClient"
    chmod 755 cursors libs locales native-modules resources swiftshader usr usr/lib
}

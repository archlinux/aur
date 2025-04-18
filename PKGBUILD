# Maintainer: Nikita Ardashev <nikitaardasheff at gmail dot com>

pkgname=pioneer-station
pkgver=0.1
pkgrel=1
pkgdesc='Software for working with Geoscan Pioneer products'
arch=('x86_64')
source=("https://storage.yandexcloud.net/pioneer-doc.geoscan.ru-static/dwnlds/software/PioneerStation/PioneerStationLinux.zip")
sha256sums=("b678c12868d51537f1ab4e71c143fd88807bb53764906070c8bdb1eb3b4b551f")
url="https://docs.geoscan.ru/pioneer/instructions/applications/pioneer_station/pioneer_station_main.html"
makedepends=('gendesk')
depends=('libcanberra')

PKG_PATH="/opt/$pkgname"
WORK_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/$pkgname"

prepare() {
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "Pioneer Station" \
        --path "$WORK_DIR" \
        --exec "$PKG_PATH/jre64/bin/java -Dorg.osgi.framework.bundle.parent=ext -jar $PKG_PATH/plugins/org.eclipse.equinox.launcher_1.3.201.v20161025-1711.jar -consoleLog"
}

package() {
    install -dm0755 "$pkgdir/opt"
    cp -a PioneerStation "$pkgdir$PKG_PATH"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

post_install() {
    echo "==> If you want to access Pioneer products over USB, add your user to the 'uucp' group:"
    echo "      \$ sudo usermod -aG uucp \$USER"
    echo "    and then relogin"
}

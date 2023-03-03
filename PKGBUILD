# Maintainer: xmengnet <my@liyp.cc>
pkgname=uudeck
pkgver=2023.1.10.1600
pkgrel=3
pkgdesc="uu加速器Steam Deck插件，需配合手机UU主机加速APP使用"
arch=("x86_64")
license=('custom')
url='https://uu.163.com/console/'

ROUTER="steam-deck-plugin"
MONITOR_FILENAME='uuplugin_monitor.sh'
MONITOR_FILE="https://uu.gdl.netease.com/uuplugin-script/202301101600/${MONITOR_FILENAME}"

MONITOR_CONFIG="uuplugin_monitor.config"

source=("${MONITOR_FILENAME}::${MONITOR_FILE}"
        "${MONITOR_CONFIG}"
        "usage.install")

sha256sums=('88fa487ab0c7608746be696cf76c574404351464fee038ef3d1333688770cdfa'
            'f539a40aa060b1e8d584f9d0161f12faa3df34698036f8bb5bbc124c52c47556'
            '9c42bb8f22a73b7cc58b8c6e07dc0394f55c5949a3d86726a6d64c63be6e2603')

INSTALL_DIR="etc/uu"

STEAM_DECK_PLUGIN="steam-deck-plugin"

package() {
uuplugin_service_dir="etc/systemd/system/"
    uuplugin_service="uuplugin.service"
    sed -i "s|/home/deck/uu|/etc/uu|g" ${MONITOR_FILENAME}

    {
        echo "[Unit]"
        echo "Description=UU Plugin"
        echo "Wants=network-online.target"
        echo "After=network.target network-online.target"
        echo ""
        echo "[Service]"
        echo "ExecStart=/${INSTALL_DIR}/uuplugin_monitor.sh"
        echo ""
        echo "[Install]"
        echo "WantedBy=default.target"
    } > "${uuplugin_service}"
    install -Dm755 ${srcdir}/${uuplugin_service} ${pkgdir}/${uuplugin_service_dir}/${uuplugin_service}
    install -Dm755 ${srcdir}/${MONITOR_FILENAME} ${pkgdir}/${INSTALL_DIR}/${MONITOR_FILENAME}
    install -Dm755 ${srcdir}/${MONITOR_CONFIG} ${pkgdir}/${INSTALL_DIR}/${MONITOR_CONFIG}
    install=usage.install

}




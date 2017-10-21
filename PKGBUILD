# Maintainer:  Quentin Retornaz <quentin dot retornaz at yahoo dot fr>

pkgname=firewatch-gog
_gogver=2.4.0.6
pkgver=1.06_${_gogver}
pkgrel=1
pkgdesc="Firewatch is a single-player first-person mystery set in the Wyoming wilderness."
arch=('x86_64')
url="http://www.firewatchgame.com/"
license=('custom: commercial')
source=("local://gog_firewatch_${_gogver}.sh"
        gog_com-Firewatch_1.desktop)
sha256sums=("7cfe5e0ca80f30afdbcbf3c9d933a74df54fd338233901dcdeabbed7db035425"
            "8039148538da31d0e8cb7af51c5df51bdccddcfdedf8fa276deeca22094b5d92")
# Prevent compressing final package
PKGEXT='.pkg.tar'

package() {
    mkdir -p "${pkgdir}/opt/firewatch/"

    # Launcher and Data
    cp -Ral "${srcdir}/data/noarch/"* "${pkgdir}/opt/firewatch"

    # Install Binaries/Launchers
    mkdir -p "${pkgdir}/usr/bin"
    cat  > "${pkgdir}/usr/bin/firewatch" <<END
#!/bin/bash
/opt/firewatch/start.sh
END

    # Desktop Integration
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    ln -s "/opt/firewatch/game/fw_Data/Resources/UnityPlayer.png" \
          "${pkgdir}/usr/share/pixmaps/firewatch.png"
    install -Dm644 "${srcdir}/gog_com-Firewatch_1.desktop" "${pkgdir}/usr/share/applications/firewatch.desktop"

    # Permissions
    find "${pkgdir}/opt/firewatch" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/firewatch" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/usr/bin/firewatch"
    chmod 755 "${pkgdir}/opt/firewatch/start.sh"
    chmod 755 "${pkgdir}/opt/firewatch/game/fw.${CARCH}"
}

# Maintainer: Christopher Fair <christopherpatrickfair@gmail.com>

pkgname=triplea
_tag=2026-11.16.15918
pkgver=2026.11.16.15918
pkgrel=2
pkgdesc='An online multiplayer turn based strategy game and board game engine.'
arch=('any')
_appname='game-headed'
url='https://triplea-game.org/'
license=('GPL-3.0-or-later')
install=${pkgname}.install
depends=('gtk-update-icon-cache' 'java-runtime')
source=("${pkgname}-${_tag}.zip::https://github.com/triplea-game/triplea/releases/download/${_tag}/${_appname}.zip")
sha256sums=('6dfeaf541c3401bb88ab94be66eb77cb25791315f6e1bfa67fed0c97d146b275')

package() {
    install -d "${pkgdir}/usr/share/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    cp -a "${srcdir}/bin" "${pkgdir}/usr/share/${pkgname}/"
    cp -a "${srcdir}/assets" "${pkgdir}/usr/share/${pkgname}/"
    install -Dm644 "${srcdir}/.triplea-root" "${pkgdir}/usr/share/${pkgname}/.triplea-root"

    cat > "${pkgdir}/usr/bin/triplea" << EOF
#!/usr/bin/bash
cd /usr/share/${pkgname}
exec java -jar /usr/share/${pkgname}/bin/${_appname}-${_tag}.jar "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/triplea"

    for size in 16 32 48 64 128 256; do
        install -Dm644 "${srcdir}/assets/icons/triplea_icon_${size}_${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done

    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Type=Application
Name=TripleA
GenericName=Turn-Based Strategy Game
Comment=Online multiplayer turn-based strategy game and board game engine
Exec=/usr/bin/triplea
Icon=${pkgname}
Terminal=false
Categories=Game;StrategyGame;BoardGame;
Keywords=triplea;axis;allies;strategy;board;game;
EOF
    chmod 644 "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

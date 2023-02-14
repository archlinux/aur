# Maintainer: WhiteFall <whitefall76@outlook.com>
# Maintainer: asukaminato <asukaminato@nyan.eu.org>
# Contributor: Jarrett Ye <jarrett.ye@outlook.com>


pkgname=supermemo18.05-git
pkgver=1.4
pkgrel=1
pkgdesc='A program that makes learning fun and easy.'
arch=('x86_64')
url='https://supermemopedia.com/wiki/Main_Page'
license=('proprietary')
depends=() # wine has some problem, so I use wine.AppImage
sha512sums=('SKIP'
            'SKIP'
            '4b632d356ea230f439ae6df6c858ec33b96d9c28141b336fc8bab06f883a0e8594d8856330936787220f43a9b81b70d8b99bdde5d04dd8ec1b0d9eff96a4fbf7')

source=('git+https://github.com/Zacharia2/SuperMemo18-ON-Wine.git' # wineprefix
        'git+https://github.com/L-M-Sherlock/sm18-lazy-package.git' # software
        'https://github.com/Hackerl/Wine_Appimage/releases/download/v3.0/Wine-x86_64-ubuntu.latest.AppImage' # wine runtime
        )

options=('!strip') # appimage can't strip

package() {
        local prefix=${pkgdir}/${HOME}/.local/share/wineprefixes/
        mkdir -p ${prefix}

        echo "put wineprefix"
        # https://stackoverflow.com/questions/8488253/how-to-force-cp-to-overwrite-without-confirmation
        yes | cp -rf ${srcdir}/SuperMemo18-ON-Wine/SM18.05-WINE-Vessel $prefix

        echo "put binary"
        yes | cp -rf ${srcdir}/sm18-lazy-package/sm18/* $prefix/SM18.05-WINE-Vessel/drive_c/SuperMemo/

        echo "put desktop file"

        chown -R $USER:$USER $prefix/SM18.05-WINE-Vessel/

        local desktop="${srcdir}/SuperMemo18-ON-Wine/deb-package/usr/share/applications/SuperMemo18.05-winecfg.desktop"
        # https://stackoverflow.com/questions/16440377/replace-whole-line-when-match-found-with-sed
        sed -i '/Exec/s/.*/Exec="\/opt\/apps\/supermemo18\/config.sh"/' $desktop
        echo "change to sh launch"
        install -Dm644 $desktop -t "${pkgdir}/usr/share/applications/"


        desktop="${srcdir}/SuperMemo18-ON-Wine/deb-package/usr/share/applications/SuperMemo18.05.desktop"
        sed -i '/Exec/s/.*/Exec="\/opt\/apps\/supermemo18\/run.sh"/' $desktop
        echo "change to sh launch"
        install -Dm644 $desktop -t "${pkgdir}/usr/share/applications/"

        echo "put launch file"
        mkdir -p ${pkgdir}/opt/apps/supermemo18

        echo "#!/bin/sh" > ${pkgdir}/opt/apps/supermemo18/run.sh
        echo 'env WINEARCH=win32 WINEPREFIX=/home/$USER/.local/share/wineprefixes/SM18.05-WINE-Vessel /opt/apps/supermemo18/wine.AppImage --appimage-extract-and-run  /home/$USER/.local/share/wineprefixes/SM18.05-WINE-Vessel/drive_c/SuperMemo/sm18.exe' >> ${pkgdir}/opt/apps/supermemo18/run.sh

        echo "#!/bin/sh" > ${pkgdir}/opt/apps/supermemo18/config.sh
        echo 'env WINEARCH=win32 WINEPREFIX=/home/$USER/.local/share/wineprefixes/SM18.05-WINE-Vessel /opt/apps/supermemo18/wine.AppImage --appimage-extract-and-run  winecfg' >> ${pkgdir}/opt/apps/supermemo18/config.sh

        chmod +x ${pkgdir}/opt/apps/supermemo18/*.sh

        echo "fetch appimage for supermemo18"
        cp Wine-x86_64-ubuntu.latest.AppImage ${pkgdir}/opt/apps/supermemo18/wine.AppImage
        chmod +x ${pkgdir}/opt/apps/supermemo18/wine.AppImage

        echo "done"
}

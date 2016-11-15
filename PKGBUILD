# Maintainer: Guillaume Hayot <postblue@postblue.info>

pkgname=gog-risk-of-rain
pkgver=2.1.0.5
pkgrel=1
pkgdsc="Risk of Rain is an action platformer with roguelike elements."
url="https://www.gog.com/game/risk_of_rain"
license=('custom')
arch=('i686' 'x86_64')
depends_x86_64=('lib32-alsa-lib' 'lib32-libstdc++5' 'lib32-libcurl-compat')
depends_i686=('alsa-lib' 'libstdc++5' 'libcurl-compat')

source=("gog://${pkgname//-/_}_${pkgver}.sh"
        "${pkgname}.desktop")
sha256sums=('90d4a692928802602264a6e1690ee1fb2dc43e9c07329cb08cd57d06b06b9562'
            'a1f0cc949d89cf5c9601b691989a5e728224f17b1f8c7d03d4c7f82be0a105ca')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){
    cd "$srcdir/data/noarch"
    # The launcher expects the user to be in the game dir
    echo -e "#!/bin/sh\ncd /opt/${pkgname}\n./start.sh" > "${srcdir}/${pkgname}"
}

package(){
    cd "$srcdir"
    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support"
    install -d "${pkgdir}/usr/bin/"
    cp -r "data/noarch/game/" "${pkgdir}/opt/${pkgname}/"
    # using straight cp on the supplied tarball tends to have screwy permissions
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    install -Dm755 "data/noarch/start.sh" \
        "${pkgdir}/opt/${pkgname}/"
    install -Dm755 data/noarch/support/*.{sh,shlib} -t \
        "${pkgdir}/opt/${pkgname}/support"

    # Link to the compat libcurl
    mkdir -p "${pkgdir}/opt/${pkgname}/lib"
    [ $CARCH == "x86" ] && ln -s /usr/lib/libcurl.so.3 "${pkgdir}/opt/${pkgname}/lib/libcurl.so.4"
    [ $CARCH == "x86_64" ] && ln -s /usr/lib32/libcurl.so.3 "${pkgdir}/opt/${pkgname}/lib/libcurl.so.4"

    # Desktop integration
    install -Dm 644 "data/noarch/support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "data/noarch/docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

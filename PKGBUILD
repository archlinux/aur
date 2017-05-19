# Maintainer: Patrice Peterson <runiq@archlinux.us>

# This package is based on the gog-terraria package and the gog-freedom-planet package from Ainola.

pkgname=gog-crawl
pkgver=2.1.0.2
pkgrel=1
pkgdesc='The dungeon crawler where your friends control the monsters'
arch=("i686" "x86_64")
url='http://www.gog.com/game/crawl'
license=('custom:commercial')
groups=('games')
source=("gog://${pkgname//-/_}_${pkgver}.sh"
        "${pkgname}.desktop"
		"${pkgname}")
sha512sums=('0d8ed03bcb4910d7af17d617323c34f586ffbc7995460c501f94afb042647e287f829685db428dabcde3a6b93f4a6b6afa417704d2029a832769a188affc2191'
            '869d0390da9a9f4b08aa6c80504183f4718d40c3c5906169e05bad05fb369a501fdbbfacfcb751ca3e8f19575993b55c07f6b2465c1616073d30e2b7a3125f7e'
            'c2a442c2b39a1a44b248858ca6d8cdbb012a0a0b77d2e8d32d040abb7572faada797ed76a302a7fd40d0e9eac47cc0b045263a3f7dfe7c4b4660fb7ba686d283')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# If you want to use lgogdownloader
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
# source=("gogdownloader://shovel-knight/en3installer4" "${pkgname}.desktop")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){
	# Remove unnecessary binary
    cd "$srcdir/data/noarch"
    [ $CARCH == "i686" ]    && rm -r "game/Crawl.x86_64"
    [ $CARCH == "x86_64" ] && rm -r "game/Crawl.x86"
}

package() {
    cd "$srcdir"
    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support"
    install -d "${pkgdir}/usr/bin/"
    cp -r "data/noarch/game" "${pkgdir}/opt/${pkgname}/"
    install -Dm755 "data/noarch/start.sh" \
        "${pkgdir}/opt/${pkgname}/"
    install -Dm755 data/noarch/support/*.{sh,shlib} -t \
        "${pkgdir}/opt/${pkgname}/support"

    # Desktop integration
    install -Dm 644 "data/noarch/support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "data/noarch/docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# Maintainer: Swix

pkgname=gog-terraria
pkgver=1.4.0.5.38805
pkgrel=1
epoch=1
pkgdesc="The very world is at your fingertips as you fight for survival, fortune, and glory."
url="http://terraria.org/"
license=('custom')
arch=('i686' 'x86_64')
depends=('sdl2')
makedepends=('libarchive')
optdepends=('firejail: Automatically sandbox this application from your OS')
source=("gog://terraria_v${pkgver//./_}.sh"
        "${pkgname}.desktop"
        "$pkgname")

# bsdtar is really cool but I want to control what I'm extracting
noextract=("terraria_v${pkgver//./_}.sh")
sha256sums=('3c2e0145f30829cf0c956a69aca8867a4027d9dadbcb0a359ad70eade3bae066'
            '815bf359c2828cdefee1e33a978a84a2ebb538450197a5792b62e382ae3e3093'
            'afc115c0cbb42a12e082f5860c159eb8dcf525d360d2f9b167cc4ddb80ba03e7')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){
    datasource="terraria_v${pkgver//./_}.sh"

    offset=`sed -n '/.*offset=.*head/{s/.*head -n \([0-9]*\).*/\1/p;q}' "$datasource"`
    toskip=`sed -n '/filesizes=/{s/.*="\([0-9]*\)"/\1/p;q}' "$datasource"`

    mkdir "${srcdir}/terraria"
    tail -n+$(($offset+1)) "$datasource" | tail -c+$(($toskip+1)) | bsdtar -C "${srcdir}/terraria" -xvf- 2> /dev/null
}

package(){
    pushd "${srcdir}/terraria/data/noarch"

    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support"
    install -d "${pkgdir}/usr/bin/"

    cp -r "game/" "${pkgdir}/opt/${pkgname}/"
    find "${pkgdir}/opt/${pkgname}/" -type d -exec chmod 755 "{}" \;
    install -Dm755 "start.sh" \
        "${pkgdir}/opt/${pkgname}/"
    install -Dm755 support/*.{sh,shlib} -t \
        "${pkgdir}/opt/${pkgname}/support"
    install -Dm644 gameinfo \
        "${pkgdir}/opt/${pkgname}/gameinfo"

    # Desktop integration
    install -Dm644 "support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"

    # Fix permissions
    chmod +x "${pkgdir}/opt/${pkgname}/game/Terraria"{,Server}{,.bin.x86,.bin.x86_64}
    popd
}
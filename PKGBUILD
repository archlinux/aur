# Maintainer: James Zhu <james.zhu.engineer at gmail.com>

pkgname=gog-mini-metro
_pkgname=minimetro
pkgver=2.6.0.8
pkgrel=1
pkgdesc='Minimalistic subway layout game'
url="http://dinopoloclub.com/${pkgname}/"
license=('custom:None')
arch=('i686' 'x86_64')
depends=('libgl' 'libx11' 'glu' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepnds=('imagemagick')
source=("gog://${pkgname//-/_}_${pkgver}.sh"
"${pkgname}.desktop")
sha256sums=('72400b05da958bcce5b890c4a0f22c6f1786e4b4ebd5dda6619f19562f0ed65a'
            '85d3b80eacde486736e94c999d15a34b1d0d8581df5bf0a209a32c6bccf5b6ef')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){
    case $CARCH in
      i686) _notarch=x86_64 ;;
      x86_64) _notarch=x86 ;;
    esac
    find -name "*$_notarch" -exec rm -r {} +

    # Unzip will produce an error code because it is unable to unzip the Installer.
    # Therefore, a conditional into a no-op command will keep the PKGBUILD from failing
    # Of course, if you have any real problems unzipping the PKGBUILD will not abort.
    unzip "${pkgname//-/_}_${pkgver}.sh" || :

    cd "${srcdir}"
    echo $PWD

    cd "${srcdir}/data/noarch"
    sed -r -i \
    's/(CURRENT_DIR="\$\( cd "\$\( dirname )'`
      `'"\$\{BASH_SOURCE\[0\]\}"(.*$)'`
      `'/\1$( readlink -nf "${BASH_SOURCE[0]}" )\2/' \
    "start.sh"
}

package(){
    cd "${srcdir}/data/noarch"
    destdir="$pkgdir/opt/$pkgname"
    install -dm 755 "$destdir"

    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support"
    install -d "${pkgdir}/usr/bin/"
    cp -r "game/" "${pkgdir}/opt/${pkgname}/"
    install -Dm755 "start.sh" "gameinfo" "${pkgdir}/opt/${pkgname}/"
    install -Dm755 support/*.{sh,shlib} "${pkgdir}/opt/${pkgname}/support"

    # Desktop integration
    install -Dm 644 "support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    ln -s "/opt/${pkgname}/start.sh" "${pkgdir}/usr/bin/${pkgname}"

    install -dm 755 "$pkgdir/usr/{bin,share/{applications,icons/hicolor/{scalable,256x256,64x64}/apps}}" "$destdir"
}

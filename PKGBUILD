# Maintainer: 0x715C <https://www.t.me/hex715C>

pkgname=atomrpg
_pkgname=atom_rpg_post_apocalyptic_indie_game
pkgver=1.177.45160
pkgrel=1
pkgdesc='Post-apocalyptic indie game'
url="https://${pkgname}.com/"
license=('custom:None')
arch=('i686' 'x86_64')
depends=('libgl' 'libx11' 'glu' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('unzip')
noextract=("${_pkgname}_${pkgver//./_}.sh")
source=("gog://${_pkgname}_${pkgver//./_}.sh"
"${pkgname}.desktop")
sha256sums=('e4c3f717f813d77d5b90cf9d97b29901a62628d8bc69f9d6a44366ae586ff219'
            '41ac5904f3c913a112d420960aaca0fd4967ac23274eb5161a74e9d967c0349d')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){

	# Remove non matching architecture code
    case $CARCH in
      i686) _notarch=x86_64 ;;
      x86_64) _notarch=x86 ;;
    esac
    find -name "*$_notarch" -exec rm -r {} +

	echo "Extracting game data"
	unzip -qq "${_pkgname}_${pkgver//./_}.sh" || true
	echo "Data extracted"

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

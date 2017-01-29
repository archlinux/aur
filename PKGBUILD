# Maintainer: Patrice Peterson <runiq@archlinux.us>
# Thanks to: Ainola for the base PKGBUILD (gog-undertale)

pkgname=gog-starbound
pkgver=2.11.0.12
pkgrel=1
pkgdesc="An extraterrestrial sandbox adventure game"
url="http://www.playstarbound.com"
license=('custom')
arch=('i686' 'x86_64')
# If Firejail is installed, this application will be sandboxed automatically.
optdepends=('firejail: Automatically sandbox this application from your OS')
source=(
    "gog://${pkgname//-/_}_${pkgver}.sh"
    "${pkgname}.desktop"
    "$pkgname")
sha256sums=('aca83ef0ff7c5c569daff65c678fe9ce4f0dd2bed23a2d3904ee8e75357940ac'
            'a6a270b19c6561a60f491781521ab5e3d216013c95a3a66d58fb05680064682c'
            '0aaedd7aeafcb26d090e37d099d4b56e0119026d9bad67df77804ae62c115655')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u Download the GOG file to \"$PWD\" or set up a gog:// DLAGENT.")

# Prevent compressing final package
PKGEXT=".pkg.tar"

package(){
    cd "${srcdir}"

    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support"
    install -d "${pkgdir}/usr/bin/"
    cp -r "data/noarch/game/" "${pkgdir}/opt/${pkgname}/"
    

    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    install -Dm755 "data/noarch/start.sh"               \
        "${pkgdir}/opt/${pkgname}/"
    install -Dm755 data/noarch/support/*.{sh,shlib} -t  \
        "${pkgdir}/opt/${pkgname}/support"

    # Desktop integration
    install -Dm 644 "data/noarch/support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "data/noarch/docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

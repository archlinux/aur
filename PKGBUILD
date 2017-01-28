# Maintainer: Patrice Peterson <runiq@archlinux.us>
# Thanks to: Ainola for the base PKGBUILD (gog-undertale)

pkgname=gog-serpent-in-the-staglands
pkgver=2.13.0.18
pkgrel=1
pkgdesc="A 90s CRPG in every way but the release date"
url="http://www.playstarbound.com"
license=('custom')
arch=('i686' 'x86_64')
# If Firejail is installed, this application will be sandboxed automatically.
optdepends=('firejail: Automatically sandbox this application from your OS')
source=(
    "gog://${pkgname//-/_}_${pkgver}.sh"
    "${pkgname}.desktop"
    "$pkgname")
sha256sums=('7c4e3aa177f0e111787518cdc56e655666200f7d7e63b0f98041f3b2cb6929d9'
            '544f8f7dcde614624b75529af4e689d878f0faa704e34d8e69590663a0cd2523'
            '757bf6a7d4119cb3df1717b17fa26b346c1e47aaec95505c0a03985433740939')

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

# Maintainer: Patrice Peterson <runiq@archlinux.us>
# Thanks to: Ainola for the base PKGBUILD (gog-undertale)

pkgname=skullgirls-hib
_pkgname=Skullgirls
__pkgname=SkullGirls
pkgver=1.0.1
pkgrel=1
pkgdesc="A fast-paced 2D fighting game"
url="http://www.skullgirls.com"
license=('custom')
arch=('i686' 'x86_64')
groups=('games')
# If Firejail is installed, this application will be sandboxed automatically.
optdepends=('firejail: Automatically sandbox this application from your OS')
source=(
    "hib://${_pkgname//-/_}-${pkgver}.sh"
    "${pkgname}.desktop"
    "$pkgname")
sha256sums=('b558c80e764e63acddf37e3fb51723ff5e4011386199707f5e3b41057213963f'
            '7613e7b41b785693ffd2d383bc68a1220bfa763e2fefaa3e45823a48514c9a55'
            'e2be1e73db299f42f9c8fd6b62cbf022741cae77719803aabce1c05433b5d650')

DLAGENTS+=("hib::/usr/bin/echo %u Download the HIB file to \"$PWD\" or set up a hib:// DLAGENT.")

# Prevent compressing final package
PKGEXT=".pkg.tar"

package(){
    cd "${srcdir}"

    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/usr/bin/"
    cp -r data/noarch/* "${pkgdir}/opt/${pkgname}/"
    cp -r data/$CARCH/* "${pkgdir}/opt/${pkgname}/"
    # Arch-independent link
    ln -rs "${pkgdir}/opt/${pkgname}/${__pkgname}.${CARCH}-pc-linux-gnu" "${pkgdir}/opt/${pkgname}/${__pkgname}"
    

    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;

    # Desktop integration
    install -Dm 644 "data/noarch/Icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

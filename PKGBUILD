# Maintainer: Patrice Peterson <runiq@archlinux.us>
# Thanks to: Ainola for the base PKGBUILD (gog-undertale)

pkgname=gog-transistor
pkgver=2.0.0.3
pkgrel=1
pkgdesc="A sci-fi themed action RPG that invites you to wield an extraordinary weapon of unknown origin as you fight through a stunning futuristic city"
url="http://www.supergiantgames.com/games/transistor"
license=('custom')
arch=('i686' 'x86_64')
# Dependencies are included with the gog_transistor_$version.sh file.
depends_x86_64=()
depends_i686=()
# If Firejail is installed, this application will be sandboxed automatically.
optdepends=('firejail: Automatically sandbox this application from your OS')
source=(
    "gog://${pkgname//-/_}_${pkgver}.sh"
    "${pkgname}.desktop"
    "$pkgname")
sha256sums=('46bc519d331bbebc1d155b06bf5407e2846c2bf945c9a06dd34182184c3792fd'
            '1582e8bad6e6b5908afc6a63bc637f99f11c9b1e04dbec732410a4ffb7667eca'
            '0e2fac1f46ae0e39a396e5a18be580bd3489709b5d495192b8b32576f71ce5c1')

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

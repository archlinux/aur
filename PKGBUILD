# Maintainer: Ainola

pkgname=gog-undertale
pkgver=2.0.0.1
pkgrel=2
pkgdesc="In UNDERTALE you play as a human child who falls underground into the world of monsters."
url="http://undertale.com/"
license=('custom')
arch=('i686' 'x86_64')
depends_x86_64=('lib32-glu' 'lib32-libxrandr' 'lib32-openal' 'lib32-openssl')
depends_i686=('glu' 'libxrandr' 'openal' 'openssl')
# If Firejail is installed, this application will be sandboxed automatically.
optdepends=('firejail: Automatically sandbox this application from your OS')
source=("gog://${pkgname//-/_}_${pkgver}.sh"
        "${pkgname}.desktop"
        "$pkgname")
sha256sums=('dd47d4418c7c3b1b971123d2364f988f29ca78b8a7687742e8937e9ffc3bc297'
            '45238a1e7f02afe18f8a84a9d32035a555a4513f1b77f5a9a791cb27ce59e0ad'
            '726a8c9fe056b279d2fc9167cd66f4000279b0eb0dff166ffa6f4dd2a6bf706b')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u Download the GOG file to \"$PWD\" or set up a gog:// DLAGENT.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

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

    # Desktop integration
    install -Dm 644 "data/noarch/support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "data/noarch/docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

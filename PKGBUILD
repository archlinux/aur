# Maintainer: Ainola

pkgname=gog-undertale
pkgver=2.0.0.1
pkgrel=1
pkgdesc="Only through teamwork can you triumph over the evil forces of Anti-Love."
url="http://undertale.com/"
license=('custom')
arch=('i686' 'x86_64')
depends_x86_64=('lib32-glu' 'lib32-libxrandr' 'lib32-openal' 'lib32-openssl')
depends_i686=('glu' 'libxrandr' 'openal' 'openssl')
source=("gog://${pkgname//-/_}_${pkgver}.sh"
        "${pkgname}.desktop")
sha256sums=('dd47d4418c7c3b1b971123d2364f988f29ca78b8a7687742e8937e9ffc3bc297'
            '45238a1e7f02afe18f8a84a9d32035a555a4513f1b77f5a9a791cb27ce59e0ad')

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

    # Desktop integration
    install -Dm 644 "data/noarch/support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "data/noarch/docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

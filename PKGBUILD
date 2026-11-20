# Maintainer: MaoYaoTang <maoyaotang @ 163>

pkgname=ctfile-electron
_pkgname=CTFile
pkgver=5.1.28
pkgrel=2
pkgdesc="城通网盘electron版"
arch=('any')
url="https://www.ctfile.com/"
license=('CC0-1.0')
depends=(electron)
makedepends=('asar')
provides=("$_pkgname")
source=(
    "https://imgstatic.ctcontents.com/apps/${_pkgname}-${pkgver}.AppImage"
    "城通网盘 隐私政策"
    "${pkgname%-electron}.desktop"
    "${pkgname%-electron}.sh"
)
sha512sums=('20e0fa8ce50ee966104cf7c82f900fd01fbffd9f621635e456e9f1783b51e02295378f07f8d311e20b4e8ba1e6330d875fc85871b6e72f1c6c63e2a129cea4ea'
            '9f441c7fb6dadbede0dfac67a7c27e9c44ee7fd3a67a21c8fc86258a1a971c1ef5af3ff101168fb4f190242da418e986c55d2ae9ebf38254c55f2e0e4663969a'
            '81304263bd190047ce3625eac4b14494901d0b9a7ca316fd93689e8562faf575c865b1bf1823c038b9fc87248802fc2ba468e0b3a839834f0e6fd8a93352f13b'
            'cbb112207302359b6f1cec3caf1c9685466959f9037ea9c0feddb9474fb84c571d7352df46aa804838eaa761b09e3a8564068c327fb76ce83ff8ab57bf676a66')

prepare() {
    chmod +x ${_pkgname}-${pkgver}.AppImage
    ./${_pkgname}-${pkgver}.AppImage --appimage-extract
}

package() {
    cd "${srcdir}"
    install -dm755 ${pkgdir}/opt/${pkgname%-electron}
    install -dm755 ${pkgdir}/usr/share
    install -Dm755 ${pkgname%-electron}.sh "${pkgdir}/usr/bin/${pkgname%-electron}"
    cp -r squashfs-root/resources/* "${pkgdir}/opt/${pkgname%-electron}/"
    chmod 644 "${pkgdir}/opt/${pkgname%-electron}/assets/"*.png
    find ${pkgdir} -type d -exec chmod 755 {} \;
    install -Dm644 ${pkgname%-electron}.desktop "${pkgdir}/usr/share/applications/${pkgname%-electron}.desktop"
    while IFS= read -r iconfile; do
        rel="${iconfile#squashfs-root/usr/share/icons/}"
        install -Dm644 "$iconfile" "${pkgdir}/usr/share/icons/${rel}"
    done < <(find squashfs-root/usr/share/icons/hicolor -type f -name "*.png")
    install -Dm644 ${srcdir}/"城通网盘 隐私政策" "$pkgdir/usr/share/licenses/${pkgname%-electron}/LICENSE"
}

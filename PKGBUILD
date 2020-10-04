# Maintainer: Renato Molnar <m dot renato93 at gmail dot com>

#_arch=x64

pkgname=notepadpp
_pkgname=notepad-plus-plus
pkgver=7.9
pkgrel=1
pkgdesc="A free source code editor for Windows"
arch=('x86_64')
url="https://${_pkgname}.org/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('wine' 'sh' 'fuse-overlayfs')
makedepends=('unzip')
provides=(notepadpp)
conflicts=('notepadpp-win32' 'notepadpp-win64')
source=(notepadpp
        notepadpp.desktop
        notepadpp.png
        "https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/npp.${pkgver}.portable.zip"
        "https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/npp.${pkgver}.portable.x64.zip")

sha256sums=('a104f9759db9b2ae95577f2576a5257ffaf4a6beef366d2e0de64d10b6d114ec'
            'a1c34d444893d56ae165c8457260e11b729ea2afc10bb9e2690bc89e1f523238'
            '04c8ad254a41350078bba4d56ad54f7b4c0df125029aee021ea0ac632971ebad'
            '22dd3d1d30b4a75717207206d568ff0654430ccb6fa18c3faeb94692a7020e2a'
            '126b4cdab094639696ffa92f2e544b8ba8487333175e1b729ba1a2682406f65a')

noextract=("npp.${pkgver}.bin.zip"
           "npp.${pkgver}.bin.x64.zip")

if [[ "${_arch}" == x64 ]]; then
    _arch='.x64'
    pkgdesc+=" (64-bit)"
else
    _arch=''
    pkgdesc+=" (32-bit)"
fi

options=('!strip')

package() {

    install -d -m755 "${pkgdir}/usr/share/${pkgbase}"

    unzip "${srcdir}/npp.${pkgver}.portable${_arch}.zip" -d "${pkgdir}/usr/share/${pkgbase}"

    rm -rf "${pkgdir}/usr/share/${pkgbase}/updater" \
           "${pkgdir}/usr/share/${pkgbase}/license.txt" \

    find "${pkgdir}/usr/share/${pkgbase}" -type d -exec chmod 755 "{}" \;
    find "${pkgdir}/usr/share/${pkgbase}" -type f -exec chmod 644 "{}" \;

    ln -s "/usr/share/${pkgbase}/notepad++.exe" "${pkgdir}/usr/share/${pkgbase}/notepadpp.exe"

    install -D -m755 "${srcdir}/notepadpp" "${pkgdir}/usr/bin/notepadpp"
    install -D -m644 "${srcdir}/notepadpp.png" "${pkgdir}/usr/share/pixmaps/notepadpp.png"
    install -D -m644 "${srcdir}/notepadpp.desktop" "${pkgdir}/usr/share/applications/notepadpp.desktop"
}


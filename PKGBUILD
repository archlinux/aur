# Maintainer: Renato Molnar <m dot renato93 at gmail dot com>

_type=legacy
#_type=overlayfs
#_arch=x64


pkgname=notepadpp
_pkgname=notepad-plus-plus
pkgver=7.8.4
pkgrel=2
pkgdesc="A free source code editor for Windows"
arch=('x86_64')
url="https://${_pkgname}.org/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('wine' 'sh')
makedepends=('unzip')
provides=(notepadpp)
conflicts=('notepadpp-win32' 'notepadpp-win64')
source=(notepadpp-legacy
        notepadpp-overlayfs
        notepadpp.desktop
        notepadpp.png
        "https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/npp.${pkgver}.bin.zip"
        "https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/npp.${pkgver}.bin.x64.zip")

sha256sums=('849aebb1491c7243e5bb8069d57a69163ed1f47a71f033414a6794081b0e62ec'
            'a104f9759db9b2ae95577f2576a5257ffaf4a6beef366d2e0de64d10b6d114ec'
            'a1c34d444893d56ae165c8457260e11b729ea2afc10bb9e2690bc89e1f523238'
            '04c8ad254a41350078bba4d56ad54f7b4c0df125029aee021ea0ac632971ebad'
            '198a476b32ea3b8dfcb21d4caa93d2c99c4c1399c2af40e5d27cc5a9cffb5924'
            '802b65fe2071fa2345c09fffc58a5ef0a4c05394c94138f8ecb41644bfebe448')

noextract=("npp.${pkgver}.bin.zip"
           "npp.${pkgver}.bin.x64.zip")

if [[ "${_type}" == 'overlayfs' ]]; then
    depends+=('fuse-overlayfs')
fi

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

    unzip "${srcdir}/npp.${pkgver}.bin${_arch}.zip" -d "${pkgdir}/usr/share/${pkgbase}"

    rm -rf "${pkgdir}/usr/share/${pkgbase}/updater" \
           "${pkgdir}/usr/share/${pkgbase}/license.txt" \

    find "${pkgdir}/usr/share/${pkgbase}" -type d -exec chmod 755 "{}" \;
    find "${pkgdir}/usr/share/${pkgbase}" -type f -exec chmod 644 "{}" \;

    sed -i "s|SED_APPVER|${pkgver}-${pkgrel}|" "${srcdir}/notepadpp-legacy"

    install -D -m755 "${srcdir}/notepadpp-${_type}" "${pkgdir}/usr/bin/notepadpp"
    install -D -m644 "${srcdir}/notepadpp.png" "${pkgdir}/usr/share/pixmaps/notepadpp.png"
    install -D -m644 "${srcdir}/notepadpp.desktop" "${pkgdir}/usr/share/applications/notepadpp.desktop"
}


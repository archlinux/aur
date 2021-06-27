# Maintainer: Renato Molnar <m dot renato93 at gmail dot com>

#_arch=x64

pkgname=notepadpp
_pkgname=notepad-plus-plus
pkgver=8.1
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

sha256sums=('baefda04b95342db657df7f650fb5d6dd43e966a2158a0ebb5837129f8755379'
            'a1c34d444893d56ae165c8457260e11b729ea2afc10bb9e2690bc89e1f523238'
            '04c8ad254a41350078bba4d56ad54f7b4c0df125029aee021ea0ac632971ebad'
            '284767275495aea43848c0c3cf006377efc39552133fb3c646ce2690ddad796b'
            'dcff12dcd03f71aea5f32e8da6048d903fdec199af71dfd2d5590d3f586db5be')

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


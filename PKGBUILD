# Maintainer: Renato Molnar <renato dot molnar at posteo dot net>

# Use the following variable to change package architecture.
# To use OS architecture please uncomment it
_arch="x86"
# possible values: "x86", "x64"

case "${_arch-"${CARCH}"}" in
    i686|x86)
        _archstr='';;
    x86_64|x64)
        _archstr='.x64';;
esac

pkgbase=notepadpp
pkgname=notepad++
_pkgname=notepad-plus-plus
pkgver=8.4.7
pkgrel=1
pkgdesc="A free source code editor for Windows"
url="https://${_pkgname}.org/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('wine' 'sh' 'fuse-overlayfs')
makedepends=('unzip')
provides=(notepadpp)
replaces=('notepadpp-win32' 'notepadpp-win64' 'notepadpp')
source=(notepad++
        notepad++.desktop
        notepad++.png
        "https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/npp.${pkgver}.portable.zip"{,.sig}
        "https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/npp.${pkgver}.portable.x64.zip"{,.sig})
sha256sums=('643713113d26d32b2e6d861e9cd6db8153a3359f3784dbd1710f12e89468654a'
            '98693e0f57a9fab55dd31dfaf9b3a13234f14e1b193b56ac52eff33c987d4354'
            '04c8ad254a41350078bba4d56ad54f7b4c0df125029aee021ea0ac632971ebad'
            'a294728c4d856bb93c075e86609210eebf2a5c8d0a8709f7553ed03bd7dbe5ac'
            'SKIP'
            '4fa63354348015915df3a42b6750f676669a2743056daffd3b9358706c112000'
            'SKIP')

noextract=("npp.${pkgver}.portable.zip"
           "npp.${pkgver}.portable.x64.zip")

validpgpkeys=('14BCE4362749B2B51F8C71226C429F1D8D84F46E')

options=('!strip')

package() {
    install -d -m755 "${pkgdir}/usr/share/${pkgname}"

    unzip "${srcdir}/npp.${pkgver}.portable${_archstr}.zip" -d "${pkgdir}/usr/share/${pkgname}"

    rm -rf "${pkgdir}/usr/share/${pkgname}/updater" \
           "${pkgdir}/usr/share/${pkgname}/license.txt" \

    find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 "{}" \;
    find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 "{}" \;

    install -D -m755 "${srcdir}/notepad++" "${pkgdir}/usr/bin/notepad++"
    install -D -m644 "${srcdir}/notepad++.png" "${pkgdir}/usr/share/pixmaps/notepad++.png"
    install -D -m644 "${srcdir}/notepad++.desktop" "${pkgdir}/usr/share/applications/notepad++.desktop"
}


# Maintainer : Daniel Bermond < gmail-com: danielbermond >

_commit='7513f4e2f15fbe485c76cac90ab2d29dea2a5281'

pkgname=torrentzip.net
_srcname=RVWorld
pkgver=1.0.4.0
pkgrel=1
pkgdesc='Torrentzip utility with mutli core processing capability'
arch=('any')
url='http://www.romvault.com/trrntzip/'
license=('MIT')
depends=('mono' 'sh' 'hicolor-icon-theme')
makedepends=('git' 'imagemagick')
source=("git+https://github.com/RomVault/RVWorld.git#commit=${_commit}"
        'TrrntZip.NET'
        'TrrntZipUI'
        'torrentzip.net.desktop'
        'torrentzip.net-no-ilmerge.patch'
        'torrentzip.net-fix-case.patch'
        'torrentzip.net-linux-fix.patch')
sha256sums=('SKIP'
            'fcec85063da4f78dc853f443493709458ae627aaf8968476c7ea02056b0982b0'
            'af32f3a2609a9eae37a2c836b0a4961230cfdffec6080d23fc94c5a0c4a181f0'
            'ab1f7bd79b7f255ee93b7986e3b8674eb32150c1043e349f351db2c29788aebe'
            '6173068d16ca19f6b8e29cf176d0633a5b4a81b2986bd36a85e0fe5fa095a9f6'
            '5f54911530550c5e4379422cbacea6258c7a0e07429b3530a12a6daad157585e'
            '170fc46eb2af90ad47a76bbc3827219f024fe9b5df95b317202396ec299ae06d')

prepare() {
    cd "$_srcname"
    
    # apply patches:
    ## - do not statically link with ilmerge
    ## - fix case to allow building on linux
    ## - other linux fixes: more case fixes and .zip filename fix
    for _patch in "${source[@]}"
    do
        [ "${_patch##*.}" != 'patch' ] && continue
        printf '%s\n' "  -> Applying patch '${_patch}'..."
        patch -Np1 -i "${srcdir}/${_patch}"
    done
    
    # convert .ico to suitable formats
    cd TrrntZipUI
    magick convert memory-rom.ico torrentzip.net.png
    magick convert memory-rom.ico torrentzip.net.svg
}

build() {
    printf '%s\n' '  -> Building TorrnetZip.NET CLI...'
    cd "${_srcname}/TrrntZipCMD"
    xbuild /p:Configuration='Release' TrrntZipCMD.csproj
    
    printf '%s\n' '  -> Building TorrnetZip.NET GUI...'
    cd "${srcdir}/${_srcname}/TrrntZipUI"
    xbuild /p:Configuration='Release' TrrntZipUI.csproj
}

package() {
    # launchers
    install -D -m755 TrrntZip.NET -t "${pkgdir}/usr/bin"
    install -D -m755 TrrntZipUI   -t "${pkgdir}/usr/bin"
    ln -s TrrntZip.NET "${pkgdir}/usr/bin/trrntzip.net"
    ln -s TrrntZipUI   "${pkgdir}/usr/bin/trrntzip.net-ui"
    
    # binaries
    cd "$_srcname"
    install -D -m644 TrrntZipCMD/bin/Release/*           -t "${pkgdir}/usr/lib/${pkgname}"
    install -D -m644 TrrntZipUI/bin/Release/TrrntZipUI.* -t "${pkgdir}/usr/lib/${pkgname}"
    
    # desktop file
    install -D -m644 "${srcdir}/torrentzip.net.desktop" -t "${pkgdir}/usr/share/applications"
    
    # icons
    local _icon
    local -a _icons
    local _size
    mapfile -t -d '' _icons < <(find TrrntZipUI -type f -name 'torrentzip.net*.png' -print0)
    for _icon in "${_icons[@]}"
    do
        _size="$(magick identify -format '%[fx:w]' "$_icon")"
        install -D -m644 "$_icon" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
    done
    install -D -m644 TrrntZipUI/torrentzip.net.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    
    # license
    install -D -m644 "${srcdir}/${_srcname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

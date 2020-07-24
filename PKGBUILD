# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=torrentzip.net
pkgver=1.0.5.0
_rvver=3.1.3
pkgrel=1
pkgdesc='Torrentzip utility with mutli core processing capability'
arch=('any')
url='https://www.romvault.com/trrntzip/'
license=('MIT')
depends=('mono' 'sh' 'hicolor-icon-theme')
makedepends=('git' 'icoutils')
source=("git+https://github.com/RomVault/RVWorld.git#tag=${_rvver}"
        'TrrntZip.NET'
        'TrrntZipUI'
        'torrentzip.net.desktop'
        '010-torrentzip.net-no-ilrepack.patch'
        '020-torrentzip.net-fix-case.patch')
sha256sums=('SKIP'
            'fcec85063da4f78dc853f443493709458ae627aaf8968476c7ea02056b0982b0'
            'af32f3a2609a9eae37a2c836b0a4961230cfdffec6080d23fc94c5a0c4a181f0'
            '3c5d111bca9db45bb093c7eef68194251a4c8e5659f6f632cb6f1d9789cef983'
            'fd8835e88f4db12f2e57294903c1a90ccb6d7eddf20f23433c054a9ab2e74fd4'
            '5612ae7151aca3e376bd886cd2fccada031366830ab380092cc4a9d89c5f2946')

prepare() {
    patch -d RVWorld -Np1 -i "${srcdir}/010-torrentzip.net-no-ilrepack.patch"
    patch -d RVWorld -Np1 -i "${srcdir}/020-torrentzip.net-fix-case.patch"
    icotool -x RVWorld/TrrntZipUI/memory-rom.ico -o RVWorld/TrrntZipUI
}

build() {
    printf '%s\n' '  -> Building TorrnetZip.NET CLI...'
    cd RVWorld/TrrntZipCMD
    xbuild /p:Configuration='Release' TrrntZipCMD.csproj
    
    printf '%s\n' '  -> Building TorrnetZip.NET GUI...'
    cd "${srcdir}/RVWorld/TrrntZipUI"
    xbuild /p:Configuration='Release' TrrntZipUI.csproj
}

package() {
    # launchers
    install -D -m755 TrrntZip.NET -t "${pkgdir}/usr/bin"
    install -D -m755 TrrntZipUI   -t "${pkgdir}/usr/bin"
    ln -s TrrntZip.NET "${pkgdir}/usr/bin/trrntzip.net"
    ln -s TrrntZipUI   "${pkgdir}/usr/bin/trrntzip.net-ui"
    
    # binaries
    install -D -m644 RVWorld/Trrntzip/bin//Release/{Compress,RVIO,Trrntzip}.{dll,pdb} -t "${pkgdir}/usr/lib/${pkgname}"
    install -D -m644 RVWorld/TrrntZipCMD/obj/Release/TrrntZip.NET.{exe,pdb} -t "${pkgdir}/usr/lib/${pkgname}"
    install -D -m644 RVWorld/TrrntZipUI/obj/Release/TrrntZipUI.{exe,pdb} -t "${pkgdir}/usr/lib/${pkgname}"
    
    # desktop file
    install -D -m644 "${srcdir}/torrentzip.net.desktop" -t "${pkgdir}/usr/share/applications"
    
    # icons
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(printf '%s' "$_file" | sed 's/\.png$//;s/^.*_//;s/x.*$//')"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png"
    done < <(find RVWorld/TrrntZipUI -maxdepth 1 -type f -name 'memory-rom_*_*x*x*.png' -print0)
    
    # license
    install -D -m644 RVWorld/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

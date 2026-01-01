# Maintainer: imcb <irismessage@protonmail.com>
pkgname='altirra'
pkgver=4.31
pkgrel=1
pkgdesc='An 8-bit Atari computer emulator, on Wine'
arch=('x86_64' 'aarch64')
url='https://www.virtualdub.org/altirra.html'
license=('GPL-2.0-only')
depends=(
    'bash'
    'wine'
    'wine-mono'
)
optdepends=('wine-gecko: HTML help pages support')
provides=('altirra')
source=(
    'http://atari.vjetnam.cz/dow/emuROMs.zip'
    'altirra'
    'altirra.desktop'
    'altirra.png'
    'application-altirra.xml'
)
source_x86_64=("https://www.virtualdub.org/downloads/Altirra-${pkgver}.zip")
source_aarch64=("https://www.virtualdub.org/downloads/Altirra-${pkgver}-ARM64.zip")
sha256sums=(
    'f6bebc7d367d59dd1789fd17450c9a4eb329c27a5b5345f42d4854f412a45221'
    'c6aab8083ed7e68c82ffc5b74497a87610f5f11a218ec42fe67fcf827d5a62c0'
    '713b375c8467da838f4c4c9f1eca2a947aecc6c429161bc67eeedecc7c81b620'
    '5319fd88751fa886683d955976ed74eb266e9ea462ae77431b6a6c457ce42dc1'
    'cd3a40e290d999912767a70ffc8e4185019290251b350f887f4a2fa972b6c96b'
)
sha256sums_x86_64=('a02eb382730fee3075b4339ad5bd011b736c249b12841f81a828292291661f41')
sha256sums_aarch64=('67c55c12e09ffb7b0abe57f505cd05f060c0396be14bb86b8d2508e8ee9fa7f8')

package() {
    _dest="${pkgdir}/opt/${pkgname}"
    _share="${pkgdir}/usr/share"
    _bin="${pkgdir}/usr/bin"

    _exe_dest='Altirra64.exe'
    local _exe
    case $CARCH in
        'x86_64')
        _exe='Altirra64.exe'
        ;;
        'aarch64')
        _exe='AltirraARM64.exe'
        ;;
    esac

    # windows executable
    install -D -m644 "${_exe}" "${_dest}/${_exe_dest}"
    # windows program files
    # omits extras/
    install -D -m644 -t "${_dest}" 'Additions.atr' 'Altirra.chm'

    # shell script
    install -D -t "${_dest}" 'altirra'
    # firmware roms
    mv 'atari5200.rom' '5200.ROM'
    install -D -m644 -t "${_dest}/roms/" '5200.ROM' 'ATARIBAS.ROM' 'ATARIOSB.ROM' 'ATARIXL.ROM'
    # desktop entry
    install -D -m644 -t "${_share}/applications" "${pkgname}.desktop"
    install -D -m644 -t "${_share}/pixmaps" "${pkgname}.png"
    install -D -m644 -t "${_share}/mime/packages" "application-${pkgname}.xml"
    # PATH symlink
    install -d "${_bin}"
    ln -s "/opt/${pkgname}/${pkgname}" "${_bin}/${pkgname}"
}

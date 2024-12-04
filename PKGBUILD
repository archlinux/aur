# Maintainer: Siddhant Kameswar (@grimsteel) <aur dot MGF1cg at kameswar dot com>

pkgname=kicad-nightly-rpm
_pkgname=kicad-nightly
pkgver=20241202+196368e
pkgrel=1
pkgdesc='Electronic schematic and printed circuit board (PCB) design tools - RPM Binary'
arch=('x86_64')
url='https://www.kicad.org/'
license=('GPLv3')
depends=('kicad' 'boost-libs' 'glm' 'glew' 'curl' 'ngspice' 'opencascade' 'wxgtk3' 'python-wxpython' 'python' 'libcloudproviders' 'glew-2.1')
provides=('kicad-nightly' 'kicad-library-nightly')
conflicts=('kicad-nightly' 'kicad-library-nightly')

depends=(
    'kicad' 'boost-libs' 'glm' 'glew' 'curl' 'ngspice' 'opencascade' 'python-wxpython' 'python' 'libcloudproviders' 'nng' 'llhttp' 'libjpeg6-turbo'
)
options=('!strip' '!debug')

source=(
    "https://download.copr.fedorainfracloud.org/results/@kicad/kicad/fedora-40-$CHARCH/08334714-kicad-nightly/kicad-nightly-8.99.0-1.20241202git196368e.fc40.$CARCH.rpm"
    # older library versions
    "https://kojipkgs.fedoraproject.org//packages/protobuf/3.19.6/8.fc40/$CARCH/protobuf-3.19.6-8.fc40.$CARCH.rpm"
    "https://kojipkgs.fedoraproject.org//packages/libgit2/1.7.2/4.fc40/$CARCH/libgit2-1.7.2-4.fc40.$CARCH.rpm"
    "https://kojipkgs.fedoraproject.org//packages/wxGTK/3.2.4/8.fc40/$CARCH/wxGTK-3.2.4-8.fc40.$CARCH.rpm"
    "https://kojipkgs.fedoraproject.org//packages/wxGTK/3.2.4/8.fc40/$CARCH/wxBase-3.2.4-8.fc40.$CARCH.rpm"
    "https://kojipkgs.fedoraproject.org//packages/wxGTK/3.2.4/8.fc40/$CARCH/wxGTK-gl-3.2.4-8.fc40.$CARCH.rpm"
)

sha256sums=('f43bc5f4fa653b3dcfe4dca191a839dda18812f81fddd8187b6560ec619e5e3e'
            '0f451d683077cb931292eba050fd82c9bb6dd1be9f271bc6b991f0a611ebeb79'
            '447ccff835596c7cf8f205784bdb1c248c5ace90f05c19012e43b569634fc86e'
            'f0b1366d026c40d5ff87a8c07da5cc259c0dfd7d9fd444cd62fa800ce2a66aa7'
            '24da17acfa0642e6d251ee042fbb29337a2c2b91532155c5db190499609e604c'
            '4739c080d8f756398e0248ed3a15144afcd11522f21839b1b3701f4fba419d03')

package() (
    # fix lib64 references
    sed -i 's$/usr/lib64/$/usr/lib/$g' ${srcdir}/usr/bin/*

    # move bundled libraries
    mv ${srcdir}/usr/lib64/lib* "${srcdir}/usr/lib64/kicad-nightly/lib64"

    rm -rf "${srcdir}/usr/lib64/python3.12"

    # remove doc/licenses - they conflict
    rm -rf "${srcdir}/usr/share/doc/"
    rm -rf "${srcdir}/usr/share/licenses/"
    
    mkdir -p "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/bin/"
    
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/" 
    cp -r "${srcdir}/usr/lib64/." "${pkgdir}/usr/lib/" 
    cp -r "${srcdir}/usr/bin/." "${pkgdir}/usr/bin/"
    
)

# Maintainer:  Quentin Retornaz <quentin dot retornaz at yahoo dot fr>

pkgname=theswapper
pkgver=1.24
_pkgver=1409159048
pkgrel=1
pkgdesc="An atmospheric brain teaser with a sense of existential crisis."
arch=('i686' 'x86_64')
url="http://facepalmgames.com/the-swapper/"
license=('custom: commercial')
depends=('sdl2' 'sdl2_image')
source=("local://the-swapper-linux-${pkgver}_${_pkgver}.sh"
        "theswappergame_com-TheSwapper_1.desktop"
        "the_swapper_icon.png")
sha256sums=("ab9aa5c036f091a8a91795ee1bf3ade24f61515b2c966650f18c76a6f3fcaa4b"
            "f71a8d391037d93e1789716489f0c9c7fb1cfd4edc16dada6c2d5969bb98fc4d"
            "31a6118be852bb9656928bf5cdf587eed4f185e67f1e73b16852696c5440e137")
# Prevent compressing final package
PKGEXT='.pkg.tar'

package() {
    mkdir -p "${pkgdir}/opt/theswapper/"

    if [ $CARCH = 'x86_64' ]; then
        _ARCHLIB='lib64'
        _ARCHBIN='x86_64'
        _ARCHBINDEL='x86'
    elif [ $CARCH = 'i686' ]; then
        _ARCHLIB='lib'
        _ARCHBIN='x86'
        _ARCHBINDEL='x86_64'
    fi

    # Launcher and Data
    cp -Ral "${srcdir}/data/noarch/"* "${pkgdir}/opt/theswapper"
    rm -r "${pkgdir}/opt/theswapper/lib"
    rm -r "${pkgdir}/opt/theswapper/lib64"
    mkdir "${pkgdir}/opt/theswapper/${_ARCHLIB}"
    cp "${srcdir}/data/noarch/${_ARCHLIB}/libmonosgen-2.0.so.0" "${pkgdir}/opt/theswapper/${_ARCHLIB}"
    cp "${srcdir}/data/noarch/${_ARCHLIB}/libfmodex.so" "${pkgdir}/opt/theswapper/${_ARCHLIB}"
    rm "${pkgdir}/opt/theswapper/TheSwapper.bin.${_ARCHBINDEL}"

    # Install Binaries/Launchers
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/theswapper/TheSwapper.bin.${_ARCHBIN}" "${pkgdir}/usr/bin/theswapper"

    # Desktop Integration
    install -Dm644 "${srcdir}/the_swapper_icon.png" "${pkgdir}/usr/share/pixmaps/theswapper.png"
    install -Dm644 "${srcdir}/theswappergame_com-TheSwapper_1.desktop" "${pkgdir}/usr/share/applications/theswapper.desktop"

    # Permissions
    find "${pkgdir}/opt/theswapper" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/theswapper" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/theswapper/TheSwapper.bin.${_ARCHBIN}"
    chmod 755 "${pkgdir}/opt/theswapper/TheSwapper"
}

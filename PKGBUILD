# Maintainer: gabibbo97 <gabibbo97@gmail.com>

pkgname=keeweb-devel
_pkgname=keeweb
pkgver=v1.3.3.r80.gab46c0d
pkgrel=1
pkgdesc="Desktop password manager compatible with KeePass databases."
arch=('any')
url="https://github.com/keeweb/keeweb"
license=('MIT')
depends=('electron' 'xdg-utils' 'sh')
makedepends=('nodejs-grunt' 'npm' 'sed')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/keeweb/keeweb.git#branch=develop'
    'kdbx.xml'
    'keeweb.desktop')
sha512sums=('SKIP'
    'beb2de28654be6c2cb234d8ab5b983e19c25512b4814ab486785f26fe5d3609dd42acee21582f5bc54f2e0fefa676a1af833164c1b7939b83fd62923686b7665'
    'a2fcc7a18a73a024b912eb0c496f948c82fa5d7ea06c2e5a855b1bd84dcfbe2eb0152f70fe1c9c6ed725cd88dc89cca59a55e8e5657bc94f61bca6db9fc228ee')

_desktop="${_pkgname}.desktop"

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    npm install
}

build() {
    cd "${_pkgname}"
    grunt --force
}

package() {
    # Desktop icon
    desktop-file-install -m 644 --dir "${pkgdir}"/usr/share/applications/ keeweb.desktop
    # MIME type
    install -Dm644 kdbx.xml "$pkgdir"/usr/share/mime/packages/kdbx.xml
    for res in 128x128; do
        # Directory
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
        # Get the icon from the upstream repository
        install -Dm755 "${srcdir}/${_pkgname}/graphics/${res}.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/keeweb.png"
    done
    # Create and copy the program
    mkdir -p "${pkgdir}"/opt/${_pkgname}
    cp "${srcdir}/${_pkgname}/dist/index.html" "${pkgdir}"/opt/${_pkgname}

    # Create the execution script
    mkdir -p "${pkgdir}"/usr/bin/
    echo -e "#!/bin/sh\nelectron /opt/${_pkgname}/index.html --disable-updater \$1" > "${pkgdir}"/usr/bin/KeeWeb
    chmod 755 ${pkgdir}/usr/bin/KeeWeb
}


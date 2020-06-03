# Maintainer: CrocoDuck <crocoduck dot oducks at gmail dot com>

pkgname=gmsh-bin
pkgver=4.5.6
pkgrel=3
pkgdesc="A free 3D finite element grid generator with a build-in CAD engine and post-processor. Includes SDK."
arch=('i686' 'x86_64')
url="http://gmsh.info/"
license=('GPL')
depends=('libxft' 'libxinerama' 'libxcursor' 'glu')
makedepends=('wget' 'tar' 'gendesk' 'chrpath')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")

# Define Download data:
if [ $CARCH == 'x86_64' ]; then
    _archvar=64
    _downsha256sum=c758bb820365351352542a0575d673f037e3af58cbd7b3549a0c9d9d02b9a53c
else
    _archvar=32
    _downsha256sum=d953a212066cf36a1fd6491ebec5ef6f713c1e0b54559ad5628b11b81897928b
fi

prepare() {
    # Download Files:
    _downfname="gmsh-${pkgver}-Linux${_archvar}-sdk.tgz"
    wget "${url}bin/Linux/$_downfname"
    # Checksum:
    echo $_downsha256sum $_downfname|sha256sum -c || { echo 'Checksum failed!'; exit 1; }
    # Extract:
    tar zxvf $_downfname
    # Set Icon and Launcher:
    cp "${srcdir}/${pkgname%-*}-${pkgver}-Linux${_archvar}-sdk/share/doc/${pkgname%-*}/tutorial/t4_image.png" "${srcdir}/gmsh_icon.png"
    gendesk -f -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --name=${pkgname%-*} --exec=${pkgname%-*} --categories 'Education;Science;Math;'
    # Strip RPATH from binary:
    chrpath -d "${srcdir}/${pkgname%-*}-${pkgver}-Linux${_archvar}-sdk/bin/gmsh"
}

package() {
    # Program Files
    cd "${srcdir}/${pkgname%-*}-${pkgver}-Linux${_archvar}-sdk/bin"
    for file in *; do
        install -Dm 755 "$file" "${pkgdir}/usr/bin/$file"
    done
    # Include
    cd "${srcdir}/${pkgname%-*}-${pkgver}-Linux${_archvar}-sdk/include"
    for file in *; do
        install -Dm 644 "$file" "${pkgdir}/usr/include/$file"
    done
    # Lib
    cp -a "${srcdir}/${pkgname%-*}-${pkgver}-Linux${_archvar}-sdk/lib/" "${pkgdir}/usr/lib/"
    # Docs:
    cd "$srcdir"
    mkdir -p "${pkgdir}/usr/share/doc"
    cp -r "${srcdir}/${pkgname%-*}-${pkgver}-Linux${_archvar}-sdk/share/doc/${pkgname%-*}" "${pkgdir}/usr/share/doc/${pkgname%-*}"
    # Man
    cd "$srcdir"
    install -D "${srcdir}/${pkgname%-*}-${pkgver}-Linux${_archvar}-sdk/share/man/man1/${pkgname%-*}.1" "${pkgdir}/usr/share/man/man1/${pkgname%-*}.1"
    # Launcher
    install -Dm 644 "${srcdir}/gmsh_icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-*}.desktop"
}

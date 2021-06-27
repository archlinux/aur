# Maintainer: CrocoDuck <crocoduck dot oducks at gmail dot com>

pkgname=gmsh-bin
pkgver=4.8.4
pkgrel=1
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
    _downsha256sum=ca2726da474b7299512ca8c9c42fd1f9b7694a7a664c3a612855592dc82e0c1d
else
    _archvar=32
    _downsha256sum=7f4b5b97844bcb14a06e71936c81f2f5387562aa1793c419fe3b208024944709
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
    # Strip RPATH from binaries:
    chrpath -d "${srcdir}/${pkgname%-*}-${pkgver}-Linux${_archvar}-sdk/bin/gmsh"
    chrpath -d "${srcdir}/${pkgname%-*}-${pkgver}-Linux${_archvar}-sdk/lib/libgmsh.so.${pkgver}"
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
    install -Dm 644 "${srcdir}/gmsh_icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-}.png"
    install -Dm 644 "${srcdir}/${pkgname%-*}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-*}.desktop"
}

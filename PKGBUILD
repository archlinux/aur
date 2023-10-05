_pkgname=Siril
_pkgver=1.2.0
_appimage="${_pkgname}-${_pkgver}-x86_64.AppImage"
_desktopfile="org.free_astro.siril.desktop"

pkgname=siril-appimage
pkgver='1.2.0'
pkgrel=1
pkgdesc="An astronomical image processing software for Linux. (IRIS clone). Appimage version."
arch=('x86_64')
license=('GPL3')
makedepends=()   
options=(!strip)
url="https://www.siril.org/"
optdepends=('libpng: PNG import'
            'libjpeg: JPEG import and export'
            'libtiff: TIFF import and export'
            'libraw: DSLR RAW images import'
            'ffms2: films native support as image sequences and import'
            'libcurl-gnutls: check for updates'
            'gnuplot: photometry graphs creation')
source=("${_appimage}::https://free-astro.org/download/${_appimage}")
sha256sums=('43460ac640b2901205114f16d3be7ea39484bef811c9d78ff1220b09127711e4')

prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract > /dev/null
}

build() {
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_desktopfile}" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/org.free_astro.siril.svg" "${pkgdir}/usr/share/pixmaps/org.free_astro.siril.svg"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/siril"
}

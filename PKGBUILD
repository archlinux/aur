# Maintainer: LSM <sagargaud88@gmail.com>
pkgname=stacher7
pkgver=7.0.22
pkgrel=1
pkgdesc="Stacher - modern video downloader (proprietary Electron app)"
arch=('x86_64')
url="https://stacher.io"
license=('LicenseRef-freeware')
depends=('glibc' 'gtk3' 'nss' 'alsa-lib')
makedepends=('tar' 'zstd')
provides=('stacher7')
conflicts=('stacher7')
options=('!strip')
# Using the working URL you found - note: query parameter might change over time
source=("stacher7_${pkgver}_amd64.deb::https://www.videohelp.com/download/stacher7_${pkgver}_amd64.deb?r=qDbblNcJX")
sha256sums=('f9d0a0c9200cd632f80b1c036dec8671e8f801c7326ae265401fb01d7b273df6')

package() {
    # Extract the .deb
    ar x "${srcdir}/stacher7_${pkgver}_amd64.deb"
    mkdir -p extracted
    tar --use-compress-program=unzstd -xf data.tar.zst -C extracted

    # Install to /opt (standard location for proprietary software)
    install -dm755 "${pkgdir}/opt/${pkgname}"
    if [[ -d "extracted/usr/lib/${pkgname}" ]]; then
        cp -r extracted/usr/lib/${pkgname}/* "${pkgdir}/opt/${pkgname}/"
    fi

    # Symlink main binary to /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    if [[ -f "${pkgdir}/opt/${pkgname}/Stacher7" ]]; then
        ln -s "/opt/${pkgname}/Stacher7" "${pkgdir}/usr/bin/${pkgname}"
    fi

    # Install desktop entry
    if [[ -f "extracted/usr/share/applications/${pkgname}.desktop" ]]; then
        install -Dm644 "extracted/usr/share/applications/${pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    fi

    # Install icon
    if [[ -f "extracted/usr/share/pixmaps/${pkgname}.png" ]]; then
        install -Dm644 "extracted/usr/share/pixmaps/${pkgname}.png" \
            "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    fi

    # Install license if available
    if [[ -f "extracted/usr/share/doc/${pkgname}/copyright" ]]; then
        install -Dm644 "extracted/usr/share/doc/${pkgname}/copyright" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}

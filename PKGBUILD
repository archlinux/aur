# Maintainer: LSM <sagargaud88@gmail.com>
pkgname=stacher7
pkgver=7.1.4
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
source=("stacher7_${pkgver}_amd64.deb::https://s7-releases.stacher-cloud.com/s7-releases/stacher7_${pkgver}_amd64.deb")
sha256sums=('59a6ee4a59936262784062c741d8ba2c85dc983b667fdff6bd061b1b9a94ee8e')

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

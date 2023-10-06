# Maintainer: HatsuSixty <hatsunotsus+aur(at)gmail(dot)com>

# If you just use "hatsunotsus(at)gmail(dot)com"
# instead of "hatsunotsus+aur(at)gmail(dot)com"
# I probably won't read your email

pkgname=solar2d-bin
pkgver=2023.3697
pkgrel=1
pkgdesc="Simple to learn and use, completely free and open source 2D game engine"
arch=('x86_64')
url='https://solar2d.com/'
license=('MIT')
depends=('glu' 'zlib' 'openal' 'freetype2' 'libpng' 'libjpeg' 'openssl-1.1' 'curl' 'sdl2' 'java-runtime')
makedepends=('squashfs-tools')
# The license file is available in the same commit from which the snap was built from
source=("https://github.com/coronalabs/corona/releases/download/3697/Solar2D-Linux-${pkgver}_amd64.snap"
        "https://raw.githubusercontent.com/coronalabs/corona/685b98d1154c140b5bac138317621dc8ee2fa103/LICENSE.md")
sha256sums=('509a1aaf622bf41490dcfe63aa040ba4f327e9e1a4c2a7b5aa32c749a059f31a'
            '8b3bad18f5a69906b8f03a4c525af48b76bdc7a46540c633ea0b1bdcc43b4176')

prepare() {
    echo "Extracting snap file..."
    unsquashfs -q -f -d "${srcdir}/${pkgname}" "Solar2D-Linux-${pkgver}_amd64.snap"
}

package() {
    # Install files
    install -d "${pkgdir}/opt/Solar2D"
    cp -r "${srcdir}/${pkgname}/usr/local/bin/Solar2D/." "${pkgdir}/opt/Solar2D"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    cp LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}"

    # Desktop Entry
    sed -i 's|${SNAP}/meta/gui/solar2d.png|solar2d|g' "${srcdir}/${pkgname}/meta/gui/solar2d.desktop"
    sed -i 's|Exec=solar2d|Exec=Solar2D|g' "${srcdir}/${pkgname}/meta/gui/solar2d.desktop"
    install -Dm644 "${srcdir}/${pkgname}/meta/gui/solar2d.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}/meta/gui/solar2d.png" "${pkgdir}/usr/share/pixmaps/solar2d.png"

    # Symlink binaries to /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/Solar2D/Solar2D" "${pkgdir}/usr/bin"
    ln -s "/opt/Solar2D/Solar2DBuilder" "${pkgdir}/usr/bin"
    ln -s "/opt/Solar2D/Solar2DSimulator" "${pkgdir}/usr/bin"
}

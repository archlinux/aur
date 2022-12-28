# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=stashpad
pkgver=1.0.20
pkgrel=1
pkgdesc='Stashpad is the developer notepad.'
arch=('x86_64')
url='https://www.stashpad.com/'
license=('proprietary')
depends=()
makedepends=(
    'grep'
    'coreutils'
    'imagemagick'
)
_file="${pkgname}_${pkgver}"
source=("${_file}::https://releases.stashpad.com/download/appimage")
sha256sums=('6a284b7acdf36caf9bc8f115e999c7152da8f97505d3f3ae35db6c1a2f3292a4')

prepare() {
    chmod +x "${srcdir}/${_file}"
    "${srcdir}/${_file}" --appimage-extract
}

pkgver() {
    grep 'X-AppImage-Version=' "${srcdir}/squashfs-root/stashpad.desktop" | cut -d '=' -f 2
}

package() {
    install -m 644 -d "${pkgdir}/opt/${pkgname}"

    cd "${srcdir}/squashfs-root"

    rm -f AppRun chrome-sandbox chrome_crashpad_handler

    sed -E -i 's#Exec=[^\n]+#Exec=/opt/stashpad/stashpad --enable-features=UseOzonePlatform --ozone-platform-hint=auto %U#' stashpad.desktop
    install -m 644 -D -t "${pkgdir}/usr/share/applications/" stashpad.desktop
    rm -f stashpad.desktop

    install -m 644 -D -t "${pkgdir}/usr/share/icons/hicolor/0x0/apps" stashpad.png

    cp -r . "${pkgdir}/opt/${pkgname}/"
    chmod a+x "${pkgdir}/opt/${pkgname}/"
    cd "${pkgdir}/opt/${pkgname}"

    ln -f -s "/usr/share/icons/hicolor/0x0/apps/stashpad.png" stashpad.png
    chmod -R a+rx locales resources

    generate_icon 48
    generate_icon 64
    generate_icon 192
    generate_icon 256
    generate_icon 384
}

generate_icon() {
    convert -resize "$1x$1" "${srcdir}/squashfs-root/stashpad.png" icon.png
    install -m 644 -D icon.png "${pkgdir}/usr/share/icons/hicolor/$1x$1/apps/stashpad.png"
    rm -f icon.png
}


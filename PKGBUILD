# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=stashpad
pkgver=1.2.18
pkgrel=1
pkgdesc='Stashpad is the developer notepad.'
arch=('x86_64')
url='https://www.stashpad.com/'
license=('proprietary')
depends=()
makedepends=(
    'grep'
    'curl'
    'coreutils'
    'imagemagick'
)
_file="${pkgname}_${pkgver}"
source=("${_file}::https://github.com/stashpad/sp-desktop-release/releases/download/v${pkgver}/Stashpad.AppImage")
sha256sums=('ad308235807d4d4ec8de4d8f08eb51f63af3686158e91559124cff2cd238a189')

prepare() {
    chmod +x "${srcdir}/${_file}"
    "${srcdir}/${_file}" --appimage-extract
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


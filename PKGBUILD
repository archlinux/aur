# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname='everdo-bin'
pkgver=1.11.15
pkgrel=1
pkgdesc='Powerful cross-platform GTD app with focus on privacy'
arch=('x86_64')
url='https://everdo.net/'
license=('custom:Proprietary')
options=(!strip)
provides=('everdo')
conflicts=('everdo')
depends=('libxss' 'libxtst' 'libnotify')

_file="Everdo-${pkgver}.AppImage"

source=("https://downloads.everdo.net/electron/${_file}")
sha256sums=('c6c1cb8653e5de20c3650585d375839769af2db506c3afa3d336dbfc78403f8a')

prepare() {
    chmod +x "${srcdir}/${_file}"
    "${srcdir}/${_file}" --appimage-extract
}

package() {
    for item in libXss.so.1 libXtst.so.6 libnotify.so.4; do
        rm -f "${srcdir}/squashfs-root/usr/lib/${item}"
    done
    mv "${srcdir}/squashfs-root/usr" "${pkgdir}"

    sed -i 's|Exec=AppRun|Exec=/opt/everdo/everdo|g' "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -D -m644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

    for item in AppRun chrome-sandbox chrome_crashpad_handler LICENSE.electron.txt LICENSES.chromium.html "${pkgname%-bin}.desktop" everdo.png; do
        rm -f "${srcdir}/squashfs-root/${item}"
    done

    _optDir="${pkgdir}/opt/${pkgname%-bin}"
    mkdir -p "${_optDir}"
    cp -a "${srcdir}/squashfs-root/." "${_optDir}"

    find "${pkgdir}" -type d -exec chmod 755 {} +
}

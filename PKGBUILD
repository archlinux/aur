# Maintainer: Nayla Hanegan <naylahanegan@gmail.com>
pkgname="nds-banner-editor"
_pkgname="NDS_Banner_Editor"
pkgver="1.3.1"
pkgrel=1
arch=('x86_64')
pkgdesc="A tool to make animated Nintendo DS banners."
url="https://github.com/TheGameratorT/NDS_Banner_Editor"
license=('GPL3')
makedepends=('gendesk')
conflicts=('nds-banner-editor-git')
source=("source.zip::https://github.com/TheGameratorT/${_pkgname}/archive/${pkgver}.zip")
md5sums=('SKIP')

prepare() {
    # generate .desktop
    gendesk --pkgname "NDS Banner Editor" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n -f
    mv "NDS Banner Editor.desktop" "${pkgname}.desktop"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    mkdir -p resources/i18n
    lrelease NDS_Banner_Editor.pro && mv i18n/*.qm resources/i18n
    mkdir -p build && cd build
    qmake ..
    make
}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/usr/bin/"
    cd "${srcdir}/${_pkgname}-${pkgver}/build"
    cp -Rr "${srcdir}/${_pkgname}-${pkgver}/build/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # desktop entry
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # install the icon
    install -d -m755 "${pkgdir}/usr/share/icons/"
    cp -Rr "${srcdir}/${_pkgname}-${pkgver}/icon.png" "${pkgdir}/usr/share/icons/${pkgname}.png"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"usr -type d -exec chmod 755 {} \;
    find "${pkgdir}/"usr -type f -exec chmod 644 {} \;

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/usr/bin/${pkgname}"
}

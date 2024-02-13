# Maintainer: Kostoski Stefan <kostoski.stefan90@gmail.com>

_appname=hoverclock-qt
pkgname=hoverclock-qt-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Hoverclock QT - A simple floating clock for Linux"
arch=('x86_64')
url="https://github.com/kostoskistefan/hoverclock-qt"
license=('GPL3')
provides=('hoverclock-qt')
conflicts=('hoverclock-appimage' 'hoverclock')
options=(!strip)
source=("Hoverclock-QT.zip::$url/releases/download/v$pkgver/Hoverclock-QT.zip"
        "https://raw.githubusercontent.com/kostoskistefan/hoverclock/main/LICENSE")
md5sums=('e03766ea6076c522252635637ac45f7a'
         '1ebbd3e34237af26da5dc08a4e440464')

package() {
    # Create app directory
    install -dm755 "${pkgdir}/opt/${_appname}/"

    # Make app executable
    chmod 755 "${srcdir}/${_appname}.sh"
    chmod 755 "${srcdir}/bin/${_appname}"

    # Copy app files
    cp -R ${srcdir}/{bin,icons,lib,plugins,${_appname}.sh} "${pkgdir}/opt/${_appname}/"

    # Install Desktop file
    install -Dm644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

    # Install icon
    install -Dm644 "${srcdir}/icons/${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_appname}/${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_appname}/LICENSE"
}

post_install() {
    update-mime-database /usr/share/mime || true
    update-desktop-database /usr/share/applications || true
    rm ~/.cache/icon-cache.kcache
}

post_remove() {
    rm -f "/opt/${_appname}"
    rm -f "/usr/bin/${_appname}"
}

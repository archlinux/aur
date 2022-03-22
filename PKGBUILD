# Maintainer: Kostoski Stefan <kostoski.stefan90@gmail.com>

_appname=hoverclock
pkgname=hoverclock-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Hoverclock - A simple floating clock for linux"
arch=('x86_64')
url="https://github.com/kostoskistefan/hoverclock"
license=('GPL3')
provides=('hoverclock')
conflicts=('hoverclock-appimage')
options=(!strip)
source=("Hoverclock.zip::$url/releases/download/v$pkgver/Hoverclock.zip"
        "https://raw.githubusercontent.com/kostoskistefan/hoverclock/main/LICENSE")
md5sums=('d2c267d75c167e96e1e49cae58a00571'
         '1ebbd3e34237af26da5dc08a4e440464')

package() {
    # Create app directory
    install -dm755 "${pkgdir}/opt/${_appname}/"

    # Make app executable
    chmod 755 "${srcdir}/${_appname}.sh"
    chmod 755 "${srcdir}/bin/${_appname}"

    # Copy app files
    cp -R "${srcdir}/." "${pkgdir}/opt/${_appname}"

    # Install Desktop file
    install -Dm644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

    # Install icon
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    cp -a "${srcdir}/icons/" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_appname}/${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"

    # Install license
    install -dm755 "${pkgdir}/usr/share/licenses/${_appname}/"
    ln -s "/opt/${_appname}/LICENSE" "${pkgdir}/usr/share/licenses/${_appname}"

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

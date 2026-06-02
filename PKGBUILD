# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Rene Peinthor <peinthor@gmail.com>

pkgname=smartsvn
pkgver=14.5.0
pkgrel=1
pkgdesc="A Subversion (SVN) GUI client"
arch=("any")
url="https://www.smartsvn.com"
license=('LicenseRef-custom')
depends=("java-runtime" "desktop-file-utils" "hunspell-dictionary" "hicolor-icon-theme")
source=("https://www.smartsvn.com/downloads/${pkgname}/${pkgname}-linux-${pkgver//\./_}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('955e30ba1850052562a570f4dc8aab3cfb00eb2b9fa556e060cb38a0551a47b3'
            'ab0ef714cdb1ba8f188b04f4accaf661501503234b4cedd335e200498b6e3b35')

package() {
    # Install license files
    install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgname}/licenses"/* "${pkgdir}/usr/share/licenses/${pkgname}"
    rmdir "${pkgname}/licenses"
    ln -s /opt/${pkgname}/license.html "${pkgdir}/usr/share/licenses/${pkgname}"
    # Remove bundled jre
    rm -rf "${pkgname}/jre"
    # Install application files
    install -d -m 755 "${pkgdir}/opt"
    mv "${pkgname}" "${pkgdir}/opt/${pkgname}"
    # Install desktop file
    install -D -m 644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    # Install icon files
    install -d -m 755 "${pkgdir}/usr/share/icons/hicolor"
    cd "${pkgdir}/usr/share/icons/hicolor"
    for _size in 32 48 64 128 256
    do
        install -d "${_size}x${_size}/apps"
        ln -s "/opt/${pkgname}/bin/smartsvn-${_size}.png" "${_size}x${_size}/apps/${pkgname}.png"
    done
    # Add symlink to /usr/bin
    chmod 755 "${pkgdir}/opt/${pkgname}/bin/smartsvn.sh"
    install -d -m 755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/bin/smartsvn.sh" "${pkgdir}/usr/bin/${pkgname}"
    # Symlink hunspell dictionaries
    ln -s "/usr/share/hunspell" "${pkgdir}/opt/${pkgname}/dictionaries"
}

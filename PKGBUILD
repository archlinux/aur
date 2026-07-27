# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=(zoho-cliq zoho-cliq-electron)
pkgver=1.8.4
pkgrel=1
pkgdesc='Zoho Cliq communication software'
arch=('x86_64')
url="https://www.zoho.com/cliq/desktop/linux.html"
license=('Proprietary')
provides=('zoho-cliq')
depends=('alsa-lib' 'gtk3' 'libsecret' 'libxss' 'libxtst' 'nss' 'xdg-utils')
optdepends=('libappindicator-gtk3: Systray indicator support'
    'org.freedesktop.secrets: Keyring password store support')
source=(
    "https://downloads.zohocdn.com/chat-desktop/linux/cliq_${pkgver}_amd64.deb"
)
sha256sums=('b22ff6ef201be5371c454417139b36280ebdc5eab669adc859e1aaa2816677dd')

package_zoho-cliq() {
    conflicts=('zoho-cliq-electron' 'zoho-cliq-upstream-electron')
    install -d "${pkgdir}/opt/Cliq"
    install -d "${pkgdir}/usr/share"
    cd "${srcdir}"
    tar xf data.tar.xz
    cp -r opt/Cliq/* "${pkgdir}/opt/Cliq/"
    cp -r usr/share/* "${pkgdir}/usr/share/"
}

package_zoho-cliq-electron() {
    # The only difference is that this package copies over only the resources/ folder
    # and creates a launcher wrapper.
    electron_ver='electron39'
    depends+=($electron_ver)
    conflicts=('zoho-cliq')
    provides=('zoho-cliq' 'zoho-cliq-upstream-electron')
    pkgdesc='Zoho Cliq running on upstream Electron (experimental)'

    install -d "${pkgdir}/opt/Cliq"
    install -d "${pkgdir}/usr/share"
    cd "${srcdir}"
    tar xf data.tar.xz
    cp -r opt/Cliq/resources/* "${pkgdir}/opt/Cliq/"
    cp -r usr/share/* "${pkgdir}/usr/share/"

    echo -e "#!/bin/sh\n\nexec /usr/bin/$electron_ver /opt/Cliq/app.asar" >"${pkgdir}/opt/Cliq/cliq"
    chmod +x "${pkgdir}/opt/Cliq/cliq"
}

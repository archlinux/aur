# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: nerflad <nerflad@gmail.com>

pkgname=ghetto-skype
pkgver=1.6.0
pkgrel=1
pkgdesc='Web Skype + Tray Icon + Notifications'
arch=('x86_64')
url='https://github.com/stanfieldr/ghetto-skype'
license=('GPL3')
depends=('electron')
optdepends=('libappindicator-gtk2: Tray Icon support for certain DEs')
makedepends=('npm' 'python2')
install=ghetto-skype.install
source=("https://github.com/stanfieldr/ghetto-skype/archive/v${pkgver}.tar.gz")
sha256sums=('35c5a8a2cc964ea09b89ee4a196bbc1aa440be76ce2acc89ab3fd89fa182eb0f')

prepare() {
    cd "${pkgname}-${pkgver}"
    sed -i src/assets/skype.desktop -e '/^Exec=/ c \Exec=/usr/bin/ghetto-skype'
}

build() {
    cd ${pkgname}-${pkgver}/src
    npm install --production
}

package() {
    mkdir "${pkgdir}/opt"
    mv "${pkgname}-${pkgver}/src" "${pkgname}-${pkgver}/ghetto-skype"
    cp -r "${pkgname}-${pkgver}/ghetto-skype" "${pkgdir}/opt/."

    install -Dm0644 "${pkgname}-${pkgver}/ghetto-skype/assets/skype.desktop" "${pkgdir}/usr/share/applications/ghetto-skype.desktop"
    install -Dm0644 "${pkgname}-${pkgver}/ghetto-skype/assets/tray/skype.png" "${pkgdir}/usr/share/pixmaps/ghetto-skype.png"
    install -Dm0644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

    mkdir -p "${pkgdir}/usr/bin"
    echo -e "#!/bin/bash\n/usr/bin/electron /opt/ghetto-skype" >> "${pkgdir}/usr/bin/ghetto-skype"
    chmod 755 "${pkgdir}/usr/bin/ghetto-skype"
}

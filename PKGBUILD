# Maintainer: Kimiblock <pn3535 at icloud dot com>

pkgname=rocketchat-client-electron-bin
pkgver=3.8.12
pkgrel=2
pkgdesc="The Ultimate Open Source Web Chat Platform, using system electron"
arch=('x86_64')
license=('MIT')
url='https://rocket.chat'
depends=('gtk3' 'nss' 'libxss' 'electron')
optdepends=('libnotify: Desktop notifications'
            'libindicator-gtk3: System tray icon')
provides=('rocketchat-desktop')
conflicts=('rocketchat-desktop')
source=("https://github.com/RocketChat/Rocket.Chat.Electron/releases/download/$pkgver/rocketchat-$pkgver-linux-amd64.deb"
        'LICENSE')
sha256sums=('SKIP'
            'SKIP')

package() {
    cd "${srcdir}"
    tar -xf data.tar.xz
    for directory in "${pkgdir}"/usr/bin "${pkgdir}"/usr/share/applications ${pkgdir}/opt/Rocket.Chat/resources; do
        mkdir -m 755 -p ${directory}
    done
    cp ${srcdir}/opt/Rocket.Chat/resources/app.asar ${pkgdir}/opt/Rocket.Chat/resources/
    install -Dm644 "$srcdir"/LICENSE "${pkgdir}"/usr/share/licenses/"$pkgname"/LICENSE
    echo '[Desktop Entry]
Name=Rocket.Chat
Exec=rocketchat-desktop-electron-bin %U
Terminal=false
Type=Application
Icon=rocketchat-desktop
StartupWMClass=Rocket.Chat
MimeType=x-scheme-handler/rocketchat;
Comment=Official OSX, Windows, and Linux Desktop Clients for Rocket.Chat
Categories=GNOME;GTK;Network;InstantMessaging;' >"${pkgdir}"/usr/share/applications/rocketchat-desktop.desktop
    echo '#!/bin/bash
exec electron /opt/Rocket.Chat/resources/app.asar "$@"' >"${pkgdir}"/usr/bin/rocketchat-desktop-electron-bin
    chmod 755 ${pkgdir}/* -R
    chmod 755 "${pkgdir}"/usr/bin/rocketchat-desktop-electron-bin
}

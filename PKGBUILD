# Maintainer: Nathan Chere <git@nathanchere.com.au>
pkgname=grayjay-bin
pkgver=0.r20241225
pkgrel=1
pkgdesc="Grayjay Desktop - follow creators, not platform (privacy- and freedom-respecting client for YouTube, Rumble, Twitch, Spotify etc)"
arch=('x86_64')
url="https://grayjay.app/desktop/"
license=('Source First License 1.1')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libsecret' 'libappindicator-gtk3')
provides=('grayjay')
conflicts=('grayjay')
options=(!strip)
_filename="Grayjay.Desktop-linux-x64.zip"
source=("${_filename}::https://updater.grayjay.app/Apps/Grayjay.Desktop/${_filename}")
sha256sums=('314e002552a413cd3f13d8a4abd44a20bf59de7a70982d8dd0f1f26ddfbe8d03')

prepare() {
    mkdir -p "${srcdir}/grayjay"
    unzip -q "${srcdir}/${_filename}" -d "${srcdir}/grayjay"
}

package() {
    cd "${srcdir}/grayjay/Grayjay.Desktop-linux-x64-v2"
    install -dm755 "${pkgdir}/opt/grayjay"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"

    cp -r ./* "${pkgdir}/opt/grayjay/"
    cat > "${pkgdir}/usr/bin/grayjay" << EOF
#!/bin/sh
exec /opt/grayjay/Grayjay "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/grayjay"

    cat > "${pkgdir}/usr/share/applications/grayjay.desktop" << EOF
[Desktop Entry]
Name=Grayjay
Comment=Privacy-respecting client for YouTube, Rumble, Twitch, Spotify etc
Exec=/usr/bin/grayjay
Icon=grayjay
Terminal=false
Type=Application
Categories=Network;Video;AudioVideo;
EOF

    install -Dm644 "grayjay.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/grayjay.png"

    chmod 755 "${pkgdir}/opt/grayjay/Grayjay"
}

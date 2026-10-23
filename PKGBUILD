# Maintainer: NetExperts <support@netexperts.com.au>
pkgname=netexperts-support-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="NetExperts Remote Support with first-run staff-access choice (based on RustDesk)"
arch=('x86_64')
url="https://netexperts.com.au/source-code.html"
license=('AGPL-3.0-only')
depends=('gtk3' 'libxcb' 'xdg-utils' 'xdotool' 'libxfixes' 'alsa-lib'
         'libva' 'libpulse' 'gst-plugins-base-libs' 'libayatana-appindicator'
         'sudo' 'polkit' 'ttf-dejavu')
optdepends=('xdg-desktop-portal: Wayland screen capture'
            'gst-plugin-pipewire: Wayland screen capture')
provides=('netexperts-support')
conflicts=('netexperts-support' 'rustdesk' 'rustdesk-bin')
options=('!strip' '!debug')
install=netexperts-support.install
source=("https://netexperts.com.au/opensource/netexperts-support-${pkgver}-x86_64-linux.tar.gz"
        "https://netexperts.com.au/opensource/NetExpertsSupport-${pkgver}-linux-source.tar.gz"
        'netexpertssupport.service')
noextract=("NetExpertsSupport-${pkgver}-linux-source.tar.gz")
sha256sums=('4738c460a03363ae2a80602d1fca767d276b0604bdfbd7f975cbbc01a90c59f5' 'da49bf66995c30fcf85a63fba34f451b4c8370bf5c4ed62cf64d1e0da30e4e27' '9e78d6f83f918235d9004cc7adabf0b13bacaed0151a2e328cdc37d2d11cb3f3')

package() {
    install -dm755 "${pkgdir}/usr/lib/netexperts-support"
    cp -a "${srcdir}/bundle/"* "${pkgdir}/usr/lib/netexperts-support/"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /usr/lib/netexperts-support/rustdesk "${pkgdir}/usr/bin/netexperts-support"
    install -Dm644 "${srcdir}/netexpertssupport.service" \
        "${pkgdir}/usr/lib/systemd/system/netexpertssupport.service"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/netexperts-support.desktop" <<EOF
[Desktop Entry]
Name=NetExperts Support
Comment=NetExperts Remote Support
Exec=/usr/bin/netexperts-support
Icon=netexperts-support
Terminal=false
Type=Application
Categories=Network;RemoteAccess;
StartupNotify=true
EOF
    install -Dm644 "${srcdir}/bundle/data/flutter_assets/assets/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/netexperts-support.svg"
    install -dm700 "${pkgdir}/source/netexperts-support/${pkgver}"
    install -m600 "${srcdir}/NetExpertsSupport-${pkgver}-linux-source.tar.gz" \
        "${pkgdir}/source/netexperts-support/${pkgver}/"
}

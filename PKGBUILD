# Maintainer: NetExperts <support@netexperts.com.au>
pkgname=netexperts-support-bin
pkgver=1.5.4.1
pkgrel=1
pkgdesc="NetExperts Remote Support with automatic relay fallback and staff access enabled by default (based on RustDesk)"
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
sha256sums=('8dac9cac85c4f1b5e004ac6864a77ccefe75de21d0986db80a8cf845331feaa4' 'fdd7a7dc6e4c0de17a9f651f52e3f4284fe78d22ff66a5f7f964bb78a55e6e3a' '9e78d6f83f918235d9004cc7adabf0b13bacaed0151a2e328cdc37d2d11cb3f3')

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

# Maintainer: darkinsun <42946064+darkinsun@users.noreply.github.com>
pkgname=bingspotany-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="A modern, cross-platform daily wallpaper manager fetching from Bing and Spotlight"
arch=('x86_64')
url="https://github.com/darkinsun/BingSpotAny"
license=('GPL3')
provides=('bingspotany')
conflicts=('bingspotany')

# Fetch source dynamically using the pkgver variable
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/darkinsun/BingSpotAny/releases/download/v${pkgver}/BingSpotAny-Linux-x64.tar.gz")
# REPLACE THIS WITH YOUR HASH
sha256sums=('93944875bf0a4ed65265a180cb427fd024f4e3aa78f4e6ef50f8c45d04e070e0')

# PREVENT BINARY CORRUPTION
options=('!strip')

package() {
    # 1. Create standard Linux system directories
    install -d "${pkgdir}/opt/BingSpotAny"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"

    # 2. Go directly inside the folder extracted from the tar.gz file.
    cd "${srcdir}/BingSpotAny-Linux-x64"

    # 3. Copy using archive mode to preserve correct standard permissions
    cp -a * "${pkgdir}/opt/BingSpotAny/"

    # 4. Ensure the main binary is executable
    chmod +x "${pkgdir}/opt/BingSpotAny/BingSpotAny"

    # 5. Create a symlink so the user can just type 'bingspotany'
    ln -s "/opt/BingSpotAny/BingSpotAny" "${pkgdir}/usr/bin/bingspotany"

    # 6. Use install -Dm644 to safely write the desktop file with correct system permissions
    cat <<EOF > "${srcdir}/bingspotany.desktop"
[Desktop Entry]
Name=BingSpotAny
Comment=Daily wallpaper manager (Runs in system tray)
Exec=/usr/bin/bingspotany
Icon=/opt/BingSpotAny/Assets/icon.png
Terminal=false
Type=Application
Categories=Utility;DesktopSettings;
EOF

    install -Dm644 "${srcdir}/bingspotany.desktop" "${pkgdir}/usr/share/applications/bingspotany.desktop"
}
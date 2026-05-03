# Maintainer: OneZ3r0 <onez3r0@outlook.com>
pkgname=gaomontablet-m5-driver
pkgver=16.0.0.37
pkgrel=1
pkgdesc="Official Gaomon Tablet Linux Driver (M5 V2)"
arch=('x86_64')
url="https://www.gaomon.cn/"
license=('0BSD' 'LGPL')
depends=('xdotool' 'libx11' 'libxext' 'libxtst')
options=('!strip')
install="${pkgname}.install"

# add UA and Referer in order to download Official Driver
DLAGENTS=('https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -A Mozilla/5.0 -e https://www.gaomon.cn/download -o %o %u')

source=("https://driver.gaomon.cn/download/Driver/Linux/GaomonTablet_LinuxDriver_v${pkgver}.${CARCH}.tar.xz"
        "LICENSE")
sha256sums=('d3db3cad152049e6913ae744f497686a8c4b61ef91fe664c84ffe55ebc96bd01'
            '150b7f86555bd68e638ababa1895ba2e5caed4efaa380235b00db6f5b59ac1d9')

package() {
    cd "${srcdir}"

    # Install main application files
    install -d "${pkgdir}/usr/lib/gaomontablet"
    cp -r gaomon/gaomontablet/* "${pkgdir}/usr/lib/gaomontablet/"

    # Remove bundled xdotool/libxdo — use system packages via depends instead
    rm -rf "${pkgdir}/usr/lib/gaomontablet/xdotool"

    # Runtime dot-files (.HuionCore.pid, .DriverUI.pid, .huion.log) are not
    # copied here: bash's * glob excludes dot-files, so they never enter pkgdir.
    # They are created at runtime by the driver in /usr/lib/gaomontablet/.

    # Set executable permissions
    chmod 755 "${pkgdir}/usr/lib/gaomontablet/"*.sh
    chmod 755 "${pkgdir}/usr/lib/gaomontablet/huionCore"
    chmod 755 "${pkgdir}/usr/lib/gaomontablet/gaomontablet"

    # Udev rules
    install -Dm644 gaomon/gaomontablet/res/rule/20-gaomon.rules \
        "${pkgdir}/usr/lib/udev/rules.d/20-gaomon.rules"

    # Desktop entry — application menu only, no autostart
    install -Dm644 gaomon/xdg/autostart/gaomontablet.desktop \
        "${pkgdir}/usr/share/applications/gaomontablet.desktop"
    # Replace absolute icon path with a theme-friendly icon name
    sed -i 's|^Icon=.*|Icon=gaomontablet|' \
        "${pkgdir}/usr/share/applications/gaomontablet.desktop"

    # Icon
    install -Dm644 gaomon/icon/gaomontablet.png \
        "${pkgdir}/usr/share/pixmaps/gaomontablet.png"

    # License
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 gaomon/gaomontablet/LGPL \
        "${pkgdir}/usr/share/licenses/${pkgname}/LGPL"

    # tmpfiles.d: restore writable permissions on config/log files at each boot.
    # The driver runs as a regular user and must write to files under /usr/lib.
    # Using tmpfiles.d is the standard Arch approach for closed-source drivers.
    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf" << 'EOF'
# Gaomon tablet driver — allow non-root driver process to write configuration.
# Z adjusts permissions recursively (directory + all contents); z is non-recursive (single path).
Z /usr/lib/gaomontablet/res 0777 root root -
z /usr/lib/gaomontablet/log.conf 0666 root root -
EOF
}

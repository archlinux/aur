# Maintainer: Benjamim Gois <benjamimgois@gmail.com>
pkgname=opengrid-git
pkgver=r1.g0000000
pkgrel=1
pkgdesc="Modern graphical interface for network management with Serial, SSH, TFTP, IP Scanner, SNMP, Traceroute, VulnScan and Speed Test (iPerf3 / speedtest.net)"
arch=('any')
url="https://github.com/benjamimgois/opengrid"
license=('GPL-3.0-or-later')
depends=('python' 'python-pyqt6' 'python-pyte' 'python-paramiko' 'python-pysnmp' 'python-standard-telnetlib' 'qt6-serialport' 'picocom' 'sudo' 'openssh' 'samba' 'iperf3' 'traceroute' 'mtr' 'networkmanager' 'nmap')
optdepends=('python-speedtest-cli: speedtest.net speed test support'
            'python-pyftpdlib: built-in FTP server support'
            'tigervnc: VNC remote desktop viewer'
            'freerdp: RDP remote desktop client (provides wlfreerdp for Wayland)')
makedepends=('git')
provides=('opengrid')
conflicts=('opengrid')
install=opengrid.install
source=("${pkgname}::git+https://github.com/benjamimgois/opengrid.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"

    # Install main script
    install -Dm755 opengrid "${pkgdir}/usr/bin/opengrid"

    # Install pre-built PNG sizes
    for size in 16 32 48 64 128 256 512; do
        install -Dm644 "assets/icons/opengrid-${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/opengrid.png"
    done

    # Install author photo for About dialog
    install -Dm644 assets/photo.png "${pkgdir}/usr/share/opengrid/photo.png"

    # Install UI icons (sidebar and misc) — all SVGs
    for icon in assets/icons/*.svg; do
        install -Dm644 "${icon}" "${pkgdir}/usr/share/opengrid/icons/$(basename ${icon})"
    done

    # Install vendor icons
    for vendor in assets/vendors/*.svg; do
        install -Dm644 "${vendor}" "${pkgdir}/usr/share/opengrid/vendors/$(basename ${vendor})"
    done

    # Install desktop file
    install -Dm644 opengrid.desktop "${pkgdir}/usr/share/applications/opengrid.desktop"

    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/opengrid/README.md"
    install -Dm644 docs/INTERFACE.md "${pkgdir}/usr/share/doc/opengrid/INTERFACE.md"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

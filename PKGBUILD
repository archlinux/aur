# Maintainer: Benjamim Gois <benjamimgois@gmail.com>
pkgname=cetus-git
pkgver=r416.g40cef91
pkgrel=2
pkgdesc="Modern graphical interface for network management with Serial, SSH, TFTP, IP Scanner, SNMP, Traceroute, VulnScan and Speed Test (iPerf3 / speedtest.net)"
arch=('any')
url="https://github.com/benjamimgois/opengrid"
license=('GPL-3.0-or-later')
depends=(
    'python' 'python-pyqt6' 'python-pyte' 'python-paramiko'
    'python-pysnmp' 'python-standard-telnetlib' 'qt6-serialport'
    'picocom' 'sudo' 'openssh' 'samba' 'iperf3' 'traceroute'
    'mtr' 'networkmanager' 'nmap'
)
optdepends=(
    'python-speedtest-cli: speedtest.net speed test support'
    'python-pyftpdlib: built-in FTP server support'
    'tigervnc: VNC remote desktop viewer'
    'freerdp: RDP remote desktop client'
)
makedepends=('git')
provides=('cetus')
conflicts=('cetus')
install=cetus.install
source=("${pkgname}::git+https://github.com/benjamimgois/opengrid.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"

    # Install main launcher script
    install -Dm755 cetus "${pkgdir}/usr/bin/cetus"

    # Install cetuslib module under /usr/share/cetus
    install -dm755 "${pkgdir}/usr/share/cetus"
    cp -r cetuslib "${pkgdir}/usr/share/cetus/cetuslib"

    # Create a .pth file in site-packages so Python always finds cetuslib,
    # regardless of whether the launcher's path discovery works.
    local sitepkg
    sitepkg="$(PYTHONPATH= python3 -c "
import site
for sp in site.getsitepackages():
    if sp.startswith('/usr/lib/'):
        print(sp)
        break
" 2>/dev/null)"
    if [ -n "${sitepkg}" ]; then
        install -dm755 "${pkgdir}${sitepkg}"
        echo "/usr/share/cetus" > "${pkgdir}${sitepkg}/cetus.pth"
    fi

    # Install icons
    for size in 16 32 48 64 128 256 512; do
        install -Dm644 "assets/icons/cetus-${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/cetus.png"
    done

    # Install author photo for About dialog
    install -Dm644 assets/photo.png "${pkgdir}/usr/share/cetus/photo.png"

    # Install UI icons
    install -dm755 "${pkgdir}/usr/share/cetus/icons"
    for icon in assets/icons/*.svg; do
        install -Dm644 "${icon}" "${pkgdir}/usr/share/cetus/icons/$(basename ${icon})"
    done

    # Install vendor icons
    install -dm755 "${pkgdir}/usr/share/cetus/vendors"
    for vendor in assets/vendors/*.svg; do
        install -Dm644 "${vendor}" "${pkgdir}/usr/share/cetus/vendors/$(basename ${vendor})"
    done

    # Install desktop file
    install -Dm644 cetus.desktop "${pkgdir}/usr/share/applications/cetus.desktop"

    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/cetus/README.md"
    install -Dm644 docs/INTERFACE.md "${pkgdir}/usr/share/doc/cetus/INTERFACE.md"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

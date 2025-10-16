# NOTE: Cisco Packet Tracer must be downloaded manually from:
#       https://www.netacad.com/resources/lab-downloads
#       Place the .deb file in the same directory as this PKGBUILD before building.

# Maintainer: Sx4DoW <yuformini9@gmail.com>
pkgname=packettracer900-bin
pkgver=9.0.0
pkgrel=1
pkgdesc="Cisco Packet Tracer 9.0.0 - Network simulation tool (user must download the .deb file, check README for more info)"
arch=('x86_64')
url="https://www.netacad.com/courses/packet-tracer"
license=('Proprietary')
depends=('glibc' 'libpng' 'libsm' 'libx11' 'libxext' 'libxrender' 'libxcb' 'libxkbcommon-x11' 'mesa' 'glu')
makedepends=('desktop-file-utils' 'fakeroot' 'tar' 'libarchive')

options=('!strip' '!emptydirs')

# The user must download CiscoPacketTracer900_Open_Beta_July_Build680_linux_amd64.deb manually
source=("CiscoPacketTracer900_Open_Beta_July_Build680_linux_amd64.deb"
        "packettracer.sh"
        "cisco-pt.desktop")
sha256sums=('SKIP'
            '11326a890b2b227c8f6a64466756785e1d2f10e7951dd90f7b5a3efa799653e8'
            '36db2fa62149835a9d959d501a1aa10725bbe551f9b49cc6578a3bfc8ada2eb2')

prepare() {
    mkdir -p "$srcdir/deb"
    bsdtar -xf "$srcdir/CiscoPacketTracer900_Open_Beta_July_Build680_linux_amd64.deb" -C "$srcdir/deb"
}

build() {
    return 0
}

package() {
    cd "$srcdir/deb"

    # Extract data.tar.* to $pkgdir
    for f in data.tar*; do
        bsdtar -xf "$f" -C "$pkgdir"
    done

    # Move Packet Tracer files from opt/pt to /usr/lib/packettracer
    mkdir -p "$pkgdir/usr/lib/packettracer"
    if [ -d "$pkgdir/opt/pt" ]; then
        cp -r "$pkgdir/opt/pt/"* "$pkgdir/usr/lib/packettracer/"
    fi
    rm -rf "$pkgdir/opt"

    # Set permissions for directories
    [[ -d "$pkgdir/usr/lib/packettracer/help/" ]] && find "$pkgdir/usr/lib/packettracer/help/" -type d -exec chmod 755 {} \;
    [[ -d "$pkgdir/usr/lib/packettracer/saves/" ]] && find "$pkgdir/usr/lib/packettracer/saves/" -type d -exec chmod 555 {} \;
    [[ -d "$pkgdir/usr/lib/packettracer/art/RackView/CablePegboard/" ]] && find "$pkgdir/usr/lib/packettracer/art/RackView/CablePegboard/" -type d -exec chmod 775 {} \;
    [[ -d "$pkgdir/usr/lib/packettracer/bin/xcbglintegrations/" ]] && find "$pkgdir/usr/lib/packettracer/bin/xcbglintegrations/" -type d -exec chmod 775 {} \;

    # Patch internal binaries/scripts for correct paths
    PT_BIN="$pkgdir/usr/lib/packettracer/packettracer"
    if [ -f "$PT_BIN" ]; then
        sed -i 's|/opt/pt|/usr/lib/packettracer|' "$PT_BIN" "$pkgdir/usr/lib/packettracer/linguist"
    fi

    # Install wrapper script
    install -Dm755 "$srcdir/packettracer.sh" "$pkgdir/usr/bin/packettracer_run.sh"

    # Install desktop file pointing to wrapper
    mkdir -p "$pkgdir/usr/share/applications"
    install -Dm644 "$srcdir/cisco-pt.desktop" "$pkgdir/usr/share/applications/cisco-pt.desktop"

    # Replace Exec in desktop file to use wrapper
    sed -i 's|Exec=.*|Exec=/usr/bin/packettracer_run.sh %f|' "$pkgdir/usr/share/applications/cisco-pt.desktop"

    # Install license file if exists
    if [ -f "$pkgdir/usr/lib/packettracer/help/default/copyrights.htm" ]; then
        install -Dm644 "$pkgdir/usr/lib/packettracer/help/default/copyrights.htm" "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
    fi
}


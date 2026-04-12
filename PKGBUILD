# Maintainer: Morrowdust <morrowdust@qq.com>

pkgname=huiontablet-frego
pkgver=15.0.0.C162
pkgrel=1
pkgdesc="Official Huion Tablet Frego Driver"
arch=('x86_64')
url="https://www.huion.com/download/"
license=('custom:LGPL')
depends=('libx11' 'libxext' 'libxrandr' 'libxtst' 'libxrender' 'libxkbcommon' 'libxcb' 'dbus' 'gcc-libs' 'xdotool')
options=('!strip' '!debug')
install=huiontablet-frego.install

_debname="HuionTablet_LinuxDriver_v${pkgver}.${arch}.deb"
_deburl="https://driver.huion.cn/Driver/L310_L610_GS1333/${_debname}"

prepare() {
    cd "$srcdir"

    # Download deb package with required User-Agent and Referer headers
    if [ ! -f "$srcdir/${_debname}" ]; then
        msg2 "Downloading ${_debname}..."
        curl -L -A "Mozilla/5.0" --referer "https://www.huion.cn/" \
            -f -o "$srcdir/${_debname}" "${_deburl}"
    fi

    # Extract the deb package
    if [ -f "$srcdir/${_debname}" ]; then
        msg2 "Extracting deb package..."
        bsdtar -xf "$srcdir/${_debname}" 2>/dev/null || true

        # Extract the data tarball
        for tarball in data.tar.xz data.tar.gz data.tar.bz2; do
            if [ -f "$tarball" ]; then
                msg2 "Extracting $tarball..."
                bsdtar -xf "$tarball"
                break
            fi
        done
    fi
}

package() {
    local src_data="$srcdir"

    # Verify data directory exists
    if [ ! -d "$src_data/usr/lib/huiontablet" ]; then
        error "Huiontablet directory not found. Deb package extraction may have failed."
        return 1
    fi

    # Install main application directory
    install -dm755 "$pkgdir/usr/lib/huiontablet"
    cp -a "$src_data/usr/lib/huiontablet/"* "$pkgdir/usr/lib/huiontablet/"

    # Remove stale runtime PID and log files from the deb package
    rm -f "$pkgdir/usr/lib/huiontablet/.DriverUI.pid"
    rm -f "$pkgdir/usr/lib/huiontablet/.HuionCore.pid"
    rm -f "$pkgdir/usr/lib/huiontablet/.huion.log"

    # Set executable permissions on binaries and scripts
    chmod 755 "$pkgdir/usr/lib/huiontablet/huionCore"
    chmod 755 "$pkgdir/usr/lib/huiontablet/huiontablet"
    chmod 755 "$pkgdir/usr/lib/huiontablet/huionCore.sh"
    chmod 755 "$pkgdir/usr/lib/huiontablet/huiontablet.sh"
    chmod 755 "$pkgdir/usr/lib/huiontablet/xdotool/xdotool"

    # Set permissions on shared libraries
    find "$pkgdir/usr/lib/huiontablet/libs" -type f -name "*.so*" -exec chmod 755 {} \;
    find "$pkgdir/usr/lib/huiontablet/plugins" -type f -name "*.so" -exec chmod 755 {} \;
    find "$pkgdir/usr/lib/huiontablet/qml" -type f -name "*.so" -exec chmod 755 {} \;

    # Install udev rules
    install -Dm644 "$src_data/usr/lib/udev/rules.d/20-huion.rules" \
        "$pkgdir/usr/lib/udev/rules.d/20-huion.rules"

    # Install desktop entry
    install -Dm644 "$src_data/usr/share/applications/huiontablet.desktop" \
        "$pkgdir/usr/share/applications/huiontablet.desktop"

    # Install icon
    install -Dm644 "$src_data/usr/share/icons/huiontablet.png" \
        "$pkgdir/usr/share/icons/huiontablet.png"

    # Install autostart entry
    install -Dm644 "$src_data/etc/xdg/autostart/huiontablet.desktop" \
        "$pkgdir/etc/xdg/autostart/huiontablet.desktop"

    # Install license
    install -Dm644 "$src_data/usr/lib/huiontablet/LGPL" \
        "$pkgdir/usr/share/licenses/huiontablet/LGPL"
}

# Maintainer: BABEL (Anya Desdein)
# Contributor: Ported from Debian package v15.0.0.175

# Ensure UTF-8 so bsdtar can handle pathnames with non-ASCII characters (e.g. Chinese in res/DevImg)
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

pkgname=huion-tablet-h610prov2
pkgver=15.0.0.175
pkgrel=1
pkgdesc="Huion Tablet Driver Setting Software (requires X11)"
arch=('x86_64')
url="https://www.huion.com"
license=('ISC' 'custom:Huion')
options=('!debug') #comment that if you need debug symbols
provides=('huion')
conflicts=('huiontablet')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols' 'libx11' 'libxext' 'libxrender' 'libxrandr' 'dbus' 'systemd-libs')
install=huion-tablet-h610prov2.install
source=("https://driverdl.huion.com/driver/Linux/HuionTablet_LinuxDriver_v${pkgver}.x86_64.deb"
        "huiontablet-launch.sh")
sha256sums=('bcf4d9263f2a82e942c79929a89d9841adef527febf91c43027ab3311f2c3ede'
            'd4a7faa8a401382b7da065b2bb56877057eb882a5ea066e52db593ed52b1f27b')

prepare() {
    cd "$srcdir"
    
    # Extract the .deb file that contains:
    # - debian-binary (version info)
    # - control.tar.xz (metadata and scripts)
    # - data.tar.xz (actual files)
    ar x "HuionTablet_LinuxDriver_v${pkgver}.x86_64.deb"
    
    # Extract data archive
    tar -xf data.tar.*
    
    # Use our launch script (fixes false "already running", quieter, stderr -> log)
    cp -f huiontablet-launch.sh usr/lib/huiontablet/huiontablet.sh
}

package() {
    cd "$srcdir"

    install -dm755 "$pkgdir/opt/huiontablet"
    cp -r usr/lib/huiontablet/* "$pkgdir/opt/huiontablet/"

    install -dm755 "$pkgdir/opt/huiontablet/share/icons"
    install -m644 usr/share/icons/huiontablet.png "$pkgdir/opt/huiontablet/share/icons/"

    install -dm755 "$pkgdir/usr/lib/udev/rules.d"
    install -m644 usr/lib/udev/rules.d/20-huion.rules "$pkgdir/usr/lib/udev/rules.d/"
    # H610 Pro v2 and similar use different input device names; without these, EventGet=-1
    echo '' >> "$pkgdir/usr/lib/udev/rules.d/20-huion.rules"
    echo '# H610 Pro v2 and similar (Huion Huion Tablet Pen / Huion Tablet)' >> "$pkgdir/usr/lib/udev/rules.d/20-huion.rules"
    echo 'SUBSYSTEM=="input", KERNEL=="event*", ATTRS{name}=="HUION Huion Tablet Pen", MODE:="0666"' >> "$pkgdir/usr/lib/udev/rules.d/20-huion.rules"
    echo 'SUBSYSTEM=="input", KERNEL=="event*", ATTRS{name}=="HUION Huion Tablet", MODE:="0666"' >> "$pkgdir/usr/lib/udev/rules.d/20-huion.rules"

    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/huiontablet/huiontablet.sh "$pkgdir/usr/bin/huiontablet"

    # Fix permissions for executables
    chmod +x "$pkgdir/opt/huiontablet/huiontablet"
    chmod +x "$pkgdir/opt/huiontablet/huionCore"
    chmod +x "$pkgdir/opt/huiontablet/huiontablet.sh"
    chmod +x "$pkgdir/opt/huiontablet/huionCore.sh"

    # Fix permissions for bundled xdotool
    if [ -f "$pkgdir/opt/huiontablet/xdotool/xdotool" ]; then
        chmod +x "$pkgdir/opt/huiontablet/xdotool/xdotool"
    fi

    # Remove temporary files that shouldn't be in the package
    rm -f "$pkgdir/opt/huiontablet/.DriverUI.pid"
    rm -f "$pkgdir/opt/huiontablet/.huion.log"
    rm -f "$pkgdir/opt/huiontablet/.HuionCore.pid"

    # Remove incompatible bundled libraries - use system libraries instead
    echo "Removing incompatible bundled libraries..."
    rm -f "$pkgdir/opt/huiontablet/libs/libdbus-1.so.3"
    rm -f "$pkgdir/opt/huiontablet/libs/libsystemd.so.0"

    # Allow users to write HUION_*.cfg (user config) in res/; binary has no XDG/config option
    chmod 777 "$pkgdir/opt/huiontablet/res"

    install -dm755 "$pkgdir/usr/share/applications"
    sed -e 's|/usr/lib/huiontablet/|/opt/huiontablet/|g' \
        -e 's|/usr/share/icons/huiontablet.png|/opt/huiontablet/share/icons/huiontablet.png|g' \
        usr/share/applications/huiontablet.desktop > "$pkgdir/usr/share/applications/huiontablet.desktop"
}
